ArrayList<Bar> arraylist = new ArrayList<Bar>();

void setup(){
  size(200,750);
  
  //以下脳筋インスタンス
  for(int i = 0; i <= 7; i++){
    arraylist.add(new Bar(0 + i * 100));
  }
}

void draw(){
  //背景を白、その中を赤、青のひし形が動きます
  background(255);

  for(int i = 0; i <= 7; i++){
    arraylist.get(i).update();
    if(i % 2 == 0){
      arraylist.get(i).rdisplay();
    } else {
      arraylist.get(i).bdisplay();
    }
  }
}

// 撮影用
int photo = 0;
void keyPressed() {
    if(key == 's'){
        save("frame/" + photo + ".png");
        photo++;
    }
}
