class Heart {
  int posX;
  int posY;
  
  Heart(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
  }
  
  void display() {
    image(heart, this.posX, this.posY);
  }
  
  boolean heartCollision() {
    float disX = hero.xPos - this.posX;
    float disY = hero.yPos - this.posY;
    if(disX<=50 && disY<=50 && disX>=-50 && disY>=-50){
      hero.numHeart++;
      return true;
    }
    else{
      return false;
    }
  }
  
  boolean finished() {
    if (heartCollision()) {
      return true;
    }
    else {
      return false;  
    }
  }
}