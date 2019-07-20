class Ball
{
  float x, y, xspeed, yspeed, radius, radius1, check;
  
  Ball(float tempX, float tempY,int tempRadius, int tempRadius1)
  {
    x = tempX;
    y = tempY;
    for(int i = 0; i < 10; i++)
    {
      float p = random(5);
      float o = random(-5,-2);
      xspeed = p;
      yspeed = o;
    }
    radius = tempRadius*2;
    radius1 = tempRadius1*2;
  }
    
    boolean finished() {
    if (y >600)
    {
      count++;
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void move()
  {
    x += xspeed;
    y += yspeed;
    if ((x < 660) || (x > 1160))
    {
      xspeed *= -1;
    }
    
    if (y < 0)
    {
      yspeed *= -1;
    }

  }

  void display()
  {
    stroke(0);
    fill(255);
    ellipse(x,y,10,10);
  }
  
 
}