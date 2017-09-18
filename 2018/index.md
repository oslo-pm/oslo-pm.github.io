---
title: "Nordic Perl Workshop and Mojoconf 2018 in Oslo, Norway"
layout: default
design: npw_2018
---

<style>
body {
  background-image: url(/images/oliver-cole-112209.jpg);
  background-repeat: no-repeat;
  background-position: 50% 50%;
  background-size: cover;
  background-attachment: fixed;
}

nav {
  display: none;
}

.wrapper {
  background: rgba(255, 255, 255, 0.8);
  border-right: 1px solid #999;
  border-left: 1px solid #999;
  max-width: 45rem;
  padding: 3rem 1rem;
}

.info-title {
  font-size: 3rem;
  line-height: 1.4em;
  margin: 2rem 0 1rem 0;
}

.info-where {
  font-size: 2rem;
  margin: 2rem 0;
}

.info-when {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 3rem;
}

.google-maps {
  height: 320px;
}
</style>

{% assign d = site.data.npw_2018 %}

<h1 class="info-title">Nordic perl workshop and Mojoconf</h1>

<h2 class="info-where">in <a href="{{site.maps_url}}{{d.conference.where.maps_query}}">{{d.conference.where.name}}</a></h2>

<p class="info-when">{{d.conference.start | date: "%-d" }} - {{d.conference.stop | date: "%-d %B, %Y" }}</p>

Nulla ut fringilla augue. Maecenas posuere condimentum porta. Sed quis
placerat purus. Nullam eget sem ac justo venenatis eleifend sit amet eget
tortor. Integer vitae velit a quam tincidunt rhoncus at nec mi. Quisque vitae
consequat nisl. Sed porttitor diam eget porttitor convallis. Maecenas eros
est, consectetur a neque in, cursus lobortis eros.

{% include maps.html maps_query=d.conference.where.maps_query %}

## Latest news

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.tags[d.filter_name][i] %}
  {% include post.html %}
{% endfor %}
