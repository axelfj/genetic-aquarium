class Predator extends Fish {

  Predator(float x, float y, PVector vel,PImage image) {
    super(x, y, vel,image);
    this.c = color(255, 0, 0);
    this.mass = 5;
    this.size = mass/2 + 5;
    viewRatio = 600;
    
  }
  
  void setHunger(){
    hunger = 1800;
  }
  
  Marine reproduce(){
    float corrX = random(-10, 10); 
    float corrY= random(-10, 10);
    Marine son = new Predator(pos.x + corrX, pos.y +corrY, vel, image);
    return son;
  }
  
  boolean isHungry(){
    return hunger < 1000;
  }

  
  void hunt(ArrayList<Marine> marines) {
    Prey newTarget = null;
    for (Marine target : marines) {
      if (target instanceof Prey && isHungry()) {
        if (newTarget == null) { 
          newTarget = (Prey) target;
        } else {
          if (PVector.dist(pos, newTarget.pos) > PVector.dist(pos, target.pos)) {
            newTarget = (Prey) target;
          }
        }
      }
    }
    if(newTarget!=null)
    eat(newTarget);
  }

}
