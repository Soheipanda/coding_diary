class Mover {
  PVector location;
  PVector velocity;
  
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  void update() {
    location.add(velocity);
    
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
