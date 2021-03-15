class bush
{
  float x;
  float z;
  float y;
  float scale;
  
  bush()
  {
    x = random(11000);
    z = random(11000);
  }
  
  void make()
  {    
    pushMatrix();
    translate(x, 200, z);
    rotateX((TWO_PI / 4));
    shape(bush);
    popMatrix();
  }
}
