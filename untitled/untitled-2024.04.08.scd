// 2024.04.07
// conditional logic

(
if (
	[0, 1].choose == 0,
	{ "0 was chosen".postln },
	{ "1 was chosen".postln }
);
)

(
~func = {
	arg input;
	if (
		input > 5,
		{ "sine".postln; },
		{ "noise".postln; }
	);
};
)

~func.value([5, 6].choose);


(
~func = {
	arg input;
	case
	{ input < 0 } 	{ "sine".postln; }
	{ input > 10 } 	{ "noise".postln; }
	{ true } 		{ "sawtooth".postln; };
};
)

~func.value(10);


// randomness

rrand(10, 20);
10.rrand(20);

3.squared;
squared(3);

exprand(1, 100);
exprand(1, 100).round;
exprand(1, 100).asInteger;


// usefull audio server utilites

(
~mySound = {
	arg freq=400;
	SinOsc.ar(freq, 0, 0.2, 0);
};
)

x = ~mySound.play;
x.free;

~mySound.plot(0.03);

(
~mySound = {
	arg freq=200;
	SinOsc.ar(freq, 0, 0.2, 0)!2;
};
)

x = ~mySound.play;
x.free;

s.volume.gui;


// making sound: UGens & function-dot-play

(
~mySound = {
	|freq|
	SinOsc.ar(freq, 0, 0.2, 0);
};
)

x = ~mySound.play(args: [\freq, 400]);

x.set(\freq, 300);
x.set(\freq, 200);

x.free;


(
~mySound = {
	arg freq;
	var sig;
	sig = SinOsc.ar(freq, 0, 0.2, 0);
	[sig, sig];
};
)

x = ~mySound.play(args: [\freq, 400]);


(
{
	var sig;
	sig = PinkNoise.ar(0.2);
	[sig, 0].reverse;
}.play;
)

(
{
	var sig;
	sig = PinkNoise.ar(0.2!2);
}.play;
)

//////

(
{
	arg freq=200;
	var sig;
	sig = SinOsc.ar(freq, 0, 0.2, 0);
	sig = sig + sig = SinOsc.ar(freq * 1.03, 0, 0.2, 0);
	sig!2;
}.play;
)


(
{
	arg freq=400;
	var sig, mod;
	sig = WhiteNoise.ar(0.1);
	mod = SinOsc.ar(1).range(0.1, 0.6);
	sig = sig * mod;
	sig!2;
}.play;
)


(
{
	arg freq=400;
	var sig, mod;
	sig = WhiteNoise.ar(0.1);
	mod = LFPulse.ar(8).range(0.1, 0.6);
	sig = sig * mod;
	sig!2;
}.play;
)
