Table data;
Table path;

float position_min = MAX_FLOAT;
float position_max = MIN_FLOAT;
float ratio_min = MAX_FLOAT;
float ratio_max = MIN_FLOAT;

ArrayList<Point> points;

void setup()
{ 
  size(400, 600);
   
  background(255);
   
  points = new ArrayList<Point>();
   
  plot("S3_BAF_Chrom1.txt");  
  
  path = new Table("output.txt");
  
  noFill();
  stroke(255, 0, 0);
  beginShape();
  for (int row = 0; row < path.getRowCount(); row++) {
    float x = path.getFloatAt(row, 0);
    float y = path.getFloatAt(row, 1);
    vertex(x, y);
  }
  endShape();
}

void draw()
{ 
}

void plot(String file)
{
 data = new Table(file);
 
 for (int row = 0; row < data.getRowCount(); row++) {
   position_min = min(position_min, data.getFloatAt(row, 1));
   position_max = max(position_max, data.getFloatAt(row, 1));  

   ratio_min = min(ratio_min, data.getFloatAt(row, 2));
   ratio_max = max(ratio_max, data.getFloatAt(row, 2));
 }
 
 for (int row = 0; row < data.getRowCount(); row++) {
   float x = map(data.getFloatAt(row, 2), ratio_min, ratio_max, 0, width);
   float y = map(data.getFloatAt(row, 1), position_min, position_max, 0, height);
   
   Point p = new Point(x, y);
   points.add(p);
 }
 
 for(Point p : points) {
   point(p.x(), p.y()); 
 } 
}

class Point
{
  float x, y;

  Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  float x()
  {
    return this.x;
  }  
  
  float y()
  {
    return this.y;   
  }
}
