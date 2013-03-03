import java.io.*;

Parser parser;

ArrayList<Point> points;

ArrayList<Point> tracker;
int y;

Sprite sprite;
Score score;
public static PImage coin;

ScrollingBackground background;
HUD hud;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  background = new ScrollingBackground();
  hud = new HUD();
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom1.txt");

  sprite = new Sprite("sprite2.gif", width / 2, height - 300);
  coin = loadImage("Coin3.png");
  // Initialise score to 0;
  score = new Score(0);
  
  tracker = new ArrayList<Point>();
  y = 0;
}

void draw()
{
  background.draw();
  if (keyPressed) {
    if (keyCode == LEFT) {
      sprite.left();
    }
    
    if (keyCode == RIGHT) {
      sprite.right();
    }
  }
  
  for (Point p : points) {
    if (sprite.underSprite(p.x(), p.y())) {
      if (!p.hidden()) {
        this.hud.score();
      }
      p.hide();
    }
       
    p.render();
    p.update();
  }
  
  sprite.draw();
  score.draw();
  
  tracker.add(new Point(sprite.x, y));
  y += 7;

  hud.draw();
}

void keyPressed()
{
  if(keyCode == ALT) {
    try {
      FileWriter writer = new FileWriter("output.txt");
     
      for(int i = 0; i < tracker.size(); i++) {
        writer.write(tracker.get(i) + System.getProperty("line.separator")); 
      }
     
      writer.close();
    } catch (Exception e) {
      println("Error");
    } 
  } 
}

