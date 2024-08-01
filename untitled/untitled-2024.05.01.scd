// 2024.05.01

(
x = {
	var sig;
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * \amp.kr(-20.dbamp);
}.play;
)


// Arguments

(
x = {
	arg wdt = 0.9;
	var sig;
	sig = VarSaw.ar(freq: [ 300, 301 ], width: wdt);
	sig = sig * \amp.kr(-20.dbamp);
}.play;
)

s.scope;

x.set(\wdt, 0.5);

x.release(2);


(
x = {
	arg freq = #[ 300, 301 ], wdt = 0.9, amp = 0.1;
	var sig;
	sig = VarSaw.ar(freq: freq, width: wdt);
	sig = sig * amp;
}.play;
)

x.set(\amp, 0.2, \wdt, 0.1);

x.release(2);


(
f = {
	arg freq = 330, wdt = 0.9, amp = 0.1;
	var sig;
	freq.source.postln;
	sig = VarSaw.ar(freq: freq + [ 0, 3 ], width: wdt);
	sig = sig * amp;
	0;
};
)

f.value();


(
x = {
	arg freq = 330, wdt = 0.9, amp = 0.1;
	var sig;
	freq.source.postln;
	sig = VarSaw.ar(freq: freq.lag(0.2) + [ 0, 3 ], width: wdt);
	sig = sig * amp;
}.play;
)


// Envelopes (& doneActions)

(
x = {
	var sig;
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * \amp.kr(-20.dbamp);
}.play;
)

x.release(2);

(
e = Env.new(
	levels: [0, 1, 0],
	times: [0.5, 2],
	curve: [-4, -1]
);
)

e.plot;

(
x = {
	var sig, env;
	env = EnvGen.kr(
		Env.new(
			levels: [0, 1, 0],
			times: [0.5, 2],
			curve: [-4, -1]
		),
	);
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * env;
	sig = sig * -10.dbamp;
}.play;
)


(
x = {
	var sig, env;
	env = EnvGen.kr(
		Env.new(
			levels: [0, 1, 0],
			times: [0.5, 2],
			curve: [-4, -1]
		),
		doneAction: 2
	);
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * env;
	sig = sig * -10.dbamp;
}.play;
)


(
x = {
	var sig, env;
	env = Env.new(
			levels: [0, 1, 0],
			times: [0.5, 2],
			curve: [-4, -1]
	).kr(2);
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * env;
	sig = sig * -10.dbamp;
}.play;
)


(
x = {
	var sig, env;
	env = Env.new(
			levels: [0, 1, 0],
			times: [0.5, 2],
			curve: [-4, -1]
	).kr(0, \trig.kr(1));
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * env;
	sig = sig * -10.dbamp;
}.play(fadeTime: 0);
)


// SynthDef & Synth

(
x = {
	var sig;
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * -20.dbamp;
}.play;
)


(
SynthDef.new(\synth, {
	var sig;
	sig = VarSaw.ar(freq: [ 300, 301 ], width: 0.9);
	sig = sig * -20.dbamp;
	Out.ar(\out.kr(0), sig);
}).add;
)

x = Synth.new(\synth);

x.free;
