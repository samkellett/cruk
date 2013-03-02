Parser parser;
Path path;
Player player;

ArrayList<Point> points;

void setup()
{
  size(400, 200);
  frameRate(60);
  
  background(255);
  
  parser = new Parser();
  path = new Path();
  player = new Player(width/2, height);
  points = parser.points("S3_BAF_Chrom1.txt");
}

void draw()
{
  background(255);
  
  for(Point p : points) {
    p.render();
    p.update();
  }
  
  player.render();
}

void keyPressed()
{
  if (keyCode == LEFT) {
    player.setX(-1);
    path.addPoint(player.x(), player.y());
  }
  
  if (keyCode == RIGHT) {
    player.setX(1);
    path.addPoint(player.x(), player.y()); 
  }

  if (keyCode == UP) {
    player.setY(-1);
    path.addPoint(player.x(), player.y()); 
  }

  if (keyCode == DOWN) {
    player.setY(1);
    path.addPoint(player.x(), player.y()); 
  }  
  
  if (keyCode == ALT) {
    path.write();  
  }
}
