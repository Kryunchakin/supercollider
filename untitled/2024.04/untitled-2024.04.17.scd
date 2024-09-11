// 2024.04.17

s.makeWindow;

Platform.recordingsDir;

(
{
    // play with the room size
    var x;
    x = Klank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], Dust.ar(2, 0.1));
    x = Pan2.ar(x, -0.2);
    x = [x[0], DelayC.ar(x[1], 0.01, 0.01)]; // de-correlate
    FreeVerb.ar(x, 0.75, 0.9, 0.4);
}.scope;
)

(
{
    // play with the room size
    var x;
    x = Klank.ar(`[[200, 671, 1153, 1723], nil, [1, 1, 1, 1]], Dust.ar(2, 0.1));
    GVerb.ar(x, 105, 5, 0.7, 0.8, 60, 0.1, 0.5, 0.4) + x;
}.scope;
)

{ Formlet.ar(Impulse.ar(MouseX.kr(0.2,200,1), 0, 0.4), 200, 0.01, 0.1) }.scope(1, zoom:2);

{ LFPulse.ar(LFPulse.kr(LFPulse.kr(0.2,0,0.5,8,10),0,0.5, 200,400),0,0.5,0.1)!2 }.scope(1, zoom: 4);

{ LFPulse.ar(100,0,LFTri.kr(0.2,0,0.5,0.5),0.1) }.scope(1, zoom: 4);

{ SyncSaw.ar(10, Line.kr(100, 200, 12), 0.1) }.scope(1, zoom: 2);
