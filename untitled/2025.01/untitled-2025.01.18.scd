// 2025.01.18


// Audio Buses

{Out.ar(bus: 0, channelsArray: SinOsc.ar(freq: 440, phase: 0, mul: 1))}.play;


f = {Out.ar(0, BPF.ar(in: In.ar(55), freq: MouseY.kr(1000, 5000), rq: 0.1))}.play;
n = {Out.ar(55, WhiteNoise.ar(0.5))}.play;
n.free;


{Out.ar(0, Saw.ar(freq: [440, 570], mul: Line.kr(0, 1, [1, 2])))}.play;

{Out.ar(0, SinOsc.ar(freq: [600, 880], mul: LFPulse.ar(0.4)))}.play;


r = {Out.ar(0, FreeVerb.ar(In.ar(55, 2), mix: 0.5, room: 0.9, mul: 0.4))}.play;
a = {Out.ar(55, SinOsc.ar([800, 880], mul: LFPulse.ar(2)))}.play;
a.free;


// Control Buses

{Out.kr(55, LFNoise0.kr(1))}.play;
{In.kr(55).poll}.play;

~myControlBus = Bus.control(s, 1);
{Out.kr(~myControlBus, LFNoise0.kr(5).range(440, 880))}.play;
{SinOsc.ar(freq: In.kr(~myControlBus))!2}.play;


// Envelopes

// Env.perc
Env.perc.plot;
Env.perc(0.5).plot;
Env.perc(attackTime: 0.3, releaseTime: 2, level: 0.4).plot;
Env.perc(0.3, 2, 0.4, 0).plot;

{PinkNoise.ar(Env.perc.kr(doneAction: 2))!2}.play;
{PinkNoise.ar(Env.perc(0.3).kr(doneAction: 2))!2}.play;
{PinkNoise.ar(Env.perc(0.3, 2, 0.4).kr(2))!2}.play;
{PinkNoise.ar(Env.perc(0.3, 2, 0.4, 0).kr(2))!2}.play;

// Env.triangle
Env.triangle.plot;
{SinOsc.ar([440, 442], mul: Env.triangle.kr(2))!2}.play;
{SinOsc.ar([440, 442]) * Env.triangle.kr(2)!2}.play;

// Env.linen
Env.linen.plot;
{SinOsc.ar([300, 350], mul: Env.linen(0.01, 2, 1, 0.2).kr(2))!2}.play;

// Env.pairs
(
{
	var env = Env.pairs([[0, 0], [0.4, 1], [1, 0.2], [1.1, 0.5], [2, 0]], \lin);
	env.plot;
	SinOsc.ar([440, 442], mul: env.kr(2));
}.play;
)

(
{
	var freqEnv = Env.pairs([[0, 100], [0.4, 1000], [0.9, 400], [1.1, 555], [2, 440]], \lin);
	freqEnv.plot;
	SinOsc.ar(freqEnv.kr, mul: 0.2)!2;
}.play;
)

// ADSR Envelope

x = {arg gate = 1, freq = 440; SinOsc.ar(freq: freq, mul: Env.asr(0.5, 0.8, 3).kr(doneAction: 2, gate: gate))!2}.play;
x.set(\gate, 0);

(
d = {arg gate = 1;
	var snd, env;
	env = Env.adsr(0.01, 0.4, 0.7, 2);
	snd = Splay.ar(BPF.ar(Saw.ar((32.1, 32.2..33)), LFNoise2.kr(12).range(100, 1000), 0.05, 10));
	Out.ar(0, snd * env.kr(doneAction: 2, gate: gate));
}.play;
)
d.release;


// Synth Definitions

(
SynthDef(
	"mySine1",
	{
		Out.ar(0, SinOsc.ar(freq: 440, phase: 0, mul: 1)!2)
	}
).add;
)

x = Synth("mySine1");
x.free;


(
SynthDef(
	"mySine2",
	{
		arg freq = 440, amp = 0.4;
		var env = Env.perc(level: amp).kr(2);
		var snd = SinOsc.ar(freq, 0, env)!2;
		Out.ar(0, snd);
	}
).add;
)

x = Synth("mySine2");
Synth("mySine2", [\freq, 400, \amp, 0.4]);
Synth("mySine2", [\freq, rrand(440, 500), \amp, 0.5]);


// Pbind & SynthDef

(
Pbind(
	\instrument, "mySine2",
	\degree, Pwhite(−2, 6),
	\dur, Prand([0.125, 0.25], inf),
	\amp, Pwhite(0.5, 0.8),
	\wowrelease, 1
).play;
)
