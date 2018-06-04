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

## Partners (Sponsors)

Being a [Partner](https://github.com/oslo-pm/NPW2018/issues/6) for this conference is a
good way to present your brand positively to the attendees, enabling you to build up 
your company's image within the Perl community.

We would like to help you create a meaningful relationship, providing you with
opportunities not only for advertising, but for making contacts and even
recruiting.

We have three partner packages; Bronze (at 1.000€), Silver (at 2.000€), and Gold
(at 5.000€). 

All partners get their logo with link on our web site. Bronze and Silver partners can place
a banner (type [L-Banner](https://www.mitostudios.com/wp-content/uploads/2010/12/110112-Premier-Pull-Up-Floor-Banners-1865_LR1024.jpg) 
with maximum width 100cm and height 220cm) at the venue. Gold partners can also get a table 
for presentations etc. during the whole conference.

Should you have any questions, feedback, or if you have already decided to
sponsor NPW or mojoconf please [contact us](/npw2018/info#contact) by sending an
email to [{{d.contact.email}}](mailto:{{d.contact.email}}).

## Latest news

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.tags[d.filter_name][i] %}
  {% if page.title %}
    {% include post.html %}
  {% endif %}
{% endfor %}
