public class Point
{
  float x, y;
  
  public Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public void update()
  {
    this.y += 2;
  }
  
  public void render()
  {
    if(this.y > -10 && this.y < height+10) {
      noStroke();
      fill(#EDEDED, 80);
      ellipse(this.x, this.y, 100.0f, 100.0f);
    }
  }
  
  public float x()
  {
    return this.x;
  }

  public void setX(float x)
  {
    this.x = x;
  }  
  
  public float y()
  {
    return this.y();
  }
  
  public void setY(float y)
  {
    this.y = y;
  }
}
