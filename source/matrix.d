module matrix;
import std.stdio;
import overloaders;
import operators;
/***/

class Matrix(T, alias _width, alias _height){
	static assert(_width > 0);
	static assert(_height > 0);

	private immutable int i_size = _width;
	private immutable int j_size = _height; 
	private T[_width][_height] data;
	
	// Basic Getters ==================================
	/**/
	int width(){return this.i_size;}
	/**/
	int height(){return this.j_size;}
	/**/
	ref T get(int i, int j){ 
		assert(i >= 0 && i <_height && j >= 0 && j < _width);
		return this.data[i][j];
	}

	// ================================================
	// Constructors ===================================
	/**/
	this(){
		this.data = new T[_width][_height];
	}
	/**/
	// TODO check column
	this(T[_width] array){
		this.data = array;
	}
	/// Creates and fills with value
	this(T value){
		this.data = new T[_width][_height];
		this.fill(value);
	}

	/// Creates a copy of given matrix
	this(Matrix original){
		this.data = new T[_width][_height];
		this.copy(original);
	}
	/// Makes this matrix a identity matrix
	void identity(){
		this.fill((i,j,l){
			if(i==j){
				return 1.0;
			} else {
				return 0.0;
			}
		});
	}
	
	
	/// Fill the matrix, with the value
	void fill(T d){
		foreach(int i, ref lines; this.data){
			foreach(int j, ref value; lines){
				value = d;
			}
		}
	}
	/// Fill the matrix, with the return of the function
	void fill(T function(int i, int j, int l) lmb){
		int linear = 0;
		foreach(int i, ref lines; this.data){
			foreach(int j, ref value; lines){
				value = lmb(i, j, linear);
				linear++;
			}
		}
	}
	/// Copy the data of other matrix
	void copy(Matrix original){
		foreach(int i, ref lines; this.data){
			foreach(int j, ref value; lines){
				value = original[i,j];
			}
		}
	}
	
	mixin Operators!(T, _width, _height);
	mixin Overloaders!(T, _width, _height); 


	///
	void print(bool simple = false){
		foreach(int i, ref lines; this.data){
			foreach(int j, ref value; lines){
				if(simple){
					write(value, " ");
				} else {
					writef("[%d][%d] = %.2f\t",i,j, value);
				}
			}
			writeln("");
		}
	}
	///
	void log(string txt, bool simple = false){
		writeln(txt);
		this.print(simple);
	}
	
}

// Vector Types
alias Vec2(T) = Matrix!(T, 2, 1);
alias fVec2 = Matrix!(float, 2, 1);
alias dVec2 = Matrix!(double, 2, 1);

alias Vec3(T) = Matrix!(T, 3, 1);
alias fVec3 = Matrix!(float, 3, 1);
alias dVec3 = Matrix!(double, 3, 1);

alias Vec4(T) = Matrix!(T, 4, 1);
alias fVec4 = Matrix!(float, 4, 1);
alias dVec4 = Matrix!(double, 4, 1);

// Matrices Types
alias Mat2(T) = Matrix!(T, 2, 2);
alias fMat2 = Matrix!(float, 2, 2);
alias dMat2 = Matrix!(double, 2, 2);

alias Mat3(T) = Matrix!(T, 3, 3);
alias fMat3 = Matrix!(float, 3, 3);
alias dMat3 = Matrix!(double, 3, 3);

alias Mat4(T) = Matrix!(T, 4, 4);
alias fMat4 = Matrix!(float, 4, 4);
alias dMat4 = Matrix!(double, 4, 4);