public class Player
{
  PImage[] img;
  int i;
  float x, y;
  
  public Player(String file, float x, float y)
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
  
  public void update()
  {
  }
  
  public void render()
  {
    
  }
  
  public void dive()
  {
    
  }
}
