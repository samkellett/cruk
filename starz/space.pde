class Space implements Skin
{
  PImage[] sprite;
  PImage background;
  PImage coin;
  PImage[] enemy;
  PImage[] enemy2;
  public Space()
  {
    sprite = new PImage[4];
    enemy = new PImage[4];
    enemy2 = new PImage[4];
    sprite[0] = loadImage("sprites/space/1.gif");
    sprite[1] = loadImage("sprites/space/2.gif");
    sprite[2] = loadImage("sprites/space/3.gif");
    sprite[3] = loadImage("sprites/space/4.gif");
    enemy[0] = loadImage("sprites/ufo/1.gif");
    enemy[1] = loadImage("sprites/ufo/2.gif");
    enemy[2] = loadImage("sprites/ufo/3.gif");
    enemy[3] = loadImage("sprites/ufo/4.gif");
    enemy2[0] = loadImage("sprites/galaxy/1.gif");
    enemy2[1] = loadImage("sprites/galaxy/2.gif");
    enemy2[2] = loadImage("sprites/galaxy/3.gif");
    enemy2[3] = loadImage("sprites/galaxy/4.gif");
    background = loadImage("backgrounds/stars.png");
    coin = loadImage("coins/star.png");
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
