class Spaceship extends Floater
{   

    public Spaceship(){
    	myCenterX = cx;
    	myCenterY = cy;
    	corners = 4;
    	xCorners = new int [corners];
        int [] tempCorX = {20,-20,-15,-20};
        xCorners = tempCorX;

    	yCorners = new int [corners];
        int [] corY = {0,-10,0,10};
        yCorners = corY;

    	myColor = color(255,255,255);
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myPointDirection = 0;
    }
    public void setX(int x){
    	myCenterX = x;
    }
    public int getX(){
    	return (int)myCenterX;
    }
    public void setY(int y){
    	myCenterY = y;
    }
    public int getY(){
    	return (int)myCenterY;
    }
    public void setDirectionX(double x){
    	myDirectionX = x;
    }
    public double getDirectionX(){
    	return myDirectionX;
    }
    public void setDirectionY(double y){
    	myDirectionY = y;
    }
    public double getDirectionY(){
    	return myDirectionY;
    }
    public void setPointDirection(int degrees){
    	myPointDirection = degrees;
    }
    public double getPointDirection(){
    	return myPointDirection;
    }
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

    	//"unrotate" and "untranslate" in reverse order
    	rotate(-1*dRadians);
    	translate(-1*(float)myCenterX, -1*(float)myCenterY);

    }
}
