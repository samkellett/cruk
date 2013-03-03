class Bird implements Skin
{
  PImage[] images;
  PImage background;
  
  PImage coin;
  PImage coin1;
  
  PImage[] enemy;
  PImage[] enemy1;
  
  int i, image_width, image_height;
  
  public Bird()
  {
    images = new PImage[3];
    enemy = new PImage[4];
    enemy1 = new PImage[4];
    
    images[0] = loadImage("sprites/bird/1.gif");
    images[1] = loadImage("sprites/bird/2.gif");
    images[2] = loadImage("sprites/bird/3.gif");
    
    enemy[0] = loadImage("sprites/superman/1.gif");
    enemy[1] = loadImage("sprites/superman/2.gif");
    enemy[2] = loadImage("sprites/superman/3.gif");
    enemy[3] = loadImage("sprites/superman/4.gif");

    enemy1[0] = loadImage("sprites/plane/1.gif");
    enemy1[1] = loadImage("sprites/plane/1.gif");
    enemy1[2] = loadImage("sprites/plane/1.gif");
    enemy1[3] = loadImage("sprites/plane/1.gif");
    
    background = loadImage("backgrounds/sky.png");
    
    coin = loadImage("coins/cloud.png");
    
    this.i = 0;
    this.image_width = 120;
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
    return (random(1) > 0.5) ? enemy : enemy1;
  }
  
  String getAudio()
  {
    return "sound/bird.mp3";  
  }
}
