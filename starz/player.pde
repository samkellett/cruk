class Player
{
  int x, y;
  
  public Player(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  public void update()
  {
  }
  
  public void render()
  {
    stroke(0);
    fill(0, 50, 0);
    ellipse(this.x, this.y, 1.0f, 1.0f);  
  }
  
  public int x()
  {
    return this.x;  
  }
  
  public int y()
  {
    return this.y;  
  }
  
  public void setX(int x)
  {
    this.x += x;
  }
  
  public void setY(int y)
  {
    this.y += y;  
  }
}
