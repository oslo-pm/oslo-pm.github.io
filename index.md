---
layout: default
---

# Velkommen til Oslo Perl Mongers!

Oslo.pm er en uformell faglig-sosial forening for alle som er interessert i
programmeringsspråket Perl.

<a href="/about">Les mer »</a>

## Siste innlegg

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (1..3) %}
  {% assign page = site.posts[i] %}
  {% include post.html %}
{% endfor %}
