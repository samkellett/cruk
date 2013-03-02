Parser parser;

ArrayList<Point> points;
ArrayList<Point> tracker;
int y;

Sprite sprite;
Score score;
public static PImage coin;
PImage background;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  coin = loadImage("Coin3.png");
  background = loadImage("grass_background.png");
  background(background);
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
  
  if (keyPressed)
  {
     switch (keyCode)
    {
      case LEFT: sprite.left(); score.score += 5; break;
      case RIGHT: sprite.right(); score.score += 5; break;
    }
  }
  background(background);
  for(Point p : points) {
//    if (underSprite(p.x(),p.y()))
//    {
       
    p.render();
    p.update();
  }
  sprite.draw();
  if (random(100) > 50)
  {
    score.score += 1;
  }
  score.draw();
  
  tracker.add(new Point(sprite.x, y));
  y += 7;
}

void keyPressed()
{
 
}

