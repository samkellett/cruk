class Point
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
      stroke(0);
      fill(0, 255, 0);
      ellipse(this.x, this.y, 10.0f, 10.0f);
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
