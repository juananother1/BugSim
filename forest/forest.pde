import queasycam.*;
QueasyCam cam;

PImage grass;
PImage sky;

PShape tree;
PShape bush;
PShape ant;

ArrayList<tree> Tree = new ArrayList<tree>();
ArrayList<bush> Bush = new ArrayList<bush>();
ArrayList<ant> Ant = new ArrayList<ant>();

bg Background = new bg();

float ini_sec = second();
int interval = 2;
void setup()
{
  size(800, 800, P3D);

  cam = new QueasyCam(this);

  imageMode(CENTER);

  grass = loadImage("grass.png");
  grass.resize(11000, 11000);
  
  sky = loadImage("sky.jpg");
  sky.resize(800, 800);

  cam.position.x = 460;
  cam.position.y = -26;
  cam.position.z = 239;

  tree = loadShape("tree/tinker.obj");
  tree.scale(20, 20, 20);
  bush = loadShape("bush/tinker.obj");
  bush.scale(5, 5, 5);
  ant = loadShape("ant/tinker.obj");
  ant.scale(0.5, 0.5, 0.5);

  for (int i=0; i< 250; i++)
  {
    Tree.add(new tree());
    Bush.add(new bush());
    Ant.add(new ant());
  }
}
void draw()
{
  background(135, 206, 235);
  //Background.make();
  
  float current_sec = second();
  float interval2 = current_sec - ini_sec;

  pushMatrix();
  rotateX(TWO_PI /4);
  image(grass, 0, 0);
  popMatrix();

  if (cam.position.y > -25)
  {
    cam.position.y = -26;
  }
  if (cam.position.y < -27)
  {
    cam.position.y = -26;
  }
  
  for (tree t : Tree)
  {
    t.make();
  }
  
  for (bush b : Bush)
  {
    b.make();
  }
  
  for (ant a : Ant)
  {
    a.make();
    a.wander();
    if (a.ifCollected() == true)
    {
      a.follow();
    }
    if (interval2 % interval == 0)
    {
      a.decider = (int)random(1, 5);
    }
  }
}
