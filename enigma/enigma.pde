int i_xpos, i_ypos, o_xpos, o_ypos, x_r1, x_r2, x_r3, x_ref;
Rotor r1, r2, r3;
String reflectorB;
int formater;
ArrayList<String> plugboard;

void setup(){
  size(500,600);

  fill(255);
  rect(0, 0, width, height);

  textSize(40);
  fill(0);

  i_xpos = 5;
  i_ypos = 545;
  o_xpos = 5;
  o_ypos = 590;

  formater = 0;

  r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 'Q');
  r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", 'E');
  r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", 'V');

  plugboard = new ArrayList<String>();
  plugboard.add("AB");
  plugboard.add("CG");
  plugboard.add("ZE");

  //r1.printChar('a', width/2, height/2, 20);
  textSize(20);
  text("first rotor", 390, 25);
  text("second rotor", 260, 25);
  text("third rotor", 130, 25);
  text("reflector", 20, 25);
  
  x_r1 = 412;
  x_r2 = 293;
  x_r3 = 160;
  r1.display(x_r1, 30, 18, 0);
  r2.display(x_r2, 30, 18, 0);
  r3.display(x_r3, 30, 18, 0);
  
  // r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", charToIndex('D'));
  // r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", charToIndex('O'));
  // r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", charToIndex('G'));

  reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT";
  // reflectorB = "ABCDEFGDIJKGMKMIEBFTCVVJAT";
  
  x_ref = 45;
  displayString(reflectorB, x_ref, 30, 18);
}


void draw(){
  line(0, 500, 800, 500);
  stroke(0);
  fill(0);
  textSize(15);
  text("input: ", 0, 515);
  text("output: ", 0, 560);
  textSize(40);
}

void keyPressed(){
    //if valid
  if ( (key>=65 && key<= 90) || (key>=97 && key<=122) ){
    
    //add a space every 5 chars; align; reset if not enough space
    if(formater % 5 == 0 && formater !=0){
      println(o_xpos + " " + i_xpos);
      o_xpos=33 *formater;
      i_xpos=33 * formater;
       
       //clear chars
       if(formater > 10){
         pushStyle();
         
         fill(255);     
         stroke(255);
         rect(1, 518, 800, 27);
         rect(1, 563, 800, 50);
         
         o_xpos = 3;
         i_xpos = 3;
         formater = 0;
         
         popStyle();
       }
    }    
    
    formater++;
    char input = (char) (key-32);
    fill(0);
    println(i_xpos + ", " + i_ypos);
    text(input, i_xpos, i_ypos);
    i_xpos+=textWidth(input);
   

    //input changes depending on what rotors are selected
    rotorUpdate(r1,r2,r3);
    r1.display(x_r1, 30, 18, 0);
    r2.display(x_r2, 30, 18, 0);
    r3.display(x_r3, 30, 18, 0);

    //print result
    char result = encrypt(key, r1, r2, r3, reflectorB);
    text(result, o_xpos, o_ypos);
    o_xpos+=textWidth(result);

   
  }

  if (key == '0') {
    r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 'Q');
    r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", 'E');
    r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", 'V');
    i_xpos = 0;
    o_xpos = 0;
    fill(255);
    rect(0, 0, width, height);
  }

}

//runs x through the 3 specificed rotors, returns result
char encrypt(char x, Rotor firstrot, Rotor secondrot, Rotor thirdrot, String reflector){
  x = plugTransform(x);

  char output = x;
  int index = charToIndex(output);

  //println("Encoding: " + x);

  output = firstrot.status_arr.get(index);
  //println("Found this at index of first input: " + output);
  // index = charToIndex(output);
  // output = firstrot.setting_arr.get(index);
  index = firstrot.setting_arr.indexOf(output);
  //println("Found this at index of first output: " + firstrot.setting_arr.get(index));

  // index = charToIndex(output);
  output = secondrot.status_arr.get(index);
  //println("Found this at index of second input: " + output);
  // index = charToIndex(output);
  // output = secondrot.setting_arr.get(index);
  index = secondrot.setting_arr.indexOf(output);
  //println("Found this at index of second output: " + secondrot.setting_arr.get(index));

  // index = charToIndex(output);
  output = thirdrot.status_arr.get(index);
 // println("Found this at index of third input: " + output);
  // index = charToIndex(output);
  // output = thirdrot.setting_arr.get(index);
  index = thirdrot.setting_arr.indexOf(output);
  //println("Found this at index of third output: " + thirdrot.setting_arr.get(index));

  // index = charToIndex(output);
 // println("Third rotor setting: " + thirdrot.setting_arr.toString());
 // println("This index: " + index);
  output = reflector.charAt(index);
 // println("Into reflector: " + output);
  index = charToIndex(output);
  output = reflector.charAt(index);
 // println("Reflected: " + output);

  output = thirdrot.setting_arr.get(index);
//  println("Found this at index of third setting: " + output);
  index = thirdrot.status_arr.indexOf(output);
//  println("Found this at index of third status: " + thirdrot.status_arr.get(index));

  output = secondrot.setting_arr.get(index);
 // println("Found this at index of second setting: " + output);
//  index = secondrot.status_arr.indexOf(output);
//  println("Found this at index of second status: " + secondrot.status_arr.get(index));

  output = firstrot.setting_arr.get(index);
 // println("Found this at index of first setting: " + output);
  index = firstrot.status_arr.indexOf(output);
 // println("Found this at index of first status: " + firstrot.status_arr.get(index));

  output = indexToChar(index);
//  println("END RESULT: " + output);

  output = plugTransform(output);

  return output;
}

//input changes depending on what rotors are selected
void rotorUpdate(Rotor rot1, Rotor rot2, Rotor rot3){
  boolean shift = rot1.rotate(1, false);

  //if one full rotation,
  if(shift){
    println("SECOND ROTOR SHIFT!!");
    //turn second rotor
    shift = rot2.rotate(1, false);

    if(shift){
      println("THIRD ROTOR SHIFT!!");
      shift = rot3.rotate(1, false);
    }
  }
}

char plugTransform(char input){
  input = Character.toUpperCase(input);

  for(int i = 0; i < plugboard.size(); i++){
    String curr = plugboard.get(i);
    if(curr.charAt(0) == input){
      return curr.charAt(1);
    }
    if(curr.charAt(1) == input){
      return curr.charAt(0);
    }
  }
  return input;
}

void printChar(char c, int x, int y, int size) {
    //save old settings
    pushStyle();
    fill(255);
    // noStroke();
    square(x - size/2, y - size/2, size);
    fill(0);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(c, x, y);
    
    //restore old 
    popStyle();
} // Print character to screen
  
 void displayString(String str, int x, int y, int size){
    pushStyle();
  
    for (int i = 0; i < 26; i++) {
    char sc = str.charAt(i);
  
    int ypos = y + size/2 + i * size;
    int xpos = x + size/2;
  
    printChar(sc, xpos, ypos, size);
  }
  popStyle();
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
