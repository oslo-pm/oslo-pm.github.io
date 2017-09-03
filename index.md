---
layout: default
---

# 🇳🇴 Velkommen til Oslo Perl Mongers!

Oslo.pm er en uformell faglig-sosial forening for alle som er interessert i programmeringsspråket Perl, CPAN, verktøyene som finnes der og Open Source-samfunnene rundt disse. Vi organiserer fagtreff, foredrag, sosiale samlinger, hackathons, konferanser og mer.

# 🇬🇧 Welcome to Oslo Perl Mongers!

Oslo.pm is an informal technical community open to all who are interested in the Perl programming language, CPAN, the tools you can find there and the related Open Source communities. We organize meetings, presentations, social events, hackathons, conferences and more.

<a href="/about">Les mer »</a>

## Siste innlegg

{% assign index = true %}
{% assign heading = "h3" %}
{% for i in (0..2) %}
  {% assign page = site.posts[i] %}
  {% include post.html %}
{% endfor %}
