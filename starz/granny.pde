class Granny implements Skin
{
  PImage[] sprite;
  PImage background;
  PImage coin;
  PImage[] enemy;
  PImage[] enemy2;
  public Granny()
  {
    sprite = new PImage[4];
    enemy = new PImage[4];
    enemy2 = new PImage[4];
    sprite[0] = loadImage("sprites/granny/1.png");
    sprite[1] = loadImage("sprites/granny/2.png");
    sprite[2] = loadImage("sprites/granny/3.png");
    sprite[3] = loadImage("sprites/granny/4.png");
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
  }
  PImage[] getSprite()
  {
    return sprite;
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
