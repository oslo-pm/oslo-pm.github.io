---
title: Mojoconf 2014
layout: default
design: mojo2014
---

<h1>  Mojoconf 2014 - Course Information  </h1>  <h2 id="when_and_where">When and where</h2>
<p>
  <a href="http://act.yapc.eu/mojo2014/event/1547">The course</a> will take place at <a href="http://y3o.no">y3o</a>, <b>23rd of May</b> from <b>09:00</b> to <b>16:30</b>.
</p>

<p class="alert alert-info">
  The course is sold out. <a href="mailto:mojoconf14@oslo.pm">Contact us</a> if you
  have questions regarding the course.
</p>

<h2>Non-blocking services with Mojolicious</h2>

<p>The course will introduce and prepare the student to implement, troubleshoot, and debug non-blocking clients and web-services quickly and succinctly, giving apps unprecedented scalability, handling 100s and even 1000s of effectively simultaneous actions per process.</p>

<h3 id="prerequisites">Prerequisites</h3>

<p>Students are expected to have a basic familiarity with Perl and web development. For those that need to brush up, <a href="http://qntm.org/files/perl/perl.html">http://qntm.org/files/perl/perl.html</a> is an accessible, free resource. Skimming over the tutorial at <a href="http://mojolicious.org/perldoc/Mojolicious/Lite">http://mojolicious.org/perldoc/Mojolicious/Lite</a> and the first four guides listed on <a href="http://mojolicious.org/perldoc/">http://mojolicious.org/perldoc/</a> will do.</p>

<p>Students are recommended to bring laptops running OSX or Linux. Windows will work for much of the labs, although high performance examples may not operate as expected.</p>

<p>
  Please arrive with <a href="http://www.perl.org/">Perl</a> 5.16.3+,
  <a href="https://metacpan.org/release/Mojolicious">Mojolicious</a> 4.98+,
  <a href="http://cpanmin.us/">App::cpanminus</a> and
  <a href="https://metacpan.org/release/Modern-Perl">Modern::Perl</a>
  installed.
  For those using lower versions of Perl, <a href="http://perlbrew.pl">http://perlbrew.pl</a> is recommended.
  Please <a href="mailto:mojoconf14@oslo.pm">contact us</a> if you have questions or need help arriving prepared.
</p>

<pre>
# Modules can be installed using the following command:
$ curl -L cpanmin.us | perl - Mojolicious Modern::Perl App::cpanminus

# System wide using --sudo
$ curl -L cpanmin.us | perl - --sudo Mojolicious Modern::Perl App::cpanminus
</pre>

<p>If the student can answer these questions easily, they are ready for the course. If not, the student can get up to speed using their favorite search engine. The student needs to have created at least one simple client script using Mojo::UserAgent and one simple daemon using Mojolicious or Mojolicious::Lite.</p>

* What is a URL?
* What is a URL parameter? How is it specified within a GET request?
* What is the difference between a POST and a GET request
* What is an API?
* What's the difference between a web page and a web application?
* What would a database be used for?
* How is a Perl script executed from a terminal?
* How do you create and call a Perl subroutine?
* How do you instantiate an object?

<h3>Format</h3>
<p>Course will be split up into lecture and lab sessions. Some labs, the students will work together. The instructor will be available for questions during the course of all labs. If the instructor is asked questions during the lecture, he will answer based on the fanciness of the respective student's outfit. Glitter definitely helps.</p>

<h3>Written Material</h3>
<p>Student will receive written material covering the topics of the class.</p>

<h3>Coverage</h3>
<p>Coverage of material may change depending on the pace of the students. Some topics may be skipped, but will be included in written material provided to the student.</p>

<h2 id="morning_lecture">Morning Lecture (1.5 hours)</h2>
<h3>Non-blocking theory</h3>

* Why it’s important
* High level explanation of how it’s done in Mojolicious
* Goals of non-blocking behavior - performance vs scalability

<h3>Implementation examples and explanation</h3>

* Sleeping without blocking
* Web scraping with Mojo::UserAgent
* Demonstration of difference between blocking and non-blocking web scraping
* Using callbacks and their drawbacks
* More advanced and maintainable alternative to callbacks
* Serial execution: alternative to callbacks

<p>Break</p>

<h2 id="morning_lab">Morning Lab (1.5 hours)</h2>

* Implementing non-blocking sleep
* Web scraping with callbacks
* Embedded callbacks
* Non-blocking without callbacks

<p>Lunch</p>

<h2 id="afternoon_lecture">Afternoon Lecture (1.5 hours)</h2>
<h3>Implementation examples and explanation</h3>

* Using non-blocking on the server side
* Server being an abstraction for remote non-blocking APIs
* Concurrent and serialized non-blocking calls
* Authentication: using blocking bridges vs using non-blocking bridges
* Converting blocking applications to non-blocking: techniques and gotchas
* Troubleshooting non-blocking, how it differs from blocking

<p>Break</p>

<h2 id="afternoon_lab">Afternoon Lab (1.5 hours)</h2>
<h3>Implementation examples and explanation</h3>

* Implementing a non-blocking server API that consumes remote APIs
* Implementing non-blocking authentication
* Implementing concurrent, serial, and mixes of the two

<h3>Troubleshooting practice</h3>

* Troubleshooting provided non-blocking problem, practice of troubleshooting techniques

<h2 id="biography">Biography</h2>
<p>Glen (<a href="http://twitter.com/tempire">tempire</a>) Hinkle is a core developer for Mojolicious, as well as the author of the <a href="http://mojocasts.com/">Mojocasts</a>. He’s used Perl for nearly 15 years, is a fan of functional programming, and likes pretty things.</p>
