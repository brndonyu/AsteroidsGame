private int x,y,a,b,c,d;
private Star [] stars;
private Spaceship ship;
private ArrayList <Asteroid> asteroidList = new ArrayList <Asteroid> ();
private ArrayList <Bullet> bulletList = new ArrayList <Bullet> ();
private int cx = 600;
private int cy = 350;
private boolean shooting = false;
private boolean hyperspace = false;
private boolean rotatingLeft = false;
private boolean rotatingRight = false;
private boolean forward = false;
private boolean backward = false;
private int bulletCount = 0;
private int shipHealth = 10;

public void setup() 
{
	background(0);
  size(1200,700);
  ship = new Spaceship();
  for(int i = 0; i < 20; i++){
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
  System.out.println(shipHealth);
  background(0);
  fill(255);
	for(int i = 0; i < stars.length; i++){stars[i].show();}
  strokeWeight(0);
  ship.show();
  ship.move();

  for(int i = 0; i < asteroidList.size(); i++){
    Asteroid asteroid = asteroidList.get(i);
    asteroid.show();
    asteroid.move();
  }
  for(int i = 0; i < bulletList.size(); i++){
    Bullet bullet = bulletList.get(i);
    bullet.move();
    bullet.accelerate(1);
    bullet.show();

  }
  startHyperSpace();
  shipHitbox();
  //bulletHitbox();
  healthbar();
  victory();
  death();

  if(forward == true){ship.accelerate(0.25);}

  if(backward == true){ship.accelerate(-0.25);}

  if(rotatingLeft == true){ship.turn(-5);}

  if(rotatingRight == true){ship.turn(5);}

  if(shooting == true){
    if(frameCount % 20 ==0){
      bulletList.add(new Bullet());

    }
  }
}
public void shipHitbox(){
  for(int i = 0; i < asteroidList.size();i++){
      if(dist(asteroidList.get(i).getX(),asteroidList.get(i).getY(),ship.getX(),ship.getY()) < 30){
        shipHealth--;
        asteroidList.remove(i);
    }
  }
}
/*
public void bulletHitbox(){
  for(int i = 0; i < bulletList.size();i++){
      for(int u = 0; i < asteroidList.size(); i++){
          if(dist(bulletList.get(i).getX(), bulletList.get(i).getY(),asteroidList.get(u).getX(),asteroidList.get(u).getY()) < 30){
            bulletList.remove(i);
            asteroidList.remove(u);
          }
      }
    }
  }
*/
public void victory(){
  if(asteroidList.size() == 0){
      noLoop();
      fill(0,255,0);
      textAlign(CENTER);
      textSize(50);
      text("You Won!",cx,cy);
    }
}
public void death(){
  if(shipHealth == 0){
    noLoop();
    textAlign(CENTER);
    textSize(50);
    text("You Lost!",cx,cy);
  }
}
public void healthbar(){
  fill(255,0,0);
  rect(25,650,450,25,5);
  fill(0);
  rect(27.5,652.5,445,20);
  fill(255,0,0);
  rect(30,655,44*shipHealth,15);
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
  if(key == ' '){
    shooting = true;
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
  if(key == ' '){
    shooting = false;
  }
}