// 2024.04.07

(
var num;
num = 6;
num = num * 4;
num = num - 1;
)

(
~num;
~num = 6;
~num = ~num * 4;
~num = ~num - 1;
)

~num;

(
n;
n = 6;
n = n * 4;
n = n - 1;
)


// Function
(
~func = {
	var num;
	num = 6;
	num = num * 4;
	num = num - 1;
};
)

~func.value;

~num = ~func.value;


(
~func = {
	arg num;
	num = num * 4;
	num = num - 1;
};
)

~num = ~func.value(8);


(
~func = {
	|num|
	num = num * 4;
	num = num - 1;
};
)

~num = ~func.value(8);
~num = ~func.(8);


// Strings and Symbols
"this is a string"
"this is a string".class;
"this is a string".size;

$i
$i.class;

'symbol'
'symbol'.class;
'symbol'.size;

\symbol
\symbol.class;


// Arrays
~myArray = [1, "hi", 3.5, 7, \there, -12.001];
~myArray.class;
~myArray.size;


~nums = [150, 190, 240, 345];

~nums.at(0);
~nums[0];

~nums.reverse;
~nums.scramble;

~nums = ~nums.scramble;


// Unit Generators
s.boot;

(
~mysound = {
	SinOsc.ar(200, 0, 0.2, 0);
};
)

x = ~mysound.play;
x.free;


(
~mysound = {
	|freq|
	SinOsc.ar(freq, 0, 0.2, 0);
};
)

x = ~mysound.play(args: [\freq, 400]);
x.free;
