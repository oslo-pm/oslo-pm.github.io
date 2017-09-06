#!/usr/bin/env perl
use Mojo::Base -strict;

use Mojo::File 'path';
use Mojo::UserAgent;
use Mojo::Util qw(trim url_escape);
use Time::Piece;

# The data is also available in the jekyll templates.
# Check out about/index.md and look for "site.data.meetup."

my $meetup_file = '_data/meetup.json';

# -l to use existing file on disk
unless (grep {/^-l$/} @ARGV) {
  my $data
    = Mojo::UserAgent->new->max_redirects(3)
    ->get(
    'https://api.meetup.com/2/events?group_urlname=Oslo-pm&status=past,upcoming&desc=desc'
    )->res->body;

  # The ruby/jekyll json parser does not like "\/" escape sequences
  # It throws "found unknown escape character..."
  $data =~ s!\\\/!/!g;

  path($meetup_file)->spurt($data);
}

my $json = Mojo::JSON::decode_json(path($meetup_file)->slurp);
for my $event (@{$json->{results}}) {
  my $when    = localtime($event->{time} / 1000);
  my $created = localtime($event->{created} / 1000);
  my $offset  = sprintf '+%02s00', $event->{utc_offset} / 1000 / 3600;
  my $tags    = 'event';
  my $where   = join ', ',
    map { Mojo::Util::encode('UTF-8', $_) } grep {$_} $event->{venue}{name},
    $event->{venue}{address_1};
  my @content;

  $created = join ' ', $created->ymd, $created->hms;
  $event->{$_} = Mojo::Util::encode('UTF-8', $event->{$_}) for qw(description name);
  $where ||= 'TBD';

  my $description = Mojo::DOM->new(Mojo::Util::html_unescape($event->{description}));

  my $file = lc $event->{name};
  $file =~ s!\W+!-!g;
  $file =~ s!\W+$!!;
  $file =~ s!^\W+!!;
  $file = path("_posts", sprintf '%s-%s.md', $when->ymd, $file);

  if (-e $file) {
    for my $line (split /\n/, $file->slurp) {
      $tags = $1 if $line =~ /tags:\s*(.+)/;
    }
  }

  my $maps_q = url_escape(
    join ', ',
    grep { defined $_ } $event->{venue}{address_1},
    $event->{venue}{city}    || 'Oslo',
    $event->{venue}{country} || 'no',
  );

  push @content, <<"HERE";
---
layout: post
title: "$event->{name}"
date: $created $offset
when: @{[$when->datetime]} $offset
where: "$where"
maps_query: "$maps_q"
event_url: "$event->{event_url}"
published: True
categories: event
tags: $tags
---

* When: {{page.when | date: site.event_date_format }}
* Where: [{{page.where}}]({{site.maps_url}}{{page.maps_query}})
* Join us at [Meetup]({{page.event_url}})

HERE

  $description->find('p')->each(sub { push @content, trim($_[0]->content), "\n\n" });
  push @content, qq({% include maps.html %});
  say "$file ...";
  $file->spurt(join '', @content);
}
