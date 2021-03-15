class bg
{
  float x;
  float y;
  float z;
  
  float size;
  
  bg()
  {
    x = 5500;
    y = 100;
    z = 5500;
    
    size = 2000;
  }
  
  void make()
  {
    pushMatrix();
    translate(x, y, z);
    texture(sky);
    box(size);
    popMatrix();
  }
}
