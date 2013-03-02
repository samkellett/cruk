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
    this.y += 1;
  }
  
  public void render()
  {
    if(this.y > -10 && this.y < height+10) {
      noStroke();
      fill(0, 255, 0, 50);
      ellipse(this.x, this.y, 20.0f, 20.0f);
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
