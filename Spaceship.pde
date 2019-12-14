class Spaceship extends Floater
{   

    public Spaceship(){
        int [] ship1X = {15,-9,0,-9};
        int [] ship1Y = {0,-9,0,9};

    	myCenterX = cx;
    	myCenterY = cy;
    	corners = ship1X.length;
    	
    	xCorners = new int [corners]; 
        xCorners = ship1X;
    	yCorners = new int [corners];
        yCorners = ship1Y;

    	myColor = color(255,255,255);
    	myDirectionX = 0;
    	myDirectionY = 0;
    	myPointDirection = 0;

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

}
