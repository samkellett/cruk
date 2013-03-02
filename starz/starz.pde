Parser parser;
Player player;
ArrayList<Point> points;

void setup()
{
  size(480, 800);
  frameRate(60);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  parser = new Parser();
  points = parser.points("S3_BAF_Chrom4.txt");

  player = new Player(width / 2 ,height - 200);
}

void draw()
{
  background(#A9E8E2); 
  
  for(int i = 0; i < points.size(); i++) {
    points.get(i).render();
    points.get(i).update(); 
  }
  
  player.update();
  player.render();

  if(keyPressed) {
    if(keyCode == LEFT) {
      player.strafe(-4);
    }
    
    if(keyCode == RIGHT) {
      player.strafe(4);
    }
    
    if(key == 32) {
      player.dive();
    }  
  }
}

void keyReleased()
{
  if(keyCode == 32) {
    player.setDive(false);
  }else{
    player.setStrafe(false);
  }
}


