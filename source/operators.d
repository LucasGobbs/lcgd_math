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
		auto a = new fMat2(1.0f);
		auto b = new fMat2(1.0f);
		assert(fMat2.equal(a,b) && a == b);
	}
	/// Adds
	void add(Matrix b){

		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] += b[i,j];
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
		auto a = new fMat2(1.0f);
		auto a_2 = new fMat2(1.0f);

		auto b = new fMat2(2.0f);
		auto c = new fMat2(3.0f);

		a.add(b);
		assert(a == c && fMat2.add(a_2, b) == c);

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