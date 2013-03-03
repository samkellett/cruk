import java.io.*;

Parser parser;

ArrayList<Point> points;

ArrayList<Point> tracker;
int y;

Sprite sprite;
Score score;
public static PImage coin;
ScrollingBackground background;

void setup()
{
  size(480, 800);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  coin = loadImage("Coin3.png");
  background = new ScrollingBackground();
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom1.txt");

  sprite = new Sprite("sprite2.gif",240.0,600.0);
  // Initialise score to 0;
  score = new Score(0);
  
  tracker = new ArrayList<Point>();
  
  y = 0;
}

void draw()
{
  background.draw();
  if (keyPressed)
  {
     switch (keyCode)
    {
      case LEFT: sprite.left(); break;
      case RIGHT: sprite.right(); break;
    }
  }
  
  for(Point p : points) {
   
    if (sprite.underSprite(p.x(),p.y()))
    {
      if (!p.hidden())
      {
        score.score += 1;
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

  //println(tracker.get(tracker.size()-1));
}

void keyPressed()
{
  if(keyCode == ALT) {
    try {
      FileWriter writer = new FileWriter("output.txt");
     
      for(int i = 0; i < tracker_xs.size(); i++) {
        writer.write(tracker.get(i) + System.getProperty("line.separator")); 
      }
     
      writer.close();
      println("Done");
    }catch (Exception e) {println("Fucked");} 
  } 
}

