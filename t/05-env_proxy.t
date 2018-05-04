#!/usr/bin/env perl
use v5.14;

use Test::More;
use AnyEvent;
use AnyEvent::SlackRTM;

use AnyEvent::Socket qw( tcp_server );
use AnyEvent::Handle;

my $token = 'fake';
ok( !AnyEvent::SlackRTM->new($token)->{client}->env_proxy,
    "No proxy on the websocket client" );

my $rtm = AnyEvent::SlackRTM->new( $token, env_proxy => 1 );

ok $rtm->{client}->env_proxy,
    "Set the env_proxy from the passed in opt";

done_testing();
