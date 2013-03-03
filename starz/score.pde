class Score
{
  public int score;
  public int multiplier;
  PFont font;
  
  public Score(int score)
  {
    font = loadFont("OpenSans-48.vlw");
    this.score = score;
  }
  
  public void draw()
  {
    textFont(font);
    textSize(50);
    fill(255);
    text(score,12,780); 
  }
  
}
