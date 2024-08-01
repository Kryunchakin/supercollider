// 2024.04.14
// arrays

x = [4.5, true, nil, 7, -100, \hello];

x.size;
x.reverse;
x.scramble;

x.at(3);
x[3];


x = (1..100);
x = (1, 3..100);

x = Array.series(100, 1, 1);


(
x = [0, 2, 4, 5, 7, 9, 11];
x = x + 3;
x = x.scramble.postln;
// x.at((0..3));
x.keep(4);
)


// functions and arguments

(
x = {
	var num;
	num = 8;
	num = num.squared;
	num = num - 1;
};
)

~actualNum = x.value;
~actualNum = x.value();
~actualNum = x.();


(
x = {
	arg num;
	num = num.squared;
	num = num - 1;
};
)

~result = x.value(23);


(
x = { |num = 23|
	num = num.squared;
	num = num - 1;
};
)

~result = x.value(23);


(
x = { |num = 23|
	var input, output;
	input = num;
	output = input.squared;
	output = output - 1;
	output;
};
)

~result = x.(23);


(
~makeNotes = {
	|root = 0|
	var scale = [0, 2, 4, 5, 7, 9, 11];
	var notes;
	scale = scale + root;
	notes = scale.scramble.keep(4);
};
)

~makeNotes.(1);


(
~makeNotes = {
	arg root = 0, numNotes = 4;
	var scale = [0, 2, 4, 5, 7, 9, 11], notes;
	scale = scale + root;
	notes = scale.scramble.keep(numNotes);
};
)

~makeNotes.(6, 2);


// randomness

rrand(1, 9.0);
exprand(1, 9.0);

{  rrand(1, 100) }.dup(8);

{  rrand(1, 100) } ! 8;


(
x = [0, 2, 4, 5, 7, 9, 11];
y = x.collect({
	arg item;
	// item.postln;
	item + rrand(2, 3);
});
)

x;
y;


(
x = [0, 2, 4, 5, 7, 9, 11];
y = x.do({
	arg item;
	// item.postln;
	item + rrand(2, 3);
});
)

x;
y;
