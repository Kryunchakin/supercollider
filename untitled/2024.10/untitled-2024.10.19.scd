// 2024.10.19

(
~synthA = Pbind(
	\freq, Pwhite(200, 500),
	\dur, Prand([0.15], inf),
	\amp, 0.2,
	\legato, Prand([0.1, 0.2, 0.3], inf)
).trace.play;

~synthB = Pbind(
	\freq, Pwhite(200, 250),
	\dur, Prand([0.3, 0.3], inf),
	\amp, 0.1,
	\legato, Prand([0.6, 0.8], inf)
).trace.play;
)

s.record;

(
(
~synthA = Pbind(
	\note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], inf, 3, 1),
	\dur, 0.3;
).trace.play;

~synthB = Pbind(
	\note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], inf, 3, 0.5),
	\dur, 0.15;
).trace.play;
)
)

s.stopRecording;

// Another Patterns

(
Pbind(
	\note, Pser([0, 2, 3, 5, 7, 8, 11, 12], 11),
	\dur, 0.15;
).trace.play;
)

(
p = Pbind(
	\note, Pxrand([0, 2, 3, 5, 7, 8, 11, 12], inf),
	\dur, 0.15;
).trace.play;
)

(
p = Pbind(
	\note, Pshuf([0, 2, 3, 5, 7, 8, 11, 12], 6),
	\dur, 0.15;
).trace.play;
)

(
Pbind(
	\note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], inf, 3, 1),
	\dur, 0.15;
).trace.play;
)

(
Pbind(
	\note, Pseries(0, 2, 15),
	\dur, 0.15;
).trace.play;
)

(
Pbind(
	\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], inf),
	\dur, Pgeom(0.1, 1.1, 25);
).trace.play;
)

(
Pbind(
	\note, Pseq([0, Pn(2, 3), 3, Pn(5, 3), 7, Pn(8, 3), 11, 12], 1),
	\dur, 0.15;
).trace.play;
)
