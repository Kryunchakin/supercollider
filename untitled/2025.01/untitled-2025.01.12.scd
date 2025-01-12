// 2025.01.12

~myList = [11, 22, 33, 44, 55];

~myList.do({arg item, count; ("The item is '" ++ item ++ "' and the position is " ++ count).postln});

~myList.do({arg item, count; ("The position is " ++ count ++ " and the item is '" ++ item ++ "'").postln});

//

{SinOsc.ar()}.plot;
{SinOsc.kr(1).poll}.play;


{Saw.ar()}.plot;
{Saw.kr(1).poll}.play;


{Pulse.ar()}.plot;
{Pulse.kr(1).poll}.play;


{LFNoise0.ar()}.plot;
{LFNoise0.kr(1).poll}.play;


{LFPulse.ar}.plot;
{LFPulse.kr(1).poll}.play;

//

{LFNoise2.ar()}.plot;

{SinOsc.ar(freq: LFNoise0.kr(freq: 8).range(200, 500), mul: 0.1)!2}.play;

{SinOsc.ar(freq: Saw.kr(freq: 6).range(500, 1000), mul: 0.1)!2}.play;

{SinOsc.ar(freq: LFPulse.kr(freq: 10).range(400, 500), mul: 0.1)!2}.play;

//

{SinOsc.ar()}.plot;

{SinOsc.kr(1).range(100, 200).poll}.play;

{SinOsc.kr(1).poll}.play;

{SinOsc.kr(1, mul: 50).poll}.play;

{SinOsc.kr(1, mul: 50, add: 150).poll}.play;


{LFPulse.ar()}.plot;

{LFPulse.kr(1).poll}.play;

{LFPulse.kr(1).range(100, 200).poll}.play;

{LFPulse.kr(1, mul: 50).poll}.play;

{LFPulse.kr(1, mul: 50, add: 150).poll}.play;

//

x = {arg freq = 440, amp = 0.1; SinOsc.ar(freq: freq, mul: amp)!2}.play;

x.set(\freq, 420, \amp, 0.2);

x.set(\freq, 330, \amp, 0.1);

x.free;
