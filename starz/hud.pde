import java.text.*;
import java.math.*;

class HUD
{
  PImage image;
  PFont font;
  PFont mario;
  
  int base_score;
  long score;
  
  DecimalFormat formatter;

  int multiplier;  
  int multi_count;
  
  int timer;
  
  HUD()
  {
    this.image = loadImage("hud.png");
    this.font = loadFont("OpenSans-48.vlw");
    this.mario = loadFont("SuperMarioGalaxy-64.vlw");
    
    this.formatter = new DecimalFormat("0.#####E0");
    this.base_score = 77777;
    this.score = 0;
    
    this.multi_count = 1;
    this.multiplier = 1;
  }
  
  void draw()
  {
    image(this.image, 0, height - this.image.height);

    textFont(this.font, 48);
    String output;
    if (this.score > 100000000) {
      output = formatter.format(this.score).replace("E", "e");
    } else {
      output = "" + this.score; //parseLong(this.score);
    }
    textAlign(LEFT);
    text(output, 20, height - 20);
    
    textFont(this.mario, 36);
    textAlign(CENTER);
    text(this.multiplier, width - 62, height - 87);
    
    this.timer++;
    if (this.timer / frameRate > 0.5) {
      this.multiplier = 1;
    }
  }
  
  void score()
  {
    this.score += this.base_score * this.multiplier;
    this.timer = 0;
    
    this.multi_count++;
    this.multi_count %= 100;
    if (this.multi_count == 0) {
      ++this.multiplier;
    }
  }
}
