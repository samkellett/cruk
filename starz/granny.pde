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
    enemy = new PImage[4];
    enemy2 = new PImage[4];
    
    images[0] = loadImage("sprites/granny/1.png");
    images[1] = loadImage("sprites/granny/2.png");
    images[2] = loadImage("sprites/granny/3.png");
    images[3] = loadImage("sprites/granny/4.png");
    
    enemy[0] = loadImage("sprites/lake/1.gif");
    enemy[1] = loadImage("sprites/lake/2.gif");
    enemy[2] = loadImage("sprites/lake/3.gif");
    enemy[3] = loadImage("sprites/lake/4.gif");
    
    enemy2[0] = loadImage("sprites/pinkblob/1.png");
    enemy2[1] = loadImage("sprites/pinkblob/2.png");
    enemy2[2] = loadImage("sprites/pinkblob/3.png");
    enemy2[3] = loadImage("sprites/pinkblob/4.png");
    
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
  
  PImage[] getEnemy()
  {
    if (random(1) > 0.5)
    {
      return enemy;
    }
    else
    {
      return enemy2;
    }
  }
}
