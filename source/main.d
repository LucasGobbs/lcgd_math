module main;

import matrix;
import std.stdio;

// Operators
void main(){
	auto a = new fMat2(1.0f);
	auto b = new fMat2(2.0f);
	auto c = a * 3.0f;
	writeln("a", fMat2.equal(c, new fMat2(3.0f)));
	c.print(true);
	writeln("teste: ", c == new fMat2(3.0f));
}