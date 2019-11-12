class Spaceship extends Floater
{   
    /*
    public int [] bxCorners;
    public int [] byCorners;
    public int bcorners;
    */
    public Spaceship(){
    	myCenterX = cx;
    	myCenterY = cy;
    	corners = 18;
    	xCorners = new int [corners];
        int [] tempCorX = {50,40,0,10,60,70,0,-20,-10, -15 ,-10,-20,0,70,60,10,0,40};
        xCorners = tempCorX;

    	yCorners = new int [corners];
        int [] corY = {0,5,5,15,15,20,20,10,5, 0 ,-5,-10,-20,-20,-15,-15,-5,-5,0};
        yCorners = corY;

    	myColor = color(255,255,255);
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myPointDirection = 0;

        /*
        bcorners = 14;
        bxCorners = new int [bcorners];
        int [] tempBX = {-15,-10,-20,-25,-27,-32, -30,-35,-30,-32,-27,-25,-20,-10};
        bxCorners = tempBX;

        byCorners = new int [bcorners];
        int [] tempBY = {0,5,10,15,10,12, 5,0,-5,-12,-10,-15,-10,-5};
        byCorners = tempBY;
        */
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
        /*
        fill(255,0,0);
        beginShape();
        for (int nII = 0; nII < bcorners; nII++){
            vertex(bxCorners[nII], byCorners[nII]);
        }
        endShape(CLOSE);

    	//"unrotate" and "untranslate" in reverse order
    	rotate(-1*dRadians);
    	translate(-1*(float)myCenterX, -1*(float)myCenterY);
        */
    }

}
