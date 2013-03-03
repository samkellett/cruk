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
    sprite[0] = loadImage("sprites/space/1.gif");
    sprite[1] = loadImage("sprites/space/2.gif");
    sprite[2] = loadImage("sprites/space/3.gif");
    sprite[3] = loadImage("sprites/space/4.gif");
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
}
