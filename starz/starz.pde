Parser parser;
Path path;
Player player;

ArrayList<Point> points;

Sprite sprite;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom22.txt");

  sprite = new Sprite("sprite.gif",240.0,600.0);
  
}

void draw()
{
  background(57,181,74); 
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
    case LEFT: sprite.left(); break;
    case RIGHT: sprite.right(); break;
  }
}


