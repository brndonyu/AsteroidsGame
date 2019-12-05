private int x,y,a,b,c,d;
private Star [] stars;
private Spaceship ship;
private ArrayList <Asteroid> asteroidList = new ArrayList <Asteroid> ();
private int cx = 600;
private int cy = 350;
private boolean hyperspace = false;
private boolean rotatingLeft = false;
private boolean rotatingRight = false;
private boolean forward = false;
private boolean backward = false;

public void setup() 
{
	background(0);
  size(1200,700);
  ship = new Spaceship();
  for(int i = 0; i < 10; i++){
    asteroidList.add(new Asteroid());
  }
  stars = new Star [200];
  for(int i = 0; i < stars.length; i++){
  	x = (int)(Math.random()*1200)+1;
  	y = (int)(Math.random()*800)+1;
  	a = (int)(Math.random()*255)+1;
  	b = (int)(Math.random()*255)+1;
  	c = (int)(Math.random()*255)+1;
    d = (int)(Math.random()*10)+1;
  	stars[i] = new Star(x,y,a,b,c,d);
  }

}
public void draw() 
{
  background(0);
  fill(255);
	for(int i = 0; i < stars.length; i++){stars[i].show();}
  strokeWeight(0);
  ship.show();
  ship.move();
  for(int i = 0; i < asteroidList.size(); i++){
    Asteroid temp = asteroidList.get(i);
    temp.show();
    temp.move();
  }
  startHyperSpace();
  if(forward == true){ship.accelerate(0.25);}

  if(backward == true){ship.accelerate(-0.25);}

  if(rotatingLeft == true){ship.turn(-5);}

  if(rotatingRight == true){ship.turn(5);}

}

public void startHyperSpace(){
    if(hyperspace == true){
        ship.setX((int)(Math.random()*1200));
        ship.setY((int)(Math.random()*600));
        ship.setPointDirection((int)(Math.random()*360));
        ship.setDirectionX(0);
        ship.setDirectionY(0);
    }
    hyperspace = false;
}
public void keyPressed(){
  if(key == 'w' || key == 'W'){
    forward = true;
  }
  if(key == 's' || key == 'S'){
    backward = true;
  }
  
  if(key == 'a' || key == 'A'){
    rotatingLeft = true;
  }
  if(key == 'd' || key == 'D'){
    rotatingRight = true;
  }
  if(key == 'r' || key == 'R'){
    hyperspace = true;
  }
}
void keyReleased(){
  if(key == 'w' || key == 'W'){
    forward = false;
  }
  if(key == 's' || key == 'S'){
    backward = false;
  }
  if(key == 'a' || key == 'A'){
    rotatingLeft = false;
  }
  if(key == 'd' || key == 'D'){
    rotatingRight = false;
  }
}