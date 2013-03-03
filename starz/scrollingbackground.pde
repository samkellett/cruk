
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
    
    y += 7;
    y %= height;
  }
  
  PImage pimage()
  {
    return image;
  }
}
