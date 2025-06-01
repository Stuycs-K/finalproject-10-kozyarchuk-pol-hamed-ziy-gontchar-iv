int i_xpos, i_ypos, o_xpos, o_ypos;
Rotor r1, r2, r3;
String reflectorB;

void setup(){
  size(800,600);
  textSize(40);
  fill(0);

  i_xpos = 0;
  i_ypos = 40;
  o_xpos = 0;
  o_ypos = 340;

  // r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ");
  // r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE");
  // r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO");

  r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", charToIndex('D'));
  r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", charToIndex('O'));
  r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", charToIndex('G'));

  reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT";
  // reflectorB = "ABCDEFGDIJKGMKMIEBFTCVVJAT";
}


//dont delete; draw needed to run
void draw(){

}

void keyPressed(){

  //if valid
  if ( (key>=65 && key<= 90) || (key>=97 && key<=122) ){
    //print user input(uppercase) top of screen
    char input = (char) (key-32);
    fill(0);
    text(input, i_xpos, i_ypos);
    i_xpos+=textWidth(input);

    //input changes depending on what rotors are selected
    rotorUpdate(r3,r2,r1);

    //print result
    char result = encrypt(key, r3, r2, r1, reflectorB);
    text(result, o_xpos, o_ypos);
    o_xpos+=textWidth(result);
  }

  if (key == '0') {
    r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ");
    r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE");
    r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO");
    i_xpos = 0;
    o_xpos = 0;
    fill(255);
    rect(0, 0, width, height);
  }

}

//runs x through the 3 specificed rotors, returns result
char encrypt(char x, Rotor firstrot, Rotor secondrot, Rotor thirdrot, String reflector){
  char output = x;
  int index = charToIndex(output);

  println("Encoding: " + x);

  output = firstrot.status_arr.get(index);
  println("Found this at index of first input: " + output);
  // index = charToIndex(output);
  // output = firstrot.setting_arr.get(index);
  index = firstrot.setting_arr.indexOf(output);
  println("Found this at index of first output: " + firstrot.setting_arr.get(index));

  // index = charToIndex(output);
  output = secondrot.status_arr.get(index);
  println("Found this at index of second input: " + output);
  // index = charToIndex(output);
  // output = secondrot.setting_arr.get(index);
  index = secondrot.setting_arr.indexOf(output);
  println("Found this at index of second output: " + secondrot.setting_arr.get(index));

  // index = charToIndex(output);
  output = thirdrot.status_arr.get(index);
  println("Found this at index of third input: " + output);
  // index = charToIndex(output);
  // output = thirdrot.setting_arr.get(index);
  index = thirdrot.setting_arr.indexOf(output);
  println("Found this at index of third output: " + thirdrot.setting_arr.get(index));

  // index = charToIndex(output);
  println("Third rotor setting: " + thirdrot.setting_arr.toString());
  println("This index: " + index);
  output = reflector.charAt(index);
  println("Into reflector: " + output);
  index = charToIndex(output);
  output = reflector.charAt(index);
  println("Reflected: " + output);

  output = thirdrot.setting_arr.get(index);
  println("Found this at index of third setting: " + output);
  index = thirdrot.status_arr.indexOf(output);
  println("Found this at index of third status: " + thirdrot.status_arr.get(index));

  output = secondrot.setting_arr.get(index);
  println("Found this at index of second setting: " + output);
  index = secondrot.status_arr.indexOf(output);
  println("Found this at index of second status: " + secondrot.status_arr.get(index));

  output = firstrot.setting_arr.get(index);
  println("Found this at index of first setting: " + output);
  index = firstrot.status_arr.indexOf(output);
  println("Found this at index of first status: " + firstrot.status_arr.get(index));

  output = indexToChar(index);
  println("END RESULT: " + output);

  return output;
}

//input changes depending on what rotors are selected
void rotorUpdate(Rotor rot1, Rotor rot2, Rotor rot3){
  rot1.rotate(1);

  //if one full rotation,
  if(rot1.rotnum == 0){
    //turn second rotor
    rot2.rotate(1);

    if(rot2.rotnum == 0){
      rot3.rotate(1);
    }
  }
}


int charToIndex(char x){
  if((int)x >= 97){
    return ((int) x) - 97;
  } else {
    return ((int) x) - 65;
  }
}

char indexToChar(int x){
  return ((char) (x + 65));
}

/*prob dont need
char rotor1(){
  return 'a';
}

char rotor2(){
  return 'a';
}

char rotor3(){
  return 'a';
}
*/
