public class Bullet extends Floater{

	public Bullet(){
	myCenterX = ship.myCenterX;
	myCenterY = ship.myCenterY;
	if(ship.myDirectionX >= 0){
		myDirectionX = ship.myDirectionX + 10;
	}
	else
	{
		myDirectionX = ship.myDirectionX-10;
	}
	if(ship.myDirectionY >= 0){
		myDirectionY = ship.myDirectionY + 10;
	}
	else
	{
		myDirectionY = ship.myDirectionY - 10;
	}
	myPointDirection = ship.myPointDirection;
	}
	public void move(){
		super.move();
	}
	public void show(){
		fill(255,0,0);
		ellipse((float)myCenterX,(float)myCenterY,5,5);
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