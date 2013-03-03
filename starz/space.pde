class Space implements Skin
{
  PImage[] images;
  PImage background;
  PImage coin;
  PImage[] enemy;
  PImage[] enemy2;
  
  int i, image_width, image_height;
  
  public Space()
  {
    images = new PImage[4];
    images[0] = loadImage("sprites/space/1.gif");
    images[1] = loadImage("sprites/space/2.gif");
    images[2] = loadImage("sprites/space/3.gif");
    images[3] = loadImage("sprites/space/4.gif");
    background = loadImage("backgrounds/stars.png");
    coin = loadImage("coins/star.png");
    
    this.i = 0;
    this.image_width = 60;
    this.image_height = 120;
  }
  
  public void update()
  {
    if(frameCount % 5 == 0) {
      i++;
      i %= images.length;
    }  
  }
  
  public void render(float x, float y)
  {
    image(this.images[i], x, y, this.image_width, this.image_height);
  }
  
  public int getWidth()
  {
    return this.image_width;  
  }
  
  public int getHeight()
  {
    return this.image_height;  
  }
  
  PImage getBackground()
  {
    return background;
  }
  
  PImage getCoin()
  {
    return coin;
  }
}
