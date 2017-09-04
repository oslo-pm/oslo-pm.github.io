---
layout: post
title: "Perl6 workshop: Hvordan sette opp NativeCall til C-bibliotek"
date: 2015-01-20 19:07:50 +0100
when: 2015-02-04T18:30:00 +0100
where: "Teknologihuset, Pilestredet 56"
maps_query: "Pilestredet%2056%2C%20Oslo%2C%20no"
event_url: "https://www.meetup.com/Oslo-pm/events/219961292/"
published: True
categories: event
tags: event
---

* When: {{page.when | date: site.event_date_format }}
* Where: [{{page.where}}]({{site.maps_url}}{{page.maps_query}})
* Join us at [Meetup]({{page.event_url}})

Perl 6 har en del features som Perl 5 ikke har: typesignaturer, objektorientering langt inn i kjernen, og representasjonspolymorfisme. Til sammen gjør disse featurene at vi i Perl 6 (relativt) lett kan kalle på C-biblioteker, uten å måtte skrive C for å lime sammen ting. Temaet for workshopen er <i>NativeCall</i>, som er Perl 6 sin <i>Foreign Function Interface</i>.

<br>I dette foredraget skal Arne Skjærholt gi en praktisk demonstrasjon av dette i bruk, og vise hvordan funksjonalitet fra MySQL-biblioteket lett kan gjøres tilgjengelig, i ren Perl 6.

Etter presentasjonen av NativeCall-biblioteket blir det en workshop hvor du kan eksperimentere med biblioteket på egen hånd, med veiledning fra maintaineren av biblioteket.

Arne Skjærholt er doktorgradsstipendiat i datalingvistikk på Institutt for Informatikk. Han er en aktiv del av miljøet rundt Perl 6, og har for det meste jobbet med NativeCall-biblioteket og kompilatorinfrastrukturen.

Foruten Perl 6 er han særlig interessert i språk som ingen har snakket på tusenvis av år.

<b>For å delta på workshopen må du ta med følgende:</b>

• Egen ferdig-konfigurert laptop

• Rakudo Perl 6 installert (siste utgave av <a href="http://rakudo.org/">Rakudo Star </a>er bra, siden NativeCall følger med denne).

• Alternativt, så kan <a href="http://feather.perl6.nl/~tjs/talks/plpw14/rakudobrew/">rakudobrew </a>også hjelpe deg med å komme i gang. Men da må du passe på å installere Panda og NativeCall selv.

{% include maps.html %}