#!/usr/bin/env perl
use Mojolicious::Lite;

use Mojo::File 'path';
use Text::CSV;

$ENV{USERS_EXPORT} ||= path(qw(local export.csv))->to_abs;

get '/' => sub {
  my $c   = shift;
  my $csv = Text::CSV->new({binary => 1});
  my @users;

  open my $USERS_EXPORT, '<', $ENV{USERS_EXPORT} or die "Read $ENV{USERS_EXPORT}: $!";
  my $head = $csv->getline($USERS_EXPORT);
  while (my $row = $csv->getline($USERS_EXPORT)) {
    my $i = 0;
    push @users, {map { ($head->[$i++], $_ eq '(None)' ? '' : $_) } @$row};
  }

  $c->render('nametags', users => [sort { $a->{first_name} cmp $b->{first_name} } @users]);
};

app->start;

__DATA__
@@ nametags.html.ep
% use Mojo::ByteStream 'b';
% use Locale::Codes::Country;
<!DOCTYPE html>
<html>
<head>
  <title>Nametags for <%= int @$users %> users</title>
  <style>
    body, html {
      background: #fff;
      color: #111;
      font-family: Helvetica, Arial;
      font-size: 16px;
      margin: 0;
      padding: 0;
    }

    .sheet_user {
      text-align: center;
      border: 1px dotted #ddd;
      padding: 0.5cm;
      width: 9cm;
      height: 6.3cm;
      position: relative;
      box-sizing: border-box;
      display: flex;
      flex-direction: column;
      float: left;
    }

    .page-break {
      clear: both;
      page-break-before: always;
      page-break-after: always;
    }

    h1, h2, header, footer {
      line-height: 1.2em;
      margin: 0;
      padding: 0;
      flex-grow: 1;
    }

    h1 {
      font-size: 2.4rem;
      font-weight: 600;
    }

    h2 {
      font-size: 1.4rem;
      font-weight: 400;
    }

    header {
      color: #222;
    }

    footer {
      align-self: bottom;
      flex-grow: 0;
      color: #666;
    }
  </style>
</head>
<body>
  <div class="sheet">
    % my $i = 0;
    % for my $user (@$users) {
      % if ($i++ % 9 == 0) {
      <div class="page-break"></div>
      % }
      <section class="sheet_user">
        <header><%= $user->{company} || $user->{pm_group} || code2country($user->{country} || '') || b('&nbsp;') %></header>
        <h1><%= $user->{first_name} %> <%= $user->{last_name} %></h1>
        % if ($user->{nick_name}) {
          <h2><%= $user->{nick_name} %></h2>
        % }
        <footer>NPW & Mojoconf 2018</footer>
      </section>
    % }
  </div>
</body>
</html>
