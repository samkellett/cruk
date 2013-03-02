class Sprite
{
  public PImage[] img;
  
  private int imgInt;
  public float x,y;
  
  public Sprite(String file, float x, float y)
  {
    img = new PImage[4];
    img[0] = loadImage("sprite/sprite_1.png");
    img[1] = loadImage("sprite/sprite_2.png");
    img[2] = loadImage("sprite/sprite_3.png");
    img[3] = loadImage("sprite/sprite_4.png");
    imgInt = 0;
    this.x = x;
    this.y = y;
  }
  
  public void draw()
  {
    image(img[imgInt],x-20,y,60,120);
    if (frameCount % 5 == 0)
    {
      if (imgInt < 3) {
        imgInt++;
      } else {
        imgInt = 0;
      }
    }
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
}
