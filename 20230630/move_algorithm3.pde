class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector friction;
  float xoff;
  float yoff;
  
  Mover(float x_pos, float y_pos) {
    this.location = new PVector(x_pos,y_pos);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    xoff = 0;
    yoff = 1000;
  }
  
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(1);
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  
  void display() {
    stroke(0);
    ellipse(location.x, location.y, 30, 30);
  }
  
  void checkEdges() {
    if (location.x > width-10) {
      velocity.x *= -1;
    } else if (location.x < 10) {
      velocity.x *= -1;
    }

    if (location.y > height-10) {
      velocity.y *= -1;
    } else if (location.y < 10) {
      velocity.y *= -1;
    }
  }
}

Mover m1;
Mover m2;
Mover m3;

void setup(){
  size(600,600);
  m1 = new Mover(100,100);
  m2 = new Mover(200,200);
  m3 = new Mover(300,300);
  background(255);
  
}

void draw(){
  m1.update();
  m1.display();
  m2.update();
  m2.display();
  m3.update();
  m3.display();
}
