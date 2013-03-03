import java.io.*;

State state;

Parser parser;

ArrayList<Point> points;

ArrayList<Point> tracker;
int y;

Sprite sprite;
Sprite enemy;

public Skin skin;

ScrollingBackground background;
HUD hud;

PImage masthead;
PImage logo;
PFont font;
int step = 90;
int size = 50;

int level;
public static int scale = 250;

public static PImage coin;

void setup()
{
  size(480, 800);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  state = State.MENU;
  masthead = loadImage("masthead.png");
  logo = loadImage("start_bottom.png");
  font = loadFont("OpenSans-48.vlw");
}

void draw()
{
  if (state == State.MENU) {
    drawMenu();
  } else if (state == State.GAME) {
    drawGame();
  } else if (state == State.RESULT) {
    drawResult();
  }
}

void mouseReleased()
{
  if (state == State.MENU) {
    int x = mouseX / step;
    int y = (mouseY - 75) / step;
    
    level = constrain(x + (y - 1) * 4, 1, 22);
    state = State.GAME;
      
    sprite = new Sprite(width / 2, height - 300);
    sprite.setSkin(0);

    background = new ScrollingBackground(sprite.getSkin().getBackground());  
    coin = sprite.getSkin().getCoin();
    hud = new HUD();
  
    parser = new Parser();
    points = parser.points("S3_BAF_Chrom" + level + ".txt");
  
    tracker = new ArrayList<Point>();
    y = 0;
  } else if (state == State.RESULT) {
    state = State.MENU;
  }
}

void keyPressed()
{
  if (state == State.GAME) {
    if (key == '1') {
      changeSkin(0);
    }
    
    if (key == '2') {
      changeSkin(1);
    }
    
    if (key == '3')
    {
      changeSkin(2);
    }
    
    if (key == 'q') {
      saveJourney();
      state = State.RESULT;
    }
  }
}

void drawMenu()
{
  background(#ffffff);
  image(masthead, 0, 0);
  image(logo, 0, height - logo.height);
  
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

void drawGame()
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

  
  if (frameCount % 700 == 0)
  {
    enemy = new Sprite(sprite.getSkin().getEnemy(), random(50,400), -150);
  }
  if (enemy != null)
  {
    enemy.draw();
    enemy.down();
    if (frameCount % 3 == 0)
    {
      enemy.randomMove();
    }
    
    if (sprite.underSprite(enemy.x, enemy.y))
    {
      this.hud.enemyCollide();
      enemy = null;
    }
  }
  if (enemy != null && enemy.y > 1000)
  {
    enemy = null;
  }
   
  if (enemy == null)
  {
    tracker.add(new Point(sprite.x, y));
  }
  y += 7;
  
  hud.draw();
  
  if (y > scale * height) {
    textFont(font, 36);
    textAlign(CENTER);
    
    stroke(#000000);
    fill(#ffffff);
    text("FINISHED!", width / 2, height / 2);
  }
  
  if (y > (scale + 2) * height) {
    saveJourney();
    state = State.RESULT;
  }
}

void drawResult()
{
  Table path = new Table(dataPath("output.txt"));
 
  background(#ffffff);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  beginShape();
  for(int i = 0; i < path.getRowCount(); i++) {
    float x = path.getFloatAt(i, 0);
    float y = path.getFloatAt(i, 1)/250;
    vertex(x, y);
  }
  endShape();
 
  Table data = new Table("S3_BAF_Chrom" + level + ".txt");

  float position_min = MAX_FLOAT;
  float position_max = MIN_FLOAT;
  float ratio_min = MAX_FLOAT;
  float ratio_max = MIN_FLOAT;
  float mean_min = MAX_FLOAT;
  float mean_max = MIN_FLOAT;
 
  for (int row = 0; row < data.getRowCount(); row++) {
    position_min = min(position_min, data.getFloatAt(row, 1));
    position_max = max(position_max, data.getFloatAt(row, 1));  

    ratio_min = min(ratio_min, data.getFloatAt(row, 2));
    ratio_max = max(ratio_max, data.getFloatAt(row, 2));
  }
 
  for (int row = 0; row < data.getRowCount(); row++) {
    float y = map(data.getFloatAt(row, 1), position_min, position_max, height, 0);
    float x = map(data.getFloatAt(row, 2), ratio_min, ratio_max, width, 0);
  
    noStroke();
    fill(#000000);
    ellipse(x, y, 2, 2); 
  }
}

void changeSkin(int i)
{
  sprite.setSkin(i);
  sprite.setPosition(sprite.x, sprite.y);
  
  coin = sprite.getSkin().getCoin();
  background.setBackground(sprite.getSkin().getBackground());
}

void saveJourney()
{
  try {
    String output = dataPath("output.txt");
    File file = new File(output);
    if (file.exists()) {
      file.delete();
    }
    
    FileWriter writer = new FileWriter(dataPath("output.txt"));
    for(int i = 0; i < tracker.size(); i++) {
      writer.write(tracker.get(i) + System.getProperty("line.separator")); 
    }
    
    writer.close();
  } catch (Exception e) {
    state = State.MENU;
    println("Error");
  }
}
