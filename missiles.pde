class Missile
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float rad;
  float damping;
  
  float angle;
  
  Missile(PVector thrust, PVector origin, float angle_)
  {
    mass = 1.01;
    rad = 6;
    location = origin.copy();
    acceleration = thrust.copy();
    velocity = new PVector(0, 0);
    angle = angle_;
    damping = 0.006;
  }
  
  void display()
  {
    noFill();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, rad * 2, rad * 2);
    popMatrix();
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //checkEdges();
  }
  
  void checkEdges()
  {
    if(location.x + rad > width)
    {
      velocity.x *= -1;
      location.x = width - rad;
    }
    if(location.y + rad > height)
     {
       velocity.y *= -1;
       location.y = height - rad;
     }
     
    if(location.x - rad < 0)
    {
      velocity.x *= -1;
      location.x = rad;
    }
    
    dampen();
  }
  
  void dampen()
  {
    velocity.mult(1 - damping);
  }
 
}
