class Parser
{
  Table data;
  
  float position_min = MAX_FLOAT;
  float position_max = MIN_FLOAT;
  float ratio_min = MAX_FLOAT;
  float ratio_max = MIN_FLOAT;
  float mean_min = MAX_FLOAT;
  float mean_max = MIN_FLOAT;
  
  private int THRESHOLD = 80;
  
  ArrayList<Point> points;
  
  Parser()
  {
    points = new ArrayList<Point>();  
  }

  ArrayList<Point> points(String file)
  {
     data = new Table(file);
     
     for (int row = 0; row < data.getRowCount(); row += starz.filter) {
       position_min = min(position_min, data.getFloatAt(row, 1));
       position_max = max(position_max, data.getFloatAt(row, 1));  
      
       ratio_min = min(ratio_min, data.getFloatAt(row, 2));
       ratio_max = max(ratio_max, data.getFloatAt(row, 2));
     }
     
     for (int row = 0; row < data.getRowCount(); row += starz.filter) {
       float x = map(data.getFloatAt(row, 2), ratio_min, ratio_max, width+THRESHOLD, -THRESHOLD);
       float y = map(data.getFloatAt(row, 1), position_min, position_max, -height * starz.scale, height);
       
       Point p = new Point(x, y);
       points.add(p);
     }
     
     return points;
  }
}
