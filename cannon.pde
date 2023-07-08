class Cannon
{
  PVector location;
  float angle;
  float w;
  float h;
  
  ArrayList<Missile> missiles;
  
  Cannon(float w_, float h_)
  {
    w = w_;
    h = h_;
    location = new PVector(width/2, height - h);
    missiles = new ArrayList<Missile>();
  }
  
  void display()
  {
    noFill();
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    updateAngle();
    rotate(angle);
    rectMode(CENTER);
    fill(0);
    rect(0,-h/2, w, 5);
    noFill();
    rect(0, 0, w, h);
    popMatrix();
  }
  
  void updateAngle()
  {
    angle = map(mouseX, 0, width, -PI/4, PI/4);
  }
  
  void updateMissiles()
  {
    
    for(int i = 0; i < missiles.size(); i++)
    {
      Missile m = missiles.get(i);
  
      m.applyForce(m.acceleration.mult(9)); // initial thrust
      m.applyForce(new PVector(0, 0.7)); // gravity
      m.update();
      m.display();
      
      if(m.location.y > height + 20)
      {
        missiles.remove(i);
      }
    }
    
    /*
    for(Missile m: missiles)
    {
      m.applyForce(m.acceleration.mult(9)); // initial thrust
      m.applyForce(new PVector(0, 0.7)); // gravity
      m.update();
      m.display();
      
      if(m.location.y > height + 100)
        missiles.remove
      
    }
    */
  }
  
  void shoot()
  {
    missiles.add(new Missile( PVector.fromAngle(map(angle, -PI/4, PI/4, -PI/4, PI/4) - PI/2), new PVector(location.x, location.y), angle));
  }
  
}
