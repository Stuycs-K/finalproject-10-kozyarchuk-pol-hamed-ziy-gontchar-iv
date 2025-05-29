//cursor location for input
int xpos, ypos;

void setup(){
  size(500,500);

  xpos = 0;
  ypos = 40;
  textSize(40);
}

void draw(){

}

void keyPressed(){
  text(key, xpos, ypos);
  xpos+=textWidth(key);
}

String encrypt(){
  String rotor1 = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
  String rotor2 = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
  String rotor3 = "BDFHJLCPRTXVZNYEIWGAKMUSQO";

  return null;
}

ArrayList<Character> rotate(ArrayList<Character> rotorStatus, int rots){
  for(int i = 0; i < rots; i++){
    Character temp = rotorStatus.remove(0);
    rotorStatus.add(temp);
  }
  return rotorStatus;
}

char rotor1(){

}

char rotor2(){

}

char rotor3(){

}
