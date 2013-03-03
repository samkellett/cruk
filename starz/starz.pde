import java.io.*;

Parser parser;

ArrayList<Point> points;
ArrayList<Float> tracker_xs;
ArrayList<Float> tracker_ys;

int y;

Sprite sprite;
Score score;
public static PImage coin;
ScrollingBackground background;
PImage hud;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  coin = loadImage("Coin3.png");
  background = new ScrollingBackground();
  hud = loadImage("hud.png");
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom1.txt");

  sprite = new Sprite("sprite2.gif",240.0,550.0);
  // Initialise score to 0;
  score = new Score(0);
  
  tracker_xs = new ArrayList<Float>();
  tracker_ys = new ArrayList<Float>();
  
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
  
  showScoreHud();
  
  tracker_xs.add(sprite.x);
  tracker_ys.add((float)y);
  
  y += 7;

  //println(tracker.get(tracker.size()-1));
}

void showScoreHud()
{
  image(hud,0,height - hud.height);
  score.draw(); 
}

void keyPressed()
{
  if(keyCode == ALT) {
    try {
      FileWriter writer = new FileWriter("output.txt");
     
      for(int i = 0; i < tracker_xs.size(); i++) {
        writer.write(tracker_xs.get(i) + "\t" + tracker_ys.get(i) + System.getProperty("line.separator")); 
      }
     
      writer.close();
      println("Done");
    }catch (Exception e) {println("Fucked");} 
  } 
}

