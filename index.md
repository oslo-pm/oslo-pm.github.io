---
layout: default
---

# Velkommen til Oslo Perl Mongers!

Oslo.pm er en uformell faglig-sosial forening for alle som er interessert i programmeringsspråket Perl, CPAN, verktøyene som finnes der og Open Source-samfunnene rundt disse. Vi organiserer fagtreff, foredrag, sosiale samlinger, hackathons, konferanser og mer.

<a href="/about">Les mer »</a>

## Siste innlegg

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.posts[i] %}
  {% include post.html %}
{% endfor %}
