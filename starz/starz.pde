Parser parser;
ArrayList<Point> points;

Sprite sprite;

void setup()
{
  size(400, 600);
  frameRate(60);
  
  background(255);
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom1.txt");

  sprite = new Sprite("sprite.png",200.0,400.0);
  
}

void draw()
{
  background(255); 
  for(Point p : points) {
    p.render();
    p.update();
  }
  sprite.draw();
}

void keyPressed()
{
  switch (keyCode)
  {
    case LEFT: sprite.x -= 10; println("Left"); break;
    case RIGHT: sprite.x += 10; println("Right"); break;
  }
}


