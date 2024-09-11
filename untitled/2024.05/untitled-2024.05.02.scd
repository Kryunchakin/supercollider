// 2024.05.02
// Filters

// LPF HPF BPF BRF

(
{
	var sig;
	sig = PinkNoise.ar(0.3 ! 2);
	sig = LPF.ar(
		in: sig,
		// never set it lower than 20
		// never set in higher than 20000
		freq: 500
	);
}.play;
)
