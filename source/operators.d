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
	///
	void add(Matrix b){

		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] += b[i,j];
			}
		}
	}
	///
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
	///
	void sub(Matrix b){
		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] -= b[i,j];
			}
		}
	}
	///
	static Matrix sub(Matrix a, Matrix b){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.sub(b);
		return c;
	}
	unittest{
		auto a = new fMat2(5.0f);
		auto a_2 = new fMat2(5.0f);

		auto b = new fMat2(3.0f);
		auto c = new fMat2(2.0f);

		a.sub(b);
		assert(a == c && fMat2.sub(a_2, b) == c);

	}

	///
	void scalar(T value){
		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] *= value;
			}
		}
	}
	///
	static Matrix scalar(Matrix a, T value){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.scalar(value);
		return c;
	}
	unittest{
		auto a = new fMat2(2.0f);
		auto a_2 = new fMat2(2.0f);
		auto b = 3.0f;

		a.scalar(b);
		assert(a == new fMat2(6.0f) && fMat2.scalar(a_2, b) == new fMat2(6.0f));

	}
}