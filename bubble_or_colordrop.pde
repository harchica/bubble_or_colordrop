int _num = 20;
Circle[] _circleArr = {};
void setup(){
  size(800,800);
  background(82,162,197,100);
  smooth();
  strokeWeight(0.5);
  fill(255,10);
  drawCircles();
}

void draw(){
  background(82,162,197,100);
  for (int i = 0; i <_circleArr.length; i++){
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased(){
  drawCircles();
  //println(_circleArr.length);
}
void drawCircles(){
  for(int i = 0; i < _num; i++){
     Circle thisCirc = new Circle();
     thisCirc.drawMe();
     _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

//============objects

class Circle{
  float x,y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
   
   Circle(){
     x = random(width);
     y = random(height);
     radius = random(100) + 10;
     linecol = color(random(255),random(255),random(255),random(150));
     fillcol = color(random(255),random(255),random(255),random(150));
     alph = random(180);
     xmove = random(5) - 5;
     ymove = random(5) -5;
      }
      
      void drawMe(){
        noStroke();
        fill(fillcol,alph);
        ellipse(x,y,radius * 2,radius*2);
        stroke(linecol,255);
        noFill();
        ellipse(x,y,10,10);
      }
      
  void updateMe(){
    x += xmove;
    y += ymove;
    if(x > (width + radius)){x = 0 -radius;}
    if(x < (0 - radius)){ x = width + radius;}
    if(y > (height + radius)){ y = 0 -radius;}
    if(y < (0 - radius)){ y = height + radius;}
    
     for(int i = 0; i<_circleArr.length; i++){
       Circle otherCirc = _circleArr[i];
       if(otherCirc !=this){
       float dis = dist(x,y, otherCirc.x, otherCirc.y);
       float overlap = dis - radius - otherCirc.radius; //重なった部分を計算
       if(overlap < 0){ //重なりがマイナス=接触
         float midx, midy;
         midx = (x + otherCirc.x)/2;
         midy = (y + otherCirc.y)/2; //中間点を計算
         stroke(255,100);
         noFill();
         overlap *= -1;
         ellipse(midx, midy, overlap, overlap);
       }
      }
    }
    
    //drawMe();
  }
}