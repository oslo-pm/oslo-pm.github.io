#!/usr/bin/env perl
use Mojo::Base -strict;

use Mojo::File 'path';
use Mojo::UserAgent;
use Mojo::Util 'trim';
use Time::Piece;

#
# $(rm _data/meetup.json) to import fresh data
#
# The data is also available in the jekyll templates.
# Check out about/index.md and look for "site.data.meetup."
#

my $overwrite = grep {/^-f/} @ARGV;
$ENV{OPM_MEETUP_FILE} = '_data/meetup.json';

unless (-e $ENV{OPM_MEETUP_FILE}) {
  my $data
    = Mojo::UserAgent->new->max_redirects(3)
    ->get('https://api.meetup.com/2/events?group_urlname=Oslo-pm&status=past,upcoming&desc=desc')
    ->res->body;

  # The ruby/jekyll json parser does not like "\/" escape sequences
  # It throws "found unknown escape character..."
  $data =~ s!\\\/!/!g;

  path($ENV{OPM_MEETUP_FILE})->spurt($data);
}

my $json = Mojo::JSON::decode_json(path($ENV{OPM_MEETUP_FILE})->slurp);
for my $event (@{$json->{results}}) {
  my $ts      = localtime($event->{time} / 1000);
  my $created = localtime($event->{created} / 1000);
  my $offset  = sprintf '+%02s00', $event->{utc_offset} / 1000 / 3600;
  my $when    = sprintf '%s %s %02s:%02s', $ts->month, $ts->mday, $ts->hour, $ts->minute;
  my $maps    = Mojo::URL->new('https://maps.google.com/maps');
  my $where   = join ', ',
    map { Mojo::Util::encode('UTF-8', $_) } grep {$_} $event->{venue}{name},
    $event->{venue}{address_1};
  my @content;

  $created = join ' ', $created->ymd, $created->hms;
  $event->{$_} = Mojo::Util::encode('UTF-8', $event->{$_}) for qw(description name);
  $where ||= 'TBD';

  my $description = Mojo::DOM->new(Mojo::Util::html_unescape($event->{description}));

  $maps->query(
    f  => 'q',
    hl => 'en',
    q  => join(', ',
      grep { defined $_ } $event->{venue}{address_1},
      $event->{venue}{city}    || 'Oslo',
      $event->{venue}{country} || 'no',
    ),
  );

  push @content, <<"HERE";
---
layout: post
title: "$event->{name}"
date: $created $offset
published: True
categories: event
tags: event
---

* When: $when
* Where: [$where]($maps)
* Join us at [Meetup]($event->{event_url})

HERE

  $description->find('p')->each(sub { push @content, trim($_[0]->content), "\n\n" });

  $maps->query->remove($_) for qw(f hl);
  $maps->query->param(key => 'AIzaSyASIjsQVcDWLnkdszZ-yw13Qcs-iFk8Q4Y');
  push @content, <<"HERE";
<iframe class="google-maps" src="https://www.google.com/maps/embed/v1/place?q=@{[$maps->query->to_string]}" width="600" height="300" frameborder="0" allowfullscreen></iframe>
HERE

  my $file = lc $event->{name};
  $file =~ s!\W+!-!g;
  $file =~ s!\W+$!!;
  $file =~ s!^\W+!!;
  $file = path("_posts", sprintf '%s-%s.md', $ts->ymd, $file);
  next if -s $file and !$overwrite;
  say "$file ...";
  $file->spurt(join '', @content);
}
