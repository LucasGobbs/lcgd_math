module main;

import matrix;
import std.stdio;

// Operators
void main(){
	auto t = new Mat2!float([1.0f,2.0f]);
	t.print;
	auto v1 = new fVec4(1.0);
    auto v2 = new fVec4(2.0);

    v1 += v2;
    v1.log("v1 + v2",true);
    writeln("Testandooooo ",v1[0]);
    auto c = v1 + v2;
    c.log("static v1 + v2",true);
    v1.log("teste",true);

	writeln(t.width);
	t.fill(2.0f);
	t.print();
	t.identity;
	t.print();
}