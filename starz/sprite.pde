class Sprite
{
  public Skin[] skins;
    
  private int i;
  public float x, y;
  
  PImage[] image;
  
  public Sprite(float x, float y)
  {   
    this.skins = new Skin[3];
    this.skins[0] = new Granny();
    this.skins[1] = new Space();
    this.skins[2] = new Bird();
    
    this.i = 0;
    this.x = x;
    this.y = y;
  }
  
  public Sprite(PImage[] image, float x, float y)
  {
    this.image = image;
    this.x = x;
    this.y = y;
  }
  
  public void draw()
  {
    image(image[i], this.x, this.y);  
    if(frameCount % 5 == 0) {
      i++;
      i %= image.length;
    }  
  }
  
  public void update()
  {
    this.skins[i].update();
  }
  
  public void render()
  {
    this.skins[i].render(this.x, this.y);
  }
  
  public void setPosition(float x, float y) 
  {
    this.x = x;
    this.y = y;  
  }
  
  public void right()
  {
    if (x <= width) 
    {
      x += 4;
    }
  }
  
  public void left()
  {
    if (x > 0)
    {
      x -= 4;
    }
  }
  
  public void randomMove()
  {
    if (random(1) > 0.5) 
    {
      left();
      left();
    }
    else
    {
      right();
      right();
    }
  }
    
  
  public void down()
  {
    y += 5;
  }
  
  public boolean underSprite(float x, float y)
  {
    return (x > this.x -30 && x < this.x + this.skins[i].getWidth() && y > this.y + 40 && y < this.y + this.skins[i].getHeight());
  }
  
  public void setSkin(int i)
  {
    this.i = i;  
  }
  
  public Skin getSkin()
  {
    return this.skins[i];  
  }
}
