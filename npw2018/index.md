---
title: "Nordic Perl Workshop and Mojoconf 2018 in Oslo, Norway"
layout: default
design: npw2018
---

{% assign d = site.data.npw2018 %}

{% include npw2018/sub_nav.html %}

Nordic Perl Workshop 2018 will be held in Oslo
at <a href="{{site.maps_url}}{{d.conference.where.maps_query}}">{{d.conference.where.name}}</a>,
{{d.conference.start | date: "%-d" }} - {{d.conference.stop | date: "%-d %B, %Y" }}.

The conference topic is ["Perl in the cloud"](/npw2018/info#theme), with focus on web
development, and deployment methods. We are pleased to announce that we will
have members from the [Mojolicious](http://mojolicious.org/) core team
attending and a track dedicated to the Mojolicious real-time web framework.

<a href="/npw2018/tickets" class="button -attention">Ticket information</a>

On the following Saturday, we're hosting a Perl hackathon. Do you have anything you
want to hack on? [Let us know](/npw2018/info#contact)!

## Venue
<a href="{{site.maps_url}}{{d.conference.where.maps_query}}">{{d.conference.where.name}}</a>

{% include maps.html maps_query=d.conference.where.maps_query %}

Note that the venue is not suitable for disabled persons, as we use the second and third floor
in a building without lifts.

The tram stop "Dalsbergstien" is right oustide the venue. Tram 17 and 18 take you here from
the city centre, with departures every fifth minute. It is not possible to buy tickets on
board, so we recommend using the Ruter Ticket App
[RuterBillett](https://ruter.no/en/buying-tickets/mobile-ticket-app/) - if you have a supported
credit card (check the first FAQ entry). It is possible to buy tickets for several people at
the same time, if you travel in a group.

## Partner

<img src="npw2018/images/KSAT_hovedlogo_farger2.png" alt="Kongsberg Satellite Services is sponsoring NPW2018">

## Latest news

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.tags[d.filter_name][i] %}
  {% if page.title %}
    {% include post.html %}
  {% endif %}
{% endfor %}
