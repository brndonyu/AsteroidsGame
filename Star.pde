class Star //note that this class does NOT extend Floater
{
	private int myX;
	private int myY;
	private int myA;
	private int myB;
	private int myC;
  public Star(int x, int y, int a, int b, int c){
  		myX = x;
  		myY = y;
  		myA = a;
  		myB = b;
  		myC = c;
  	}
  	public void show(){
  		fill(myA,myB,myC);
  		ellipse(myX,myY,5,5);
  	}
}
