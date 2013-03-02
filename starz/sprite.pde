class Sprite
{
  public PImage img;
  
  public float x,y;
  
  public Sprite(String file, float x, float y)
  {
    img = loadImage(file);
    this.x = x;
    this.y = y;
  }
  
  public void draw()
  {
    image(img,x-20,y);
  }
  
  public void right()
  {
    if (x <= width) 
    {
      x += 15;
    }
  }
  
  public void left()
  {
    if (x > 0)
    {
      x -= 15;
    }
  }
  
  public float x()
  {
    return this.x;  
  }
  
  public float y()
  {
    return this.y;  
  }
}
