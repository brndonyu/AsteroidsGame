class Asteroid extends Floater
{
	private int rotSpeed;
	public Asteroid(){
		rotSpeed = (int)(Math.random()*11-6);
	}
	public void move(){
		turn(rotSpeed);
		super.move();
	}
	public void show(){
		
	}

}