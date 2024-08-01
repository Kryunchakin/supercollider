// 2024.04.30
// making sound

(
x = {
	PinkNoise.ar * 0.3;
}.play;
)


(
x = {
	PinkNoise.ar * -10.dbamp;
}.play;
)


(
x = {
	LFTri.ar(freq: 440, iphase: 0, mul: 0.4, add: 0);
}.play;
)

x.free;

(
x = {
	LFTri.ar(freq: 440, iphase: 0, mul: 0.4, add: 0);
}.plot;
)


(
x = {
	PinkNoise.ar * 0.3;
}.plot;
)


(
x = {
	var mod, sig;
	mod = LFTri.kr(1);
	sig = SinOsc.ar(200 + mod);
	sig = sig * -12.dbamp;
}.plot(0.02);
)


(
x = {
	var mod, sig;
	mod = LFTri.kr(1);
	sig = SinOsc.ar(200 + mod);
	sig = sig * -12.dbamp;
}.plot;
)


(
x = {
	var mod, sig;
	mod = LFTri.kr(1) * 200;
	sig = SinOsc.ar(200 + mod);
	sig = sig * -12.dbamp;
}.play;
)

{LFTri.kr(1)}.plot(4);


(
x = {
	var modmod, mod, sig;
	// modmod = PinkNoise.kr().range(1, 10);
	modmod = LFNoise0.kr().range(1, 10);
	mod = LFTri.kr(modmod) * 200;
	sig = SinOsc.ar(200 + mod);
	sig = sig * -12.dbamp;
}.play;
)


(
x = {
	var mod, sig;
	mod = LFNoise0.kr(freq: 5).range(200, 1000);
	sig = SinOsc.ar(mod);
	sig = sig * -12.dbamp;
}.play;
)


(
x = {
	var mod, sig;
	mod = LFPulse.kr(freq: 8);
	sig = SinOsc.ar(freq: 1000) * mod;
	sig = sig * -12.dbamp;
}.play;
)


(
x = {
	var sig;
	sig = [ SinOsc.ar(freq: 300), SinOsc.ar(freq: 304) ];
	sig = sig * -20.dbamp;
}.play;
)

(
x = {
	var sig;
	sig = SinOsc.ar(freq: [ 300, 304 ]);
	sig = sig * [ -20, -15 ].dbamp;
}.play;
)


[2, 3] * [4, 5];
[2, 3] * [4, 5, 6];
[2, 3] * [4, 5, 6, 7];

{ rrand(10, 1000) } ! 10;

{ exprand(10, 1000) } ! 10;


(
x = {
	var sig;
	sig = SinOsc.ar(freq: { exprand(100, 2000) } ! 10);
	sig = sig.sum;
	sig = sig * -20.dbamp;
	sig = sig ! 2;
}.play;
)

x.release(4);


(
x = {
	var sig;
	sig = SinOsc.ar(freq: { exprand(100, 2000) } ! 10);
	sig = Splay.ar(inArray: sig);
	sig = sig * -20.dbamp;
}.play;
)


(
x = {
	var sig;
	sig = SinOsc.ar(freq: { exprand(100, 2000).round(30) } ! 10);
	sig = Splay.ar(inArray: sig);
	sig = sig * -20.dbamp;
}.play;
)
