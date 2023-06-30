class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector friction;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,-0.05);
  }
  
  void update() {
    location.add(velocity);
    if (keyPressed) {
      if (keyCode == UP) {
        velocity.add(acceleration);
        velocity.limit(100);
      }
      if (keyCode == DOWN) {
        velocity.y = 0;
      }
    }
    
  }
  
  void display() {
    noStroke();
    fill(175);
    ellipse(location.x, location.y, 30, 30);
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
}

void draw(){
  background(255);
  m.update();
  m.display();
  m.checkEdges();
}
