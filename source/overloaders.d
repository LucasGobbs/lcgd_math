module overloaders;
/// Overloaders for the matrix class
template Overloaders(T, alias _width, alias _height){
    // Overloading ==========================================================================
	/// Binary Overloading { + - / *}
	Matrix opBinary(string op)(Matrix rhs){
		static if (op == "+") return Matrix.add(this, rhs);
		// else static if (op == "-") return data - rhs.data;
		else static assert(0, "Operator "~op~" not implemented");
	}
	/// Assign Overloading { += -= /= *}
	void opOpAssign(string op)(Matrix rhs){
		static if (op == "+") return this.add(rhs);
		else static assert(0, "Operator "~op~" not implemented");
	}
	/// indexing mat[0,0]
	ref T opIndex(int i, int j) { return this.get(i,j); }
	/// indexing mat[0]
	ref T opIndex(int i) { return this.get(0,i); }

}