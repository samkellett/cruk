import java.io.*;

class Game
{
  private Parser parser;

  private ArrayList<Point> points;

  private ArrayList<Point> tracker;
  private int y;

  private Sprite sprite;

  private ScrollingBackground background;
  private HUD hud;

  Game() {}
  
  void isetup()
  {
    this.background = new ScrollingBackground();
    this.hud = new HUD();
  
    this.parser = new Parser();
    this.points = parser.points("S3_BAF_Chrom1.txt");

    this.sprite = new Sprite("sprite2.gif", width / 2, height - 300);
  
    this.tracker = new ArrayList<Point>();
    this.y = 0;
  }
  
  void idraw()
  {
    this.background.draw();
    if (keyPressed) {
      if (keyCode == LEFT) {
        this.sprite.left();
      }
    
      if (keyCode == RIGHT) {
        this.sprite.right();
      }
    }
  
    for (Point p : this.points) {
      if (this.sprite.underSprite(p.x(), p.y())) {
        if (!p.hidden()) {
          this.hud.score();
        }
        p.hide();
      }
       
      p.render();
      p.update();
    }
  
    this.sprite.draw();
   
    this.tracker.add(new Point(this.sprite.x, y));
    this.y += 7;

    this.hud.draw();
  }
  
  void ikeyPressed()
  {
    if(keyCode == ALT) {
      try {
        FileWriter writer = new FileWriter("output.txt");
     
        for(int i = 0; i < this.tracker.size(); i++) {
          writer.write(this.tracker.get(i) + System.getProperty("line.separator")); 
        }
     
        writer.close();
      } catch (Exception e) {
        println("Error");
      } 
    } 
  }
}
