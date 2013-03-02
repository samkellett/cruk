import java.io.*;

public class Path
{
  ArrayList<Integer> xs;
  ArrayList<Integer> ys;
  
  public Path()
  {
    this.xs = new ArrayList<Integer>();
    this.ys = new ArrayList<Integer>();  
  }  
  
  public void addPoint(int x, int y)
  {
    this.xs.add(x);
    this.ys.add(y); 
  }
  
  public void write()
  { 
    try {
      FileWriter writer;
    
      writer = new FileWriter("output.txt"); 
      for(int i = 0; i < xs.size(); i++) {
        writer.write(xs.get(i) + "\t" + ys.get(i) + System.getProperty("line.separator"));
      }
      writer.close();
      println("Done");      
    }catch (Exception e) {
      println("Exception");
    }
  }
}
