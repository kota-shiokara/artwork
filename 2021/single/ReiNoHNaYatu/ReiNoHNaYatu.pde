void setup(){
  size(350, 500);
}

void draw(){
  noStroke();
  for(int i = 0; i < 360; i+=5){
    for(int j = 0; j < 500; j+=5){
      fill(random(50, 255), random(50, 255), random(50, 255));
      switch(floor(random(0,3))){
        case 1:
        case 2:
          rect(i, j, random(5, 20), random(5, 20));
          break;
        default:
          ellipse(i, j, random(5, 20), random(5, 20));
          break;
      }
    }
  }
  noLoop();
}

int photo = 0;
void keyPressed() {
    if(key == 's'){
        save("frame/" + photo + ".png");
        photo++;
    }
}
