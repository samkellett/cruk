Table data;

float position_min = MAX_FLOAT;
float position_max = MIN_FLOAT;
float ratio_min = MAX_FLOAT;
float ratio_max = MIN_FLOAT;
float mean_min = MAX_FLOAT;
float mean_max = MIN_FLOAT;

void setup()
{
 size(800, 600);

 data = new Table("S3_Seg_Chrom1.txt");
 
 for (int row = 0; row < data.getRowCount(); row++) {
   position_min = min(position_min, data.getFloatAt(row, 1));
   position_max = max(position_max, data.getFloatAt(row, 1));  

   ratio_min = min(ratio_min, data.getFloatAt(row, 2));
   ratio_max = max(ratio_max, data.getFloatAt(row, 2));
   
   //mean_min = min(mean_min, data.getFloatAt(row, 3);
   //mean_max = max(mean_max, data.getFloatAt(row, 3);
 }
 
 for (int row = 0; row < data.getRowCount(); row++) {
   float x = map(data.getFloatAt(row, 1), position_min, position_max, 0, width);
   float y = map(data.getFloatAt(row, 2), ratio_min, ratio_max, height, 0);
  
   point(x, y); 
 } 
}

void draw()
{ 
}
