class Asteroid extends Floater
{
	private int rotSpeed;
	public Asteroid(){
		rotSpeed = (int)(Math.random()*11-6);
		myColor = (156);
		myCenterX = (Math.random()*1200)+1;
		myCenterY = (Math.random()*700)+1;
		corners = 4;
		int [] astX = {10,10,-10,-10};
		int [] astY = {10,-10,-10,10};
		xCorners = new int [corners];
		xCorners = astX;
		yCorners = new int [corners];
		yCorners = astY;
		myDirectionX = 5;
    	myDirectionY = -5;
    	myPointDirection = 5;
	}
	public void move(){
		super.move();
		turn(rotSpeed);
	}
	public void setX(int x){myCenterX = x;}

    public int getX(){return (int)myCenterX;}

    public void setY(int y){myCenterY = y;}

    public int getY(){return (int)myCenterY;}

    public void setDirectionX(double x){myDirectionX = x;}

    public double getDirectionX(){return myDirectionX;}

    public void setDirectionY(double y){myDirectionY = y;}

    public double getDirectionY(){return myDirectionY;}

    public void setPointDirection(int degrees){myPointDirection = degrees;}

    public double getPointDirection(){return myPointDirection;}
	public void show(){
		fill(myColor);
    	translate((float)myCenterX, (float)myCenterY);
   		//convert degrees to radians for rotate()     
   		float dRadians = (float)(myPointDirection*(Math.PI/180));
    	//rotate so that the polygon will be drawn in the correct direction
    	rotate(dRadians);
    	//draw the polygon
    	beginShape();
    	for (int nI = 0; nI < corners; nI++){
      		vertex(xCorners[nI], yCorners[nI]);
    	}
    	endShape(CLOSE);
	}

}