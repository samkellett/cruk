interface Skin
{ 
  public abstract PImage getBackground();
  
  public abstract PImage getCoin();
  
  public abstract void update();
  
  public abstract void render(float x, float y);
  
  public abstract int getWidth();
  
  public abstract int getHeight();
  
  public abstract PImage[] getEnemy();
 
  //public abstract PImage[] getEnemy2();
}
