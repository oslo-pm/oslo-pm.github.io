#!/usr/bin/env perl
use Mojo::Base -strict;

use Mojo::File 'path';
use Mojo::JSON 'encode_json';
use Mojo::Util 'trim';

my %hidden = (
  damian      => 1,
  mojoconf    => 1,
  mojolicious => 1,
  npw         => 1,
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
  path("blog/$tag.html")->spurt(make_filter($tag));
  next if $hidden{$tag};
  push @li,
    qq(<li class="{% if page.filter_name == '$tag' %} active{% endif %}"><a href="/blog/$tag.html">$tag</a></li>);
}

path('_data/tags.json')->spurt(encode_json \%data);

path('_includes/blog_menu.html')->spurt(<<"HERE");
<div class="blog-menu">
  <h4>Tag:</h4>
  <ul>
    <li class="{% if page.filter_name == 'all' %} active{% endif %}"><a href="/blog">all</a></li>
    @li
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
canonical_url: http://oslo.pm/blog/list.html
---

{% include blog_menu.html %}

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
