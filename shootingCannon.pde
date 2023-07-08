Cannon cannon;

void setup()
{
  size(640, 400);
  cannon = new Cannon(10, 50);
}

void draw()
{
  background(255);
  cannon.display();
  cannon.updateMissiles();
}

void mouseReleased()
{
  cannon.shoot();
}
