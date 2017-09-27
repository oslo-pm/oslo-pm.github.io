#!/usr/bin/env perl
use Mojo::Base -strict;

use Mojo::File 'path';
use Mojo::JSON 'encode_json';
use Mojo::Util 'trim';

my %hidden = (
  damian      => 1,
  mojo2014    => 1,
  mojoconf    => 1,
  mojolicious => 1,
  npw         => 1,
  npw2009     => 1,
  npw2018     => 1,
  osdc        => 1,
  perl6       => 1,
  qa          => 1,
  social      => 1,
  szabgab     => 1,
  tempire     => 1,
);

my (@li, %data);

path('_posts')->list->each(
  sub {
    open my $POST, '<', $_ or die $!;
    while (<$POST>) {
      next unless /tags:(.*)/;
      ++$data{n_of}{$_} for split /\s+/, trim $1;
      last;
    }
  }
);

for my $tag (sort keys %{$data{n_of}}) {
  push @{$data{all}}, $tag;
  say "$tag = $data{n_of}{$tag}";
  path("news/$tag.html")->spurt(make_filter($tag));
  $data{state}{$tag} = $hidden{$tag} ? 'hidden' : 'visible';
  next if $hidden{$tag};
  push @li,
    qq(<li class="{% if page.filter_name == '$tag' %} active{% endif %}"><a href="/news/$tag.html">$tag</a></li>);
}

path('_data/tags.json')->spurt(encode_json \%data);

path('_includes/tag_menu.html')->spurt(<<"HERE");
<div class="tag-menu">
  <h4>Tag:</h4>
  <ul>
    <li class="{% if page.filter_name == 'all' %} active{% endif %}"><a href="/news">all</a></li>
    @li
    {% if site.data.tags.state[page.filter_name] == "hidden" %}
    <li class="active"><a href="/news/{{page.filter_name}}">{{page.filter_name}}</a></li>
    {% endif %}
  </ul>
</div>
HERE

sub make_filter {
  my $tag = shift;

  return <<"HERE";
---
layout: default
title: Entries by "$tag"
filter_name: $tag
canonical_url: http://oslo.pm/news/list.html
redirect_from:
- /blog/$tag.html
---

{% include tag_menu.html %}

{% assign index = true %}
{% for i in (0..2) %}
  {% assign page = site.tags.$tag\[i\] %}
  {% if page %}
    {% include post.html %}
  {% endif %}
{% endfor %}

{% for i in (3..100) %}
  {% if forloop.first %}<hr><ul class="entries-list">{% endif %}
  {% assign page = site.tags.$tag\[i\] %}
  {% if page %}
    <li>
      <a href="{{ page.url }}">{{ page.title }}</a>
      <small>{{ page.date | date: "%b %-d, %Y" }}</small>
    </li>
  {% endif %}
  {% if forloop.last %}</ul>{% endif %}
{% endfor %}
HERE
}
