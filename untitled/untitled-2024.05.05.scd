// 2024.05.05
// Range-Mapping

(
var num;
num = (1..100);
num.plot;
)

(
var num;
num = (1..100);
[
	num,
	num.linexp(1, 100, 1, 100),
	num.explin(1, 100, 1, 100),
].plot;
)


(
{
	var sig;
	sig = SinOsc.ar([400, 402]);
	sig = sig.lincurve(-1, 1, -1, 1, 2);
	sig = sig * 0.2;
}.play;
)


// Buffers

b = Buffer.read(server: s, path: "{file}");

b.play;

b.query;

b.duration; // BufDur.kr
b.bufnum;
b.numFrames; // BufFrames;
b.numChannels;

thisProcess;
thisProcess.nowExecutingPath;

PathName.new(thisProcess.nowExecutingPath).parentPath ++ "{file}";

b.free;

Buffer.free;

s.options.numBuffers;

(
~path = PathName.new(thisProcess.nowExecutingPath).parentPath ++ "{file}";
d = Buffer.read(server: s, path: ~path);
)

(
~path = PathName.new(thisProcess.nowExecutingPath).parentPath ++ "{file}";
b = Buffer.read(server: s, path: ~path);
)


(
y = {
	var sig;
	sig = PlayBuf.ar(
		numChannels:  d.numChannels,
		bufnum: d.bufnum,
		loop: 1,
		rate: BufRateScale.kr(b) * rrand(-12, 12).midiratio
		// doneAction: Done.freeSelf
	);
};
)

(
x = {
	var sig;
	sig = PlayBuf.ar(
		numChannels:  b.numChannels,
		bufnum: b.bufnum,
		loop: 1
		// rate: BufRateScale.kr(b)
		// doneAction: Done.freeSelf
	);
};
)

x.play;
y.play;
