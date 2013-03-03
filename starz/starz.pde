import java.io.*;

Parser parser;

ArrayList<Point> points;

ArrayList<Point> tracker;
int y;

Sprite sprite;

public Skin skin;

ScrollingBackground background;
HUD hud;

public static PImage coin;

void setup()
{
  size(480, 800);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);

  sprite = new Sprite(width / 2, height - 300);
  sprite.setSkin(0);

  background = new ScrollingBackground(sprite.getSkin().getBackground());  
  coin = sprite.getSkin().getCoin();
  hud = new HUD();
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom1.txt");
  
  tracker = new ArrayList<Point>();
  y = 0;
  
  background(255);
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
  
  sprite.update();
  sprite.render();
   
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
  else if (key == '1')
  {
    changeSkin(0);
  }
  else if (key == '2')
  {
    changeSkin(1);
  }
}

void changeSkin(int i)
{
  sprite.setSkin(i);
  sprite.setPosition(sprite.x, sprite.y);
  
  coin = sprite.getSkin().getCoin();
  background.setBackground(sprite.getSkin().getBackground());
}

