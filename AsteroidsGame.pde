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
private int maxAsteroid = 10;
private int counter = 0;
private boolean shieldUp = true;
private int shieldHealth = 10;

public void setup() 
{
	background(0);
  size(1200,700);
  ship = new Spaceship();
  for(int i = 0; i < maxAsteroid; i++){
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
  ship.show();
  ship.move();
  spawn();
  startHyperSpace();
  shipHitbox();
  bulletHitbox();
  score();
  healthbar();
  shield();
  victory();
  death();

  if(forward == true){ship.accelerate(0.25);}

  if(backward == true){ship.accelerate(-0.25);}

  if(rotatingLeft == true){ship.turn(-5);}

  if(rotatingRight == true){ship.turn(5);}

  if(shooting == true){
    if(frameCount % 15 ==0){
      bulletList.add(new Bullet());

    }
  }
}
public void score(){
  fill(255);
  textSize(25);
  text("Score: " + counter, 1000, 675);
}
public void bCheck(){
  for(int i = 0; i < bulletList.size(); i++){
    if(bulletList.get(i).getX() > 1200 || bulletList.get(i).getX() < 0){
        bulletList.remove(bulletList.get(i));
    }
    if(bulletList.get(i).getY() > 700 || bulletList.get(i).getY() < 0){
      bulletList.remove(bulletList.get(i));
    }
  }
}
public void shipHitbox(){
  for(int i = 0; i < asteroidList.size();i++){
      if(dist(asteroidList.get(i).getX(),asteroidList.get(i).getY(),ship.getX(),ship.getY()) < 30){
        shipHealth--;
        asteroidList.remove(i);
        counter++;
    }
  }
}

public void bulletHitbox(){
  for(int i = 0; i < bulletList.size();i++){
      for(int u = 0; u < asteroidList.size(); u++){
          if(dist(asteroidList.get(u).getX(),asteroidList.get(u).getY(),bulletList.get(i).getX(), bulletList.get(i).getY()) < 30){
            asteroidList.remove(u);
            bulletList.remove(i);
            counter++;
            break;
          }
      }
    }
  }
public void spawn(){
  int t = second();
  if(t % 5 == 0){
    if(frameCount % 10 == 0){
      asteroidList.add(new Asteroid());
    }
  }
}
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
  rect(25,575,450,25,5);
  fill(0);
  rect(27.5,577.5,445,20);
  fill(255,0,0);
  rect(30,580,44*shipHealth,15);
  textSize(25);
  text("Health",25,557.5);
}
public void shield(){
  fill(55,141,253);
  rect(25,650,450,25,5);
  fill(0);
  rect(27.5,652.5,445,20);
  fill(55,141,253);
  rect(30,655,44*shieldHealth,15);
  textSize(25);
  text("Shield",25,632.5);
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