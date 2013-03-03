import java.io.*;
Parser parser;

ArrayList<Point> points;

ArrayList<Point> tracker;
int y;

Sprite sprite;
Sprite enemy;

public Skin skin;

ScrollingBackground background;
HUD hud;

public static PImage coin;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  changeSkin("granny"); //granny
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
  
  sprite.draw();
  enemy.draw();
  enemy.down();
  if (frameCount % 3 == 0)
  {
    enemy.randomMove();
  }
   
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
    changeSkin("granny");
  }
  else if (key == '2')
  {
    changeSkin("space");
  }
}

void changeSkin(String skinName)
{
  if (skinName == "granny")
  {
    skin = new Granny();
  } 
  else if (skinName == "space")
  {
    skin = new Space();
  }
  coin = skin.getCoin();
  if (sprite != null)
  {
    sprite = new Sprite(skin.getSprite(), sprite.x, sprite.y);
  }
  else
  {
    sprite = new Sprite(skin.getSprite(), width / 2, height - 300);
  }
  enemy = new Sprite(skin.getEnemy(), random(50,400), -150);
  background = new ScrollingBackground(skin.getBackground());
    
}

