
//cursor location for input
int xpos, ypos;

void setup(){
  size(500,500);

  xpos = 0;
  ypos = 40;
  textSize(40);

  String rotor1s = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
  String rotor2s = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
  String rotor3s = "BDFHJLCPRTXVZNYEIWGAKMUSQO";


  ArrayList<Character> rotor1 = stringToArray(rotor1s);
  ArrayList<Character> rotor2 = stringToArray(rotor2s);
  ArrayList<Character> rotor3 = stringToArray(rotor3s);
  // println(rotor1.toString());
  // println(rotor2.toString());
  // println(rotor3.toString());

}

ArrayList<Character> stringToArray(String s) {
  ArrayList<Character> output = new ArrayList<Character>();
  for (int i = 0; i < s.length(); i++) {
    output.add(s.charAt(i));
  }

}

void keyPressed(){
  text(key, xpos, ypos);
  xpos+=textWidth(key);
}


String encryptChar(char x, int rot1, int rot2, int rot3, int set1, int set2, int set3){

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
