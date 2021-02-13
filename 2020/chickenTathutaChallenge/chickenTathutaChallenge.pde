char[] chickenTathuta = {'チ', 'キ', 'ン', 'タ', 'ツ', 'タ'};
IntList intIndex;
String[] ansChickenTathuta = {"", "", "", "", "", ""};

void setup(){
  intIndex = new IntList(chickenTathuta.length);
  for(int i = 0; i < chickenTathuta.length; i++){
    intIndex.append(i);
  }
  intIndex.shuffle();
  for(int i = 0; i < chickenTathuta.length; i++){
    ansChickenTathuta[i] = "" + chickenTathuta[intIndex.get(i)];
  }
  String resultTathuta = join(ansChickenTathuta, " ");
  println(resultTathuta + " 丼 食 べ た");
  if(join(ansChickenTathuta, "") == "チキンタツタ") println("やったね！");
  else println("m9(^Д^)ﾌﾟｷﾞｬｰ");
}
