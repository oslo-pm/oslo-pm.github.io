#!/usr/bin/env perl
use Mojo::Base -strict;

use Mojo::File 'path';
use Mojo::UserAgent;
use Mojo::Util 'trim';

my $ua   = Mojo::UserAgent->new;
my $news = $ua->get('http://act.yapc.eu/mojo2014/news')->res->dom->at('.newsbox');
my @current;

$news->children->each(
  sub {
    save() if @current and $_[0]->tag eq 'h3';
    push @current, $_[0];
  }
);

save();

sub save {
  my $h2        = shift @current or return;
  my $info      = shift @current;
  my $event_url = $h2->at('a')->{href};
  my $title     = $h2->all_text;
  my (@content, @date);

  # 30/05/14 17:19 by John...
  $info = [split /\s+by\s+/, $info->all_text];
  @date = split /\D+/, $info->[0];

  push @content, <<"HERE";
---
layout: post
title: "$title"
date: 20$date[2]-$date[1]-$date[0] $date[3]:$date[4] +0200
event_url: "$event_url"
published: True
categories: event
tags: event mojoconf mojo2014 conference
---
HERE

  for my $tag (grep { $_->content =~ /\w/ } @current) {
    my $content = $tag->tag eq 'p' ? $tag->content : "$tag";
    $content =~ s!\r!!g;
    $content = trim $content;
    push @content, sprintf "\n%s\n", Mojo::Util::encode('UTF-8', $content);
  }

  my $file = lc $title;
  $file =~ s!\W+!-!g;
  $file =~ s!\W+$!!;
  $file =~ s!^\W+!!;
  $file
    = path("_posts", sprintf '%s-%s-%s-%s.md', "20$date[2]", $date[1], $date[0], $file);

  warn "Saving $file ...\n";
  $file->spurt(join '', @content);
  @current = ();
}
