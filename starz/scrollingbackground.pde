
class ScrollingBackground
{
  PImage image;
  int y;
  
  ScrollingBackground(PImage background)
  {
    image = background;
    y = 0;
  }
  
  void draw()
  {
    image(image, 0, y - height);
    image(image, 0, y);
    
    y += starz.speed;
    y %= height;
  }
  
  PImage pimage()
  {
    return image;
  }
  
  public void setBackground(PImage image)
  {
    this.image = image;  
  }
}
