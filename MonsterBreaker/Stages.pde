class Stage {
  
  void display(int stageID) {
      if (stageID == 1){
        //Scan & Print Monster
        for (int i = ListMon01.size()-1; i >= 0; i--) { 
          // An ArrayList doesn't know what it is storing so we have to cast the object coming out
          Monster mons = ListMon01.get(i);
          mons.display();
          //mons.CheckCollision();
          if (mons.finished()) {
            // Items can be deleted with remove()
            ListMon01.remove(i);
          }
        }
        for (int i = ListHeart01.size()-1; i >= 0; i--) { 
          // An ArrayList doesn't know what it is storing so we have to cast the object coming out
          Heart mons = ListHeart01.get(i);
          mons.display();
          //mons.CheckCollision();
          if (mons.finished()) {
            // Items can be deleted with remove()
            ListHeart01.remove(i);
          }
        }
      }
      if(stageID == 2){
        hero.display();
        
        //Scan & Print Monster
        for (int i = ListMon02.size()-1; i >= 0; i--) { 
          // An ArrayList doesn't know what it is storing so we have to cast the object coming out
          Monster mons = ListMon02.get(i);
          mons.display();
          //mons.CheckCollision();
          if (mons.finished()) {
            // Items can be deleted with remove()
            ListMon02.remove(i);
          }
        }
        for (int i = ListHeart02.size()-1; i >= 0; i--) { 
          // An ArrayList doesn't know what it is storing so we have to cast the object coming out
          Heart mons = ListHeart02.get(i);
          mons.display();
          //mons.CheckCollision();
          if (mons.finished()) {
            // Items can be deleted with remove()
            ListHeart02.remove(i);
          }
        }
      }
  }
  
  void BattleStage(){
    background(0, 0, 255);
    image(battleBG, 0, 0);
    image(character,870,546);
    //println("In");
    //for (int i = battles.size()-1; i >= 0; i--) { 
      // An ArrayList doesn't know what it is storing so we have to cast the object coming out
      Battle battle = battles.get(0);
      battle.display();
      //println("gameFinished = "+ "   " +gameFinished + ", gameStart = " + gameStart);
      /*
      if (gameFinished) {
        // Items can be deleted with remove()
        battles.remove(i);
      }
      */
    //}
  }
}