private int x,y,a,b,c;
private Star [] stars;

public void setup() 
{
	background(0);
  size(1200,600);
  stars = new Star [200];
  for(int i = 0; i < stars.length; i++){
  	x = (int)(Math.random()*1200)+1;
  	y = (int)(Math.random()*600)+1;
  	a = (int)(Math.random()*255)+1;
  	b = (int)(Math.random()*255)+1;
  	c = (int)(Math.random()*255)+1;
  	stars[i] = new Star(x,y,a,b,c);
  }

}
public void draw() 
{
	for(int i = 0; i < stars.length; i++){
		stars[i].show();
	}
	
}

