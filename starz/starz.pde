Parser parser;
ArrayList<Point> points;

void setup()
{
  size(400, 600);
  frameRate(60);
  
  background(255);
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom1.txt");
}

void draw()
{
  background(255); 
  for(Point p : points) {
    p.render();
    p.update();
  }
}
