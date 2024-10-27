// 2024.10.22

(
a = Routine {
	var i = 0;
	loop {
		i.yield;
		i = i + 1;
	};
};

a.nextN(10);
)


(
a = Pseries(start: 0, step: 1, length: inf).asStream;

a.nextN(10);
)


p = Pseries(start: 0, step: 1, length: 10);
p.next;

q = p.asStream;
q.next;

r = p.asStream;
r.next;

q.next;

[q.next, r.next];

//

Pseq(list: [1, 2, 3, 4], repeats: 4).asStream.all;

Pser(list: [1, 2, 3, 4], repeats: 4).asStream.all;

Pslide([1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, false).asStream.all;

Pslide([1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, true).asStream.all;

Pslide([1, 2, 3, 4, 5, 6, 7, 8], 10, 3, 1, 0, false).clump(3).asStream.all;

(
p = Pbind(
    \degree, Prand([0, 1, 2, 4, 5], inf),
    \dur, 0.25
).trace.play;
)

(
p = Pbind(
    \degree, Pxrand([0, 1, 2, 4, 5], inf),
    \dur, 0.25
).trace.play;
)

(
p = Pbind(
    \degree, Pshuf([0, 1, 2, 4, 5], inf),
    \dur, 0.25
).trace.play;
)

(
p = Pbind(
    \degree, Pwrand((0..7), [4, 1, 3, 1, 3, 2, 1].normalizeSum, inf),
    \dur, 0.25
).trace.play;
)

Place([0, [1, 2], [3, 4, 5]], 3).asStream.all;

Place([0, [1, 2], [3, 4, 5]], 3).clump(3).do(_.postln);

(
p = Pbind(
    \degree, Ppatlace([
        Pseries(0, 1, 8),
        Pseries(2, 1, 7)
    ], inf),
    \dur, 0.25
).trace.play;
)

(
p = Pbind(
    \degree, Ptuple([
        Pseries(7, -1, 8),
        Pseq([9, 7, 7, 7, 4, 4, 2, 2], 1),
        Pseq([4, 4, 4, 2, 2, 0, 0, -3], 1)
    ], 1),
    \dur, 1
).trace.play;
)

(
p = Pbind(
    \degree, Pseries(-7, 1, 15),
    \dur, Pgeom(0.5, 0.89140193218427, 15)
).trace.play;
)

Pmeanrand(0.0, 1.0, inf).asStream.nextN(1000).histo(200, 0.0, 1.0).plot;

//

Scale.directory;
