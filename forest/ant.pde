class ant
{
  PVector pos;
  PVector player;
  PVector accel;
  PVector vel;
  PVector dir;
  
  float speed;
  float maxSpeed;
  
  int decider;

  ant()
  {
    pos = new PVector(random(11000), random(11000), 0);
    player = new PVector(cam.position.x, cam.position.y, cam.position.z);
    dir = new PVector(0, 0);
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    
    speed = 3;
    maxSpeed = 3;
    decider = (int)random(1, 5);
  }

  void make()
  {
    pushMatrix();
    rotateX(TWO_PI / 4);
    translate(pos.x, pos.y, pos.z);
    shape(ant);
    popMatrix();
  }

  void follow()
  {
    dir = player.sub(pos);
    dir.normalize();
    dir.mult(speed);
    accel = dir;
    vel.add(accel);
    vel.limit(maxSpeed);
    pos.add(vel);
  }
  
  void wander()
  {
    switch(decider) {
      case 1:
        pos.x += 1;
        break;
      case 2:
        pos.x -= 1;
        break;
      case 3:
        pos.y += 1;
        break;
      case 4:
        pos.y -= 1;
        break;
    }
  }
  
  boolean ifCollected()
  {
    if (dist(cam.position.x, cam.position.y, cam.position.z, pos.x, pos.y, pos.z) < 20)
    {
      return true;
    }
    return false;
  }
}
