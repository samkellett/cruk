public class Player
{
  PImage[] img;
  int i, size, max_size, min_size;
  float x, y;
  boolean strafe, dive;
  
  public Player(float x, float y)
  {
    this.img = new PImage[5];
    this.img[0] = loadImage("sprite/sprite_1.gif");
    this.img[1] = loadImage("sprite/sprite_2.gif");
    this.img[2] = loadImage("sprite/sprite_3.gif");
    this.img[3] = loadImage("sprite/left.gif");
    this.img[4] = loadImage("sprite/right.gif");
    
    this.strafe = false;
    this.dive = false;
    
    this.i = 0;
    this.size = 120;
    this.min_size = 40;
    this.max_size = 120;
    
    this.x = x;
    this.y = y;
  }  
  
  public void update()
  { 
    if(!this.strafe && !this.dive) {
      if(this.size < 120) {
        size += 4;
      }
    
      if(this.y < height - 200) {
        this.y += 4;
      }
      if(frameCount % 5 == 0) {
        this.i++;
        this.i %= 3;  
      }
    }
  }
  
  public void render()
  {
    image(this.img[this.i], this.x-this.size/2, this.y-this.size/2, this.size, this.size);   
  }
  
  public void strafe(int i)
  {
    this.x += i;
    this.strafe = true;
    this.i = (i > 0) ? 4 : 3;
    
    if(this.dive) {
      dive();  
    }
  }
  
  public void dive()
  {
    this.dive = true;
    if(this.size > this.min_size) {
      this.size -= 4;  
    }
    this.y -= 4;
    if(!this.strafe) {
      this.i = 2;
    }
  }
  

  public void setStrafe(boolean state)
  {
    this.strafe = state;
  }
  
  public void setDive(boolean state)
  {
    this.dive = state;  
  }
}
