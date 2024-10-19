// 2024.09.13
// Pbind

Pbind(\degree, Pseries(0, 1, 30), \dur, 0.05).play;

Pbind(\degree, 0, \dur, 0.5).play;

// Pseq
Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1), \dur, 0.2).play;


(
Pbind(
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 5),
	\dur, Pseq([0.2, 0.1, 0.1], inf)
).play;
)

































































