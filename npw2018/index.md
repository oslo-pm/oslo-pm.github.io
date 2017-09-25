---
title: "Nordic Perl Workshop and Mojoconf 2018 in Oslo, Norway"
layout: default
design: npw2018
---

{% assign d = site.data.npw2018 %}

## ***IMPORTANT! The following information is tentative!***

Nordic Perl Workshop 2018 will be held in Oslo
in <a href="{{site.maps_url}}{{d.conference.where.maps_query}}">{{d.conference.where.name}}</a>,
{{d.conference.start | date: "%-d" }} - {{d.conference.stop | date: "%-d %B, %Y" }}.

The conference topic is "Perl in the cloud", with focus on web development,
and deployment methods. We are pleased to announce that we will have members
from the [Mojolicious](http://mojolicious.org/) core team attending and
a track dedicated to the Mojolicious real-time web framework.

On the following Saturday, we're hosting a Perl hackathon. Do you have anything you
want to hack on? Let us know!

{% include maps.html maps_query=d.conference.where.maps_query %}

## Sponsorship

Sponsoring this conference is a good way to present your brand positively to
the attendees, enabling you to build up your company's image within the Perl
community.

We would like to help you create a meaningful relationship, providing you with
opportunities not only for advertising, but for making contacts and even
recruiting.

Should you have any questions, feedback, or if you have already decided to
sponsor mojoconf please contact us through the following email address:
[styret@oslo.pm](styret@oslo.pm).

## Latest news

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.tags[d.filter_name][i] %}
  {% if page.title %}
    {% include post.html %}
  {% endif %}
{% endfor %}
