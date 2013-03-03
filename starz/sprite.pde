class Sprite
{
  public PImage[] img;
  
  private int imgInt;
  public float x,y;
  private int spriteWidth, spriteHeight;
  
  public Sprite(String file, float x, float y)
  {
    spriteWidth = 60;
    spriteHeight = 120;
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
    image(img[imgInt],x,y,spriteWidth,spriteHeight);
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
  
  public boolean underSprite(float x, float y)
  {
    return (x > this.x -30 && x < this.x + this.spriteWidth && y > this.y + 40 && y < this.y + this.spriteHeight);
  }
}
