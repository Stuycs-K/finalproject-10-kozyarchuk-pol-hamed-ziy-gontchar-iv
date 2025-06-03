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
  textSize(15);
  text("input/output", 415, 25);
  text("first rotor", 330, 25);
  text("second rotor", 215, 25);
  text("third rotor", 115, 25);
  text("reflector", 15, 25);
  
  x_r1 = 345;
  x_r2 = 240;
  x_r3 = 135;
  r1.display(x_r1, 30, 18, 0);
  r2.display(x_r2, 30, 18, 0);
  r3.display(x_r3, 30, 18, 0); 
  
  
  // r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", charToIndex('D'));
  // r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", charToIndex('O'));
  // r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", charToIndex('G'));

  reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT";
  // reflectorB = "ABCDEFGDIJKGMKMIEBFTCVVJAT";
  
  x_ref = 30;
  displayString(reflectorB, x_ref, 30, 18);
  displayString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 450, 30, 18);
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
 // x = plugTransform(x);

  char output = x;
  int index = charToIndex(output);

  
  output = firstrot.status_arr.get(index);
  index = firstrot.setting_arr.indexOf(output);
  firstrot.displayHighlight(x_r1,30,18,0,output);
  
   output = secondrot.status_arr.get(index);
 
  index = secondrot.setting_arr.indexOf(output);
 
  output = thirdrot.status_arr.get(index);
 
  index = thirdrot.setting_arr.indexOf(output);
 
  output = reflector.charAt(index);
  index = charToIndex(output);
  output = reflector.charAt(index);
  

  output = thirdrot.setting_arr.get(index);
  index = thirdrot.status_arr.indexOf(output);
  
  output = secondrot.setting_arr.get(index);
 
  output = firstrot.setting_arr.get(index);
  index = firstrot.status_arr.indexOf(output);

  output = indexToChar(index);

 // output = plugTransform(output);

  return output;
}

//input changes depending on what rotors are selected
void rotorUpdate(Rotor rot1, Rotor rot2, Rotor rot3){
  boolean shift = rot1.rotate(1, false);

  //if one full rotation,
  if(shift){
    //turn second rotor
    shift = rot2.rotate(1, false);

    if(shift){
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
