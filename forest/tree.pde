class tree
{
  float x;
  float z;
  
  
  tree()
  {
    x = random(11000);
    z = random(11000);
  }
  
  void make()
  {
    pushMatrix();
    translate(x, 0, z);
    rotateX(TWO_PI / 4);
    shape(tree);
    popMatrix();
  }
}
