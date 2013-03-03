State state;
Menu menu;
Game game;
Result result;

void setup()
{
  size(480, 800, OPENGL);
  frameRate(60);
  background(255);
  //CRUK Green: 57,181,74
  //CRUK Pink: 243,20,235
  //background(57,181,74);
  
  //state = MENU;
  //new Menu();
  
  game = new Game();
  game.isetup();
}

void draw()
{
  println("yoyo");
  game.idraw();
}

void keyPressed()
{
  game.ikeyPressed();
}

