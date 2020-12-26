module operators;


/// Operators for the matrix classs
template Operators(T, alias _width, alias _height){
    // Operator ======================================================================
	/// Adds
	void add(Matrix b){
		foreach(int i, ref lines; this.data){
			foreach(int j, ref value; lines){
				value += b[i,j];
			}
		}
	}
	/// Adds and creates
	static Matrix add(Matrix a, Matrix b){
		auto c = new Matrix(a); //new Matrix!(T, _width, _height);
		c.add(b);
		return c;
	}
}