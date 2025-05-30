int i_xpos, i_ypos, o_xpos, o_ypos;
Rotor r1, r2, r3;

void setup(){
  size(800,600);
  textSize(40);
  fill(0);
  
  i_xpos = 0;
  i_ypos = 40;
  o_xpos = 0;
  o_ypos = 340;

  r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ");
  r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE");
  r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO");
}


//dont delete; draw needed to run
void draw(){
  
}

void keyPressed(){
  
  //if valid
  if ( (key>=65 && key<= 90) || (key>=97 && key<=122) ){
    //print user input(uppercase) top of screen
    char input = (char) (key-32);
    text(input, i_xpos, i_ypos);
    i_xpos+=textWidth(input);
    
    //input changes depending on what rotors are selected
    rotorUpdate(r1,r2,r3);
    
    //print result
    char result = encrypt(key, r1, r2, r3);
    text(result, o_xpos, o_ypos);
    o_xpos+=textWidth(result);
  }
}

//runs x through the 3 specificed rotors, returns result
char encrypt(char x, Rotor firstrot, Rotor secondrot, Rotor thirdrot){
  char output = x;
  int index = charToIndex(output);

  println("Pre 1st rotor: " + output + "   INDEX: " + index);
  output = firstrot.status_arr.get(index);
  println("Post 1st rotor: " + output);

  index = charToIndex(output);
  output = secondrot.status_arr.get(index);
  println("Post 2nd rotor: " + output);

  index = charToIndex(output);
  output = thirdrot.status_arr.get(index);
  println("Post 3rd rotor: " + output);

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
