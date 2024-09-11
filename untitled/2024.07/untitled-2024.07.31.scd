// 2024.07.31

(
Buffer.freeAll;
b = (
    drums: Buffer.read(server: s, path: ~path),
    bass: Buffer.read(server: s, path: ~path),
    claves: Buffer.read(server: s, path: ~path),
    shaker: Buffer.read(server: s, path: ~path),
    rhodes: Buffer.read(server: s, path: ~path),
    guitar: Buffer.read(server: s, path: ~path)
);
)

b.keys;

b['\drums'];

b['\drums'].play;
b['\bass'].play;

// PlayBuf

(
SynthDef(
    \play, {
        arg buf = 0;
        var sig;
        sig = PlayBuf.ar(
            numChannels: 2,
            bufnum: buf,
            rate: BufRateScale.ir(buf) * \rate.kr(1),
            loop: \loop.kr(1),
            doneAction: 2
        );
        sig = sig * \amp.kr(0.5);
        Out.ar(\out.ir(0), sig)
}).add;
)

b.keys;

Synth(\play, [buf: b.drums, amp: -10.dbamp, loop: 0, rate: 0.midiratio]);


(
SynthDef(
    \play, {
        arg buf = 0;
        var sig, env;
        env = Env(
            levels: [0, 1, 0],
            times: [\atk.ir(0.001), (\rel.ir(0.5))],
            curve: [0, -4]
        ).ar(2);
        sig = PlayBuf.ar(
            numChannels: 2,
            bufnum: buf,
            rate: BufRateScale.ir(buf) * \rate.kr(1),
            loop: \loop.kr(1)
            // doneAction: 2
        );
        sig = sig * env;
        sig = sig * \amp.kr(0.5);
        Out.ar(\out.ir(0), sig)
}).add;
)

b.keys;

Synth(\play, [buf: b.drums, amp: -10.dbamp, loop: 0, rate: 0.midiratio, rel: 0.1]);


(
SynthDef(
    \play, {
        arg buf = 0;
        var sig, env;
        env = Env(
            levels: [0, 1, 0],
            times: [\atk.ir(0.001), (\rel.ir(0.5))],
            curve: [0, -4]
        ).ar(2);
        sig = PlayBuf.ar(
            numChannels: 2,
            bufnum: buf,
            rate: BufRateScale.ir(buf) * \rate.kr(1),
            trigger: Impulse.kr(\trighz.kr(6)),
            startPos: \spos.kr(0),
            loop: \loop.kr(1)
        );
        sig = sig * env;
        sig = sig * \amp.kr(0.5);
        Out.ar(\out.ir(0), sig)
}).add;
)

b.keys;

b.drums.numFrames;

(
2.do({
Synth(\play, [
    buf: b.drums,
    amp: -10.dbamp,
    loop: 1,
    rate: 0.midiratio,
    rel: rrand(2, 10),
    spos: rrand(0, b.drums.numFrames - 1),
    trighz: rrand(0.5, 2)
    ])
});
)

// BufRd

(
SynthDef(\read, {
    arg buf = 0;
    var sig, phs;
    phs = Line.ar(
        start: 0,
        end: BufFrames.ir(buf) - 1,
        dur: BufDur.ir(buf) * \durscl.ir(1),
        doneAction: 2
    );
    sig = BufRd.ar(
        numChannels: 2,
        bufnum: buf,
        phase: phs
    );
    sig = sig * \amp.kr(0.5);
    Out.ar(\out.ir(0), sig);
}).add;
)

(
2.do({
Synth(\read, [buf: b.drums, amp: 0.25, durscl: rrand(5, 1)]);
});
)


(
SynthDef(\read, {
    arg buf = 0;
    var sig, phs;
    phs = LFSaw.ar(
        freq: 1 / BufDur.ir(buf) * \rate.kr(1),
        iphase: 1
    ).range(0, BufFrames.ir(buf) - 1);
    sig = BufRd.ar(
        numChannels: 2,
        bufnum: buf,
        phase: phs
    );
    sig = sig * \amp.kr(0.5);
    Out.ar(\out.ir(0), sig);
}).add;
)


x = Synth(\read, [buf: b.drums, amp: 0.25]);
x.set(\rate, 2.midiratio);
x.free;
