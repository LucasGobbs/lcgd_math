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

	///
	void schur(Matrix b){
		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] *= b[i,j];
			}
		}
	}
	///
	static Matrix schur(Matrix a, Matrix b){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.schur(b);
		return c;
	}
	unittest{
		auto a = new fMat2(5.0f);
		auto a_2 = new fMat2(5.0f);

		auto b = new fMat2(3.0f);
		auto c = new fMat2(15.0f);

		a.schur(b);
		assert(a == c && fMat2.schur(a_2, b) == c);

	}

	void op(Matrix b, T function(T va, T vb, int i, int j, int l) lmb){
		int linear = 0;
		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] = lmb(this.data[i][j], b[i,j], i, j, linear);
				linear++;
			}
		}
	}
	static Matrix op(Matrix a, Matrix b, T function(T va, T vb, int i, int j, int l) lmb){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.op(b, lmb);
		return c;
	}
	unittest{
		auto a = new fMat2(5.0f);
		auto a_2 = new fMat2(5.0f);

		auto b = new fMat2(3.0f);
		auto c = new fMat2(15.0f);
	
		a.op(b, (va,  vb,  i,  j,  l){
			return va * vb;
		});
	
		assert(a == c && fMat2.op(a_2, b, (va,  vb,  i,  j,  l){
			return va * vb;
		}) == c);
	}

	///
	void mult(Matrix b){
		assert(this.j_size == b.i_size);
		
		for(int i = 0; i < this.i_size; i++){
			for(int j = 0; j < this.j_size; j++){
				this.data[i][j] *= b[i,j];
			}
		}
	}
	///
	static Matrix mult(Matrix a, Matrix b){
		assert(a.j_size == b.i_size);
		auto c = new Matrix!(T, a.i_size, b.j_size)(); //new Matrix!(T, _width, _height);
		
		for(int i = 0; i < a.i_size; i++){
			for(int j = 0; j < b.j_size; j++){
				c.data[i][j] *= b[i,j];
			}
		}
		return c;
	}
}