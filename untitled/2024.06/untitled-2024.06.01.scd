// 2024.06.01

s.makeWindow;


(
~path = "";
~drums = Buffer.read(server: s, path: ~path);
)

(
d = {
	var sig;
	sig = PlayBuf.ar(
		numChannels:  ~drums.numChannels,
		bufnum: ~drums.bufnum,
		loop: 1
		);
};
)


(
~path = "";
~bass = Buffer.read(server: s, path: ~path);
)

(
b = {
	var sig;
	sig = PlayBuf.ar(
		numChannels: ~bass.numChannels,
		bufnum: ~bass.bufnum,
		loop: 1
	);
};
)


(
~path = "";
~perc = Buffer.read(server: s, path: ~path);
)

(
p = {
	var sig;
	sig = PlayBuf.ar(
		numChannels: ~perc.numChannels,
		bufnum: ~perc.bufnum,
		loop: 1
	);
};
)

(
~path = "";
~rhodes = Buffer.read(server: s, path: ~path);
)

(
r = {
	var sig;
	sig = PlayBuf.ar(
		numChannels: ~rhodes.numChannels,
		bufnum: ~rhodes.bufnum,
		loop: 1
	);
};
)


(
~path = "";
~guitar = Buffer.read(server: s, path: ~path);
)

(
g = {
	var sig;
	sig = PlayBuf.ar(
		numChannels: ~guitar.numChannels,
		bufnum: ~guitar.bufnum,
		loop: 1
	);
};
)


d.play;
b.play;
p.play;
r.play;
g.play;
