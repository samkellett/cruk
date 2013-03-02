class Score
{
  public int score;
  
  public Score(int score)
  {
    this.score = score;
  }
  
  public void draw()
  {
    textSize(50);
    fill(0);
    text(score,10,50); 
  }
  
}
