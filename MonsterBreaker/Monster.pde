class Monster {
  int posX;
  int posY;
  int monID;
  int monHP;
  
  int hp01 = 5;
  int hp02 = 10;
  int hp03 = 20;
  
  Monster(int posX, int posY, int monID) {
    this.posX = posX;
    this.posY = posY;
    this.monID = monID;
    switch (monID) {
      case 1:
        monHP = hp01;
        break;
      case 2:
        monHP = hp01;
        break;
      case 3:
        monHP = hp02;
        break;
      case 4:
        monHP = hp02;
        break;
      case 5:
        monHP = hp03;
        break;
    }
  }
  
  void display() {
    switch (monID) {
      case 1:
        image(mon01, this.posX, this.posY);
        break;
      case 2:
        image(mon02, this.posX, this.posY);
        break;
      case 3:
        image(mon03, this.posX, this.posY);
        break;
      case 4:
        image(mon04, this.posX, this.posY);
        break;
      case 5:
        image(mon05, this.posX, this.posY);
        break;
    }
  }
  
  boolean monsterCollision() {
    float disX = hero.xPos - this.posX;
    float disY = hero.yPos - this.posY;
    if(disX<=50 && disY<=50 && disX>=-50 && disY>=-50){
      if(battles.size()==0 && inBattle==false){
        battles.add(new Battle(monID, monHP, hero.numHeart));
        inBattle = true;
        println("Battles Size = "+ battles.size());
      }
      return true;
    }
    else{
      return false;
    }
  }
  
  boolean finished() {
    if (monsterCollision()) {
      return true;
    }
    else {
      return false;  
    }
  }
}