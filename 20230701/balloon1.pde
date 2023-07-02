class balloon{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  balloon(){
    location = new PVector(width/2, height/2+200);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    stroke(30);
    ellipse(location.x, location.y, 50, 50);
  }
  
  void checkEdges(){
    if(location.y < 0){
      velocity.y *= -1;
    }
    if(location.x < 0){
      velocity.x *= -1;
    }
    if(location.x > width){
      velocity.x *= -1;
    }
  }
  void applyForce(PVector force){
    acceleration.add(force);
  }
}

balloon b;
float xoff = 10;

void setup(){
  size(400,800);
  b = new balloon();
}

void draw(){
  background(255);
  PVector helium = new PVector(0,-0.01);
  b.applyForce(helium);
  PVector wind = new PVector(map(noise(xoff),0,1,-0.03,0.03),0);
  b.applyForce(wind);
  b.update();
  b.display();
  b.checkEdges();
  xoff++;
}
