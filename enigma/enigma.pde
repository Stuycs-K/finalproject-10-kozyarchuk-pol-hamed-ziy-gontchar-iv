import javax.swing.*;
int i_xpos, i_ypos, o_xpos, o_ypos, x_r1, x_r2, x_r3, x_ref, x_in;
Rotor r1, r2, r3;
String reflectorB;
int formater;
ArrayList<String> plugboard;
boolean plugboardb;
String sPlug;
// String firstRotor, secondRotor, thirdRotor;

void setup() {
  size(500,600);
  upset();
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

  //clear arrows
  pushStyle();
  noStroke();
  fill(255);
  rect(x_ref+19, 30, 95, 470);
  rect(x_r3+19, 30, 95, 470);
  rect(x_r2+19, 30, 95, 470);
  rect(x_r1+15, 30, 90, 470);

  popStyle();

  r1.display(x_r1, 30, 18, 0);
  r2.display(x_r2, 30, 18, 0);
  r3.display(x_r3, 30, 18, 0);
  displayString(reflectorB, x_ref, 30, 18);
  displayString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", x_in, 30, 18);
  if (plugboardb) {
    displayStringPlug(sPlug, x_in + 18, 30, 18);
  }
  // Plugboard Display
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
         rect(1, 518, 800, 33);
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
    upset();
  }

}

//runs x through the 3 specificed rotors, returns result
char encrypt(char x, Rotor firstrot, Rotor secondrot, Rotor thirdrot, String reflector){
 x = plugTransform(x);

  char output = x;
  int index = charToIndex(output);


  output = firstrot.status_arr.get(index);
  index = firstrot.setting_arr.indexOf(output);
  firstrot.displayHighlight(x_r1, 30, 18, 0, output, 'r');

  output = secondrot.status_arr.get(index);
  index = secondrot.setting_arr.indexOf(output);
  secondrot.displayHighlight(x_r2, 30, 18, 0, output, 'r');

  output = thirdrot.status_arr.get(index);
  index = thirdrot.setting_arr.indexOf(output);
  thirdrot.displayHighlight(x_r3, 30, 18, 0, output, 'r');

  output = reflector.charAt(index);

  index = charToIndex(output);
  output = reflector.charAt(index);

  displayStringHighlight(reflector,x_ref, 30, 18, output, 'r');
  displayString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", x_ref-18, 30, 18);
  displayRefAlph(x_ref,output, 'r');

  output = thirdrot.setting_arr.get(index);
  index = thirdrot.status_arr.indexOf(output);
  thirdrot.displayHighlight(x_r3, 30, 18, 0, output, 'l');

  output = secondrot.setting_arr.get(index);
  index = secondrot.status_arr.indexOf(output);
  secondrot.displayHighlight(x_r2, 30, 18, 0, output, 'l');

  output = firstrot.setting_arr.get(index);
  index = firstrot.status_arr.indexOf(output);
  firstrot.displayHighlight(x_r1, 30, 18, 0, output, 'l');

  output = indexToChar(index);
  //input output display

  displayStringHighlight("ABCDEFGHIJKLMNOPQRSTUVWXYZ", x_in, 30, 18, output, 'l');
 output = plugTransform(output);

  //highlight input yellow
  displayRefAlph(x_in+18,x, 'y');


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

Rotor rotorFormatter(String input, int setting){
  if(input.equals("I")){
    return new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", setting, 'Q');
  }
  else if(input.equals("II")){
    return new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", setting, 'E');
  }
  else if(input.equals("III")){
    return new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", setting, 'V');
  }
  return new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", setting, 'Q');
}

String prompt(String s)
{
   // println(s);
   String entry = JOptionPane.showInputDialog(s);
   // if (entry == null)
  	// return null;
   // println(entry);
   return entry;
}

void upset() {
  plugboardb = false;
  sPlug = "";

  String firstRotor = "";
  while(!firstRotor.equals("I") && !firstRotor.equals("II") && !firstRotor.equals("III")){
	   firstRotor = prompt("What rotor would you like to be in the first position ( I , II, III):");
     // println()
  }
  String secondRotor = "";
  while(!secondRotor.equals("I") && !secondRotor.equals("II") && !secondRotor.equals("III")){
	   secondRotor = prompt("What rotor would you like to be in the second position ( I , II, III):");
  }
  String thirdRotor = "";
  while(!thirdRotor.equals("I") && !thirdRotor.equals("II") && !thirdRotor.equals("III")){
	   thirdRotor = prompt("What rotor would you like to be in the third position ( I , II, III):");
  }

  String setRotors = "";
  while(!setRotors.equals("Y") && !setRotors.equals("N")){
    setRotors = prompt("Do you want to set certain starting positions for the rotors? ( Y / N )");
  }

  int settingOne = 100;
  int settingTwo = 100;
  int settingThree = 100;
  if(setRotors.equals("Y")){
    while((settingOne > 26) || (settingOne < 0)){
      settingOne = Integer.parseInt(prompt("Please select the starting setting for the first rotor ( 0 - 26 )"));
    }

    while((settingTwo > 26) || (settingTwo < 0)){
      settingTwo = Integer.parseInt(prompt("Please select the starting setting for the second rotor ( 0 - 26 )"));
    }

    while((settingThree > 26) || (settingThree < 0)){
      settingThree = Integer.parseInt(prompt("Please select the starting setting for the third rotor ( 0 - 26 )"));
    }
  }
  else{
    settingOne = 0;
    settingTwo = 0;
    settingThree = 0;
  }



  String setPlugboard = "";
  while(!setPlugboard.equals("Y") && !setPlugboard.equals("N")){
    setPlugboard = prompt("Do you want to set any plugboard settings? ( Y / N )");
  }
  plugboard = new ArrayList<String>();

  while(setPlugboard.equals("Y")){
    String initialPlug = prompt("Enter the first letter you want the plug to go to: ");
    initialPlug += prompt("Enter the letter do you want the plug for " + initialPlug + " to go to: ");
    setPlugboard = "";
    while(!setPlugboard.equals("Y") && !setPlugboard.equals("N")){
      setPlugboard = prompt("Do you want to set any other plugboard settings? ( Y / N )");
    }
    plugboard.add(initialPlug);
    sPlug += initialPlug;
    println("Plugboard: " + sPlug);
    plugboardb = true;
  }



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

  r1 = rotorFormatter(firstRotor, settingOne);
  r2 = rotorFormatter(secondRotor, settingTwo);
  r3 = rotorFormatter(thirdRotor, settingThree);

  // r1 = new Rotor("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 'Q');
  // r2 = new Rotor("AJDKSIRUXBLHWTMCQGZNPYFVOE", 'E');
  // r3 = new Rotor("BDFHJLCPRTXVZNYEIWGAKMUSQO", 'V');

  // plugboard.add("AB");
  // plugboard.add("CG");
  // plugboard.add("ZE");

  //r1.printChar('a', width/2, height/2, 20);
  textSize(15);
  text("i/o", 450, 25);
  text("p", 473, 25);
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

  x_ref = 40;
  x_in = 450;
  displayString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", x_ref-18, 30, 18);
  displayString(reflectorB, x_ref, 30, 18);
  displayString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", x_in, 30, 18);

  if (plugboardb) {
    displayStringPlug(sPlug, x_in + 18, 30, 18);
  }
}
