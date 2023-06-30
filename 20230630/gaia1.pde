class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector friction;
  float xoff;
  float yoff;
  int i;
  
  Mover(int i) {
    this.i = i;
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void update() {
    PVector mouse = new PVector(width/2,height/2);
    PVector dir = PVector.sub(mouse, location);
    float magnitude = dir.mag();
    dir.normalize();
    dir.mult(magnitude*0.001);
    velocity.limit(10);
    location.add(velocity);
    velocity.add(dir);
  }
  
  void display() {
    stroke(0);
    fill(0,i,i);
    ellipse(location.x, location.y, 30, 30);
  }
  
  void checkEdges() {
    if (location.x > width) {
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
    } else if (location.y < 0) {
      velocity.y *= -1;
    }
  }
}

Mover[] movers = new Mover[200];

void setup(){
  size(600,600);
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover(i);
  }
  
}

void draw(){
  background(255);
  for (int i = 0; i < movers.length; i++) {
    //[full] Calling functions on all the objects in the array
    movers[i].update();
    movers[i].display();
    //[end]
  }
}
