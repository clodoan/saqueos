String[] words;
IntDict dictionary;
int index = 0;
color c = color(#ffffff);
//color r = color(#FB0B0B);

void setup() {
  size(1400, 1000);
  String[] lines = loadStrings("https://github.com/clodoan/saqueos/blob/master/data/results.csv");
  String entireTweets = join(lines," ");
  printArray(entireTweets);
  words = splitTokens(entireTweets, ", ");
  dictionary = new IntDict();
  dictionary.set("saqueos",0);
  dictionary.set("saqueo",0);
  dictionary.set("saqueó",0);
  frameRate(5);
}

void draw() { 
  background(0);
  textSize(32);
  //fill(255);
  textAlign(CENTER);
  
  if ((words[index].toLowerCase() == "saqueo") || (words[index].toLowerCase() == "saqueo")) {
    c = color(#FB0B0B);
  } else {
    c = color(#FFFFFF);
  };
  
  fill(c);
  text(words[index], width/2, height/2);
  dictionary.increment(words[index].toLowerCase());
  
  int count = dictionary.get("saqueos") + dictionary.get("saqueo") + dictionary.get("saqueó");
    
    
    
    
  textSize(28);
  text("saqueos:" + count, width-160, height-60);
  index++;
}
