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
    sprite[0] = loadImage("sprites/granny/1.png");
    sprite[1] = loadImage("sprites/granny/2.png");
    sprite[2] = loadImage("sprites/granny/3.png");
    sprite[3] = loadImage("sprites/granny/4.png");
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
}
