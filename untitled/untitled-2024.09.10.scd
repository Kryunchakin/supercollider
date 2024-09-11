// 2024.09.10
// Signal Processing

(
SynthDef(\echo, {
	var sig, fx;
	Line.ar(0, 0, 4, doneAction: 2);
	sig = SinOsc.ar(\freq.ir(500) + [0, 3]);
	sig = sig * Env.perc(0.001, \rel.ir(1), 1, \crv.ir(-10)).ar(0);
	fx = CombL.ar(sig, 0.2, 0.2, 4);
	sig = sig + fx;
	sig = sig * \amp.ir(0.3);
	Out.ar(\out.ir(0), sig);
}).add;
)

Synth(\echo, [freq: rrand(45, 85).midicps, amp: 0.3]);


(
SynthDef(\echo, {
	var sig;
	sig = SinOsc.ar(\freq.ir(500));
	sig = sig * Env.perc(0.001, \rel.ir(1), 1, \crv.ir(-10)).ar(2);
	sig = sig * \amp.ir(0.3);
	Out.ar(\out.ir(0), sig);
}).add;
)

Synth(\echo, [freq: rrand(45, 85).midicps, amp: 0.3, out: 1]);


// Busses

s.options.numAudioBusChannels;
s.options.numOutputBusChannels;
s.options.numInputBusChannels;
s.options.numPrivateAudioBusChannels;

// Pass signal from one synth to the next

(
SynthDef(\src, {
	var sig;
	sig = SinOsc.ar(\freq.ir(500) + [0, 3]);
	sig = sig * Env.perc(0.001, \rel.ir(1), 1, \crv.ir(-10)).ar(2);
	sig = sig * \amp.ir(0.3);
	Out.ar(\out.ir(0), sig);
}).add;

SynthDef(\echo, {
	var sig;
	sig = In.ar(\in.ir(12), 2);
	sig = sig + CombL.ar(sig, 0.2, 0.2, 4);
	Out.ar(\out.ir(0), sig);
}).add;
)

Synth(\echo, [in: 12, out: 0]);
Synth(\src, [out: 12]);

s.freeAll;


s.newBusAllocators;
b = Bus.audio(s, 2);
Synth(\echo, [in: b, out: 0]);
Synth(\src, [out: b]);

c = Bus.audio(s, 2);
Synth(\echo, [in: c, out: 0]);
Synth(\src, [out: c]);


// Input/Output UGens

(
SynthDef(\mic, {
	var sig;
	sig = In.ar(\in.ir(2), 1);
	sig = sig * \amp.kr(0.25);
	sig = sig ! 2;
	Out.ar(\out.ir(0), sig);
}).add;
)

s.newBusAllocators;
~toDelay = Bus.audio(s, 2);

Synth(\echo, [in: ~toDelay, out: 0]);
x = Synth(\mic, [out: ~toDelay, amp: 0.7]);
x.free;


// Order of Execution
~toDelay = Bus.audio(s, 2);

(
SynthDef(\src, {
	var sig, freq;
	freq = LFNoise0.kr([7, 8]).range(45, 85).midicps;
	sig = SinOsc.ar(freq);
	sig = sig * Env.adsr().ar(2, \gate.kr(1));
	sig = sig * \amp.ir(0.3);
	Out.ar(\out.ir(0), sig);
}).add;

SynthDef(\echo, {
	var sig;
	sig = In.ar(\in.ir(4), 2);
	sig = sig + CombL.ar(sig, 0.2, 0.2, 4);
	Out.ar(\out.ir(0), sig);
}).add;
)

~fx = Synth(\echo, [in: ~toDelay, out: 0]);
~src = Synth(\src, [out: ~toDelay]);

~src.set(\gate, 0);

~fx.free;


// Groups, Targets

~fxgrp = Group.new;
~srcgrp = Group.new;

~fx = Synth(\echo, [in: ~toDelay, out: 0], ~fxgrp);
~src = Synth(\src, [out: ~toDelay],  ~srcgrp);

~fxgrp.free;
~srcgrp.free;


// AddActions

~src = Synth(\src, [out: ~toDelay]);

(
~fx = Synth(\echo,
	[in: ~toDelay, out: 0],
	target: ~src,
	addAction: \addAfter
);
)

~src.set(\gate, 0);

~fx.free;


// More on Control Busses & Audio Busses

s.options.numControlBusChannels;

x = { Out.kr(2, SinOsc.kr(1)) }.play;

x.free;

b = Bus.control(s, 4);

b.setn([0, 0, 0, 0]);
