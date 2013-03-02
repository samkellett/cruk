Table data;

float position_min = MAX_FLOAT;
float position_max = MIN_FLOAT;
float ratio_min = MAX_FLOAT;
float ratio_max = MIN_FLOAT;
float mean_min = MAX_FLOAT;
float mean_max = MIN_FLOAT;

ArrayList<Point> points;

void setup()
{ 
 size(800, 300);
 
 background(255);
 
 points = new ArrayList<Point>();
 
 plot("S3_BAF_Chrom1.txt", height, 0);  
}

void draw()
{ 
}

void plot(String file, int y1, int y2)
{
 data = new Table(file);
 
 for (int row = 0; row < data.getRowCount(); row++) {
   position_min = min(position_min, data.getFloatAt(row, 1));
   position_max = max(position_max, data.getFloatAt(row, 1));  

   ratio_min = min(ratio_min, data.getFloatAt(row, 2));
   ratio_max = max(ratio_max, data.getFloatAt(row, 2));
   
   //mean_min = min(mean_min, data.getFloatAt(row, 3);
   //mean_max = max(mean_max, data.getFloatAt(row, 3);
 }
 
 for (int row = 0; row < data.getRowCount(); row++) {
   int x = floor(map(data.getFloatAt(row, 1), position_min, position_max, 0, width));
   float y = map(data.getFloatAt(row, 2), ratio_min, ratio_max, y1, y2);
   
   if(y < height/2) {
     Point p = new Point(x, y*2);
     points.add(p);
   } 
 }
 
 for(Point p : points) {
   point(p.x(), p.y()); 
 } 
 
 noFill();
 stroke(255, 0, 0);
 beginShape();
 for(int x = 0; x < width; x++) {
   int count = 0;
   int y = 0;
   
   for(Point p : points) {
     if(p.y() < 100) {
       if(p.x() == x) {
         y += p.y();
         count++;
       }
     }
   }
   
   if(count > 0) {
     y = y/count;
   }
   
   vertex(x, y);
 }
 endShape();
 
 stroke(0, 255, 0);
 beginShape();
 for(int x = 0; x < width; x++) {
   int count = 0;
   int y = 0;
   
   for(Point p : points) {
     if(p.y() > 100 && p.y() < 200) {
       if(p.x() == x) {
         y += p.y();
         count++;
       }
     }
   }
   
   if(count > 0) {
     y = y/count;
   }
   
   if(y > 100) {
     vertex(x, y);
   }
 }
 endShape();
 
 stroke(0, 0, 255);
 beginShape();
 for(int x = 0; x < width; x++) {
   int count = 0;
   int y = 0;
   
   for(Point p : points) {
     if(p.y() > 200) {
       if(p.x() == x) {
         y += p.y();
         count++;
       }
     }
   }
   
   if(count > 0) {
     y = y/count;
   }
   
   if(y > 200) {
     vertex(x, y);
   }  
 }
 endShape();
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
