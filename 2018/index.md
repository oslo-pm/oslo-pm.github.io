---
title: "Nordic Perl Workshop and Mojoconf 2018 in Oslo, Norway"
layout: default
design: npw_2018
main_header_visible: true
---

{% assign d = site.data.npw_2018 %}

***DRAFT***

Nordic Perl Workshop 2018 will be held in Oslo
in <a href="{{site.maps_url}}{{d.conference.where.maps_query}}">{{d.conference.where.name}}</a>,
{{d.conference.start | date: "%-d" }} - {{d.conference.stop | date: "%-d %B, %Y" }}.

The conference topic is "Perl in the cloud", with focus on web development,
and deployment methods. We are therefor pleased to announce that we will
have members from the [Mojolicious](http://mojolicious.org/) core team and
a track dedicated to the Mojolicious real-time web framework.

On the following Saturday, we're hosting a Perl hackathon. Do you have anything you
want to hack on? Let us know!

{% include maps.html maps_query=d.conference.where.maps_query %}

## Sponsors

Want to sponsor the Nordic Perl Workshop 2018? Send an email to
[styret@oslo.pm](styret@oslo.pm) and we'll make the appropriate arrangements.

## Latest news

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.tags[d.filter_name][i] %}
  {% if page.title %}
    {% include post.html %}
  {% endif %}
{% endfor %}
