String[] words;
IntDict dictionary;
int index = 0;
color c = #FFFFFF;
String word;

void setup() {
  size(1400, 1000);

  String[] lines = loadStrings("https://raw.githubusercontent.com/clodoan/saqueos/master/data/results.csv");
  String entireTweets = join(lines," ");
  //printArray(entireTweets);
  
  words = splitTokens(entireTweets, ", \",.:# ");
  dictionary = new IntDict();
  dictionary.set("saqueos",0);
  dictionary.set("saqueo",0);
  dictionary.set("saqueó",0);
  
  frameRate(3);
}

void draw() { 
  background(0);
 
  textSize(32);
  textAlign(CENTER);
  
  word = words[index].toLowerCase();
  
  fill(c);
  
  //if ((word.toLowerCase() != "saqueo") || (word.toLowerCase() != "saqueos")) {
  if ((word.equals("saqueo")) || (word.equals("saqueos"))) {
    c = #FB0B0B;
    print(" saqueo");
    frameRate(0.5);
    
  } else {
    print(" normal");
    c = #FFFFFF;
    frameRate(3);
  };
  
  fill(c);
  
  text(word, width/2, height/2);
  dictionary.increment(word.toLowerCase());
  int count = dictionary.get("saqueos") + dictionary.get("saqueo") + dictionary.get("saqueó");  
  
  fill(#FB0B0B);
  textSize(28);
  text("saqueos:" + count, width-160, height-60);
  
  index++;
  
  //saveFrame("output/frame_####.png");
}
