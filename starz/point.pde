class Point
{
  float x, y;
  boolean hidden;
  
  public Point(float x, float y)
  {
    this.hidden = false;
    this.x = x;
    this.y = y;
  }
  
  public void update()
  {
    this.y += 7;
  }
  
  public void render()
  {
    if(!this.hidden && this.y > -10 && this.y < height + 10) {
      stroke(0);
      //fill(234, 286, 33);
      
      //ellipse(this.x, this.y, 15.0f, 15.0f);
      
      image(starz.coin,this.x,this.y,35.0,35.0);
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
    return this.y;
  }
  
  public void setY(float y)
  {
    this.y = y;
  }
  
  public String toString()
  {
    return x + "\t" + y;
  }
  
  public void hide()
  {
    hidden = true;
  }
  
  public boolean hidden()
  {
    return this.hidden;
  }
}
