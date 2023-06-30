class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector friction;
  float xoff;
  float yoff;
  int i = 0;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    xoff = 0;
    yoff = 1000;
  }
  
  void update() {
    acceleration.x = map(noise(xoff),0,1,-0.01,0.01);
    acceleration.y = map(noise(yoff),0,1,-0.01,0);
    velocity.add(acceleration);
    velocity.limit(100);
    location.add(velocity);
    xoff += 0.01;
    yoff += 0.01;
  }
  
  void display() {
    stroke(0);
    fill(40,30,150-i);
    ellipse(location.x, location.y, 30, 30);
    i++;
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}

Mover m;
void setup(){
  size(600,600);
  m = new Mover();
  background(255);
}

void draw(){
  m.update();
  m.display();
  m.checkEdges();
}
