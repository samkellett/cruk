class Granny implements Skin
{
  PImage[] images;
  PImage background;
  PImage coin;
  PImage[] enemy;
  PImage[] enemy2;
  
  int i, image_width, image_height;
  
  public Granny()
  {
    images = new PImage[4];
    images[0] = loadImage("sprites/granny/1.png");
    images[1] = loadImage("sprites/granny/2.png");
    images[2] = loadImage("sprites/granny/3.png");
    images[3] = loadImage("sprites/granny/4.png");
    background = loadImage("backgrounds/grass.png");
    coin = loadImage("coins/coin.png");
    
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
