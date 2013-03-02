Table data;

float position_min = MAX_FLOAT;
float position_max = MIN_FLOAT;
float ratio_min = MAX_FLOAT;
float ratio_max = MIN_FLOAT;
float mean_min = MAX_FLOAT;
float mean_max = MIN_FLOAT;

void setup()
{ 
 size(640, 960);
 
 background(57,181,74);
 
 //plot("S3_BAF_Chrom1.txt", height / 2, 0);
  
 plot("S3_Seg_Chrom1.txt", height, 0);
}

void draw()
{ 
}

void keyPressed()
{
 if (keyCode == LEFT)
 {
   stroke(255,0,0);
   ellipse(100,100,50.0,50.0);
 }
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
   float y = map(data.getFloatAt(row, 1), position_min, position_max, 0, height*150);
   float x = map(data.getFloatAt(row, 2), ratio_min, ratio_max, y1, y2);
  
   stroke(231,0,133);
   ellipse(x, y,15.0,15.0);
 }  
}
