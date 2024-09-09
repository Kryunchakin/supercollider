// 2024.09.09
// Routines

(
Buffer.freeAll;
b = (
    rhodesA: Buffer.read(server: s, path: ~path),
    rhodesB: Buffer.read(server: s, path: ~path),
);
)

b.keys();

b[\rhodesA].play;
b[\rhodesB].play;

(
f = {
	b[\rhodesA].play;
	0.wait;
	b[\rhodesB].play;
	0.wait;
};
)

(
r = Routine(f);
)

r.next;

r.reset;


(
Buffer.freeAll;
b = (
    drums: Buffer.read(server: s, path: ~path),
    rhodesA: Buffer.read(server: s, path: ~path),
);
)

(
f = {
	b[\rhodesA].play;
	0.wait;
	b[\drums].play;
	0.wait;
};

r = Routine(f);
)

r.play;

r.reset;


// As algorithmic data source (e.g. pitch generator)

(
~pchFn = {
	var note;
	loop{
		note = -12;
		note.yield;
		3.do{
			note = note + [2, 5, 7].choose;
			note.yield;
		};
	};
};

~pchGen = Routine(~pchFn);
)

~pchGen.next;


// TempoClock

TempoClock.default.tempo;


// Patterns, Events, Streams

(
p = Pseq([4, 9, 3], inf);
q = p.asStream;
)

q.nextN(20);


(
p = Prand([4, 9, 3], inf);
q = p.asStream;
)

q.nextN(20);


(
p = Pxrand([4, 9, 3], inf);
q = p.asStream;
)

q.nextN(20);


(
~pat = Pseries(50, 7, 5);
~seq = ~pat.asStream;
)

~seq.next;

(
~pat = Pseq([1, 2, 3], inf);
~pat = ~pat + Pseq([10, 20], inf);
~seq = ~pat.asStream;
)

~seq.next;


// Events

e = (abc: 5, def: 9, ghi: 3);

e.class;
e.keys;

e[\abc];
