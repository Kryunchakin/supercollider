// 2024.09.11
// JITLib for live coding

NodeProxy.class;

n = NodeProxy.new;

n.isPlaying;

n.play;

n.isPlaying;

s.plotTree;

n.clear;

n.source;

n.source = { PinkNoise.ar(0.1!2) };

n.source = { SinOsc.ar([440, 441], mul: 0.1) * LFPulse.ar([2.5, 3])};

n.clear(6);


// fadeTime

n.play;

n.source_({ LPF.ar(Saw.ar([60, 60.2], mul: 0.05), 1000) });

n.fadeTime_(3);

n.source_({ LPF.ar(Saw.ar([60, 60.2], mul: 0.05), 2500) });

n.source_({ });

n.stop;

n.play;

n.monitor.fadeTime_(5);

n.release;


// Ndef

Ndef.class;

n = NodeProxy.new.play;

Ndef(\n).play;
Ndef(\n).fadeTime_(3);

(
Ndef(\n, { SinOsc.ar(200, mul: 0.2!2) });
)

Ndef(\n).clear(3);


// ProxySapce

(
~a = 3;
~b = 7;
)

currentEnvironment;

e = Environment.new;
e.push;

(
~a = 23;
~b = 8;
)

currentEnvironment;

e.pop;

currentEnvironment;


s.quit;
p = ProxySpace.new(s.boot).push;

currentEnvironment;

~x.play;

~x.fadeTime_(3);

~x = { LFTri.ar(300 + SinOsc.ar(12).bipolar(100), mul: 1.1!2) };

~x.release;

p.pop;
