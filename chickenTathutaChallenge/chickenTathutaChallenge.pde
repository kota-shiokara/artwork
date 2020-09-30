char[] chickenTathuta = {'チ', 'キ', 'ン', 'タ', 'ツ', 'タ'};
IntList intIndex;

void setup(){
  intIndex = new IntList(chickenTathuta.length);
  for(int i = 0; i < chickenTathuta.length; i++){
    intIndex.append(i);
  }
  intIndex.shuffle();
  for(int i = 0; i < chickenTathuta.length; i++){
    print(chickenTathuta[intIndex.get(i)]);
    print(" ");
  }
  println("丼 食べた");
}
