Parser parser;
ArrayList<Point> points;

Sprite sprite;

void setup()
{
  size(480, 600);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom4.txt");

  sprite = new Sprite("sprite.gif",240.0,600.0);
}

void draw()
{
  background(#A9E8E2); 
  
  for(int i = 0; i < points.size(); i++) {
    points.get(i).render();
    points.get(i).update(); 
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


