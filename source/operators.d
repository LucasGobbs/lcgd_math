module operators;


/// Operators for the matrix classs
template Operators(T, alias _width, alias _height){
	static bool equal(Matrix a, Matrix b){
		assert(a.i_size == b.i_size && a.j_size == b.j_size);
		for(int i = 0; i < a.i_size; i++){
			for(int j = 0; j < a.j_size; j++){
				if(a[i,j] != b[i,j]){
					return false;
				}
			}
		}
		return true;
	}
	unittest{
		auto a = new Matrix(1.0f);
		auto b = new Matrix(1.0f);
		//assert(Matrix.equal(a,b));
	}
	/// Adds
	void add(Matrix b){
		writeln("a: ",this.i_size, " ", this.j_size);
		writeln("a: ",b.i_size, " ", b.j_size);
		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				writeln("i: ", i, " j: ", j);
				writeln(this.data[i][j]);
				writeln("a");
				writeln(b[i,j]);
			}
		}
	}
	/// Adds and creates
	static Matrix add(Matrix a, Matrix b){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.add(b);
		return c;
	}
	unittest{
		Matrix a = new Matrix(1.0f);
		Matrix a2 = new Matrix(1.0f);
		Matrix b = new Matrix(2.0f);
		Matrix c = new Matrix(4.0f);
		a.add(b);
		// assert( a == c && Matrix.add(a2,b) == c);
		// assert( 1 == 2);
	}
	/// Adds
	void sub(Matrix b){
		foreach(int i, ref lines; this.data){
			foreach(int j, ref value; lines){
				value -= b[i,j];
			}
		}
	}
	/// Adds and creates
	static Matrix sub(Matrix a, Matrix b){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.sub(b);
		return c;
	}
}