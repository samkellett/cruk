import java.io.*;

State state;

Parser parser;

ArrayList<Point> points;

ArrayList<Point> tracker;
int y;

Sprite sprite;

public Skin skin;

ScrollingBackground background;
HUD hud;

PImage masthead;
PFont font;
int step = 90;
int size = 50;

public static PImage coin;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  state = State.MENU;
  masthead = loadImage("masthead.png");
  font = loadFont("OpenSans-48.vlw");
}

void draw()
{
  if (state == State.MENU) {
    drawMenu();
  } else if (state == State.GAME) {
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
     
    tracker.add(new Point(sprite.x, y));
    y += 7;
  
    hud.draw();
  }
}

void mouseReleased()
{
  if (state == State.MENU) {
    int x = mouseX / step;
    int y = (mouseY - 75) / step;
    
    int level = constrain(x + (y - 1) * 4, 1, 22);
    state = State.GAME;
    
    changeSkin("granny"); //granny
    hud = new HUD();
  
    parser = new Parser();
    points = parser.points("S3_BAF_Chrom" + level + ".txt");
  
    tracker = new ArrayList<Point>();
    y = 0;
  }
}

void keyPressed()
{
  if (state == State.GAME) {
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
    
    if (key == '1') {
      changeSkin("granny");
    }
    
    if (key == '2') {
      changeSkin("space");
    }
    
    if (key == 'q') {
      state = State.MENU;
    }
  }
}

void drawMenu()
{
  background(#ffffff);
  image(masthead, 0, 0);
  
  
  int i = 0;
  
  textFont(font, 36);
  textAlign(RIGHT);
  for (int y = 1; y <= 6; y++) {
    for (int x = 1; x <= 4; x++) {
      i++;
      if (i > 22) {
        break;
      }
      
      noStroke();
      fill(#2e008b);
      rect(x * step, 75 + y * step, size, size);
    
      fill(#ffffff);
      text(i, x * step + size / 2 + 27, 75 + y * step + size);
    }
  }
}

void changeSkin(String skinName)
{
  if (skinName == "granny") {
    skin = new Granny();
  } else if (skinName == "space") {
    println("Changing to space");
    skin = new Space();
  }
  
  coin = skin.getCoin();
  sprite = new Sprite(skin.getSprite(), width / 2, height - 300);
  background = new ScrollingBackground(skin.getBackground());  
}

