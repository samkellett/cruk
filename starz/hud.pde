
class HUD
{
  PImage image;
  int base_score;
  int score;
  int multiplier;
  
  HUD()
  {
    this.image = loadImage("HUD.png");
    
    this.base_score = 7777;
    this.score = 0;
    this.multiplier = 1;
  }
  
  void draw()
  {
    image(this.image, 0, height - this.image.height);
    
    
  }
  
  void score()
  {
    this.score += this.base_score * this.multiplier;
  }
}
