public class Rotor {
  int rotnum;
  String status_str;
  char notch;
  ArrayList<Character> status_arr; // Scrambled letters
  ArrayList<Character> setting_arr; // aplhabet rotations


  //  constructors  //
  public Rotor(String status_str, char notch){
    this.rotnum = 0;
    this.notch = notch;
    this.status_str = status_str;
    this.status_arr = stringToArray(status_str);
    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
  }

  Rotor(ArrayList<Character> status_arr, char notch){
    this.rotnum = 0;
    this.notch = notch;
    this.status_str = status_arr.toString();
    this.status_arr = status_arr;
    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
}

  Rotor(String status_str, int setting, char notch){
    this.rotnum = 0;
    this.status_str = status_str;
    this.notch = notch;

    this.status_arr = stringToArray(status_str);
    // this.status_arr.rotate(setting);

    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");

    this.rotate(setting, true);
}

  Rotor(ArrayList<Character> status_arr, int setting, char notch){
    this.rotnum = 0;
    this.status_str = status_arr.toString();
    this.notch = notch;

    this.status_arr = status_arr;
    // this.status_arr.rotate(setting);

    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");

    this.rotate(setting, true);
}


  //  methods  //
  boolean rotate(int rot, boolean startSet){
    boolean returner = false;

    //update rotnum
    // this.rotnum+=rot;
    // if(this.rotnum>25){
    //   this.rotnum -= 26;
    // }

    if(!startSet && this.setting_arr.get(0)==this.notch){
      returner = true;
    }

    //rotate array
    for(int i = 0; i < rot; i++){
      Character temp = this.status_arr.remove(0);
      this.status_arr.add(temp);
    //  println("Rotated Arr: " + this.status_arr.toString());

      temp = this.setting_arr.remove(0);
      this.setting_arr.add(temp);
     // println("Rotated Setting: " + this.setting_arr.toString());
    }

    //copy rotated to string
    this.status_str = arrayToString(this.status_arr);

    return returner;
  }

  void display(int x, int y, int size, int gap) {
    pushStyle();

    for (int i = 0; i < 26; i++) {
      char sc = this.status_arr.get(i);
      char ac = this.setting_arr.get(i);

      int ypos = y + size/2 + i * size;
      int xpos = x + size/2;

      printChar(sc, xpos + gap + size, ypos, size);
      printChar(ac, xpos, ypos, size);
    }

    popStyle();
  } // Print rotor to screen


  void displayHighlight(int x, int y, int size, int gap, char target, char dir) {
    pushStyle();

    for (int i = 0; i < 26; i++) {
      char sc = this.status_arr.get(i);
      char ac = this.setting_arr.get(i);

      int ypos = y + size/2 + i * size;
      int xpos = x + size/2;

      if(sc == target){
        printCharHighlight(sc, xpos+gap+size, ypos, size,dir);
        if(dir == 'r'){
          line(xpos + 30, ypos, xpos+93, ypos);
          triangle(xpos+30, ypos, xpos+35, ypos+5, xpos+35, ypos-5);
        }
      } else if (ac == target){
        printCharHighlight(ac, xpos, ypos, size, dir);
        if(dir == 'l'){
          line(xpos - 7, ypos, xpos - 75, ypos);
          triangle(xpos-9, ypos, xpos-14, ypos+5, xpos-14, ypos-5);
        }
      }
    }

    popStyle();
  } // Print rotor to screen

}

void printCharHighlight(char c, int x, int y, int size, char dir) {
    //save old settings
    pushStyle();
    //if pointing left;
    if(dir == 'l'){
      fill(255,0,0);
    } else if(dir == 'r'){
      fill(255,255,0);
    }
    // noStroke();
    square(x - size/2, y - size/2, size);

    fill(0);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(c, x, y);

    //restore old
    popStyle();
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

void displayStringHighlight(String str, int x, int y, int size, char target, char dir){
    pushStyle();

    for (int i = 0; i < 26; i++) {
      char sc = str.charAt(i);

      int ypos = y + size/2 + i * size;
      int xpos = x + size/2;

      if(sc == target){
          printCharHighlight(sc, xpos, ypos, size, 'l');
         if(dir == 'l'){
            line(xpos - 15, ypos, xpos-80, ypos);
            triangle(xpos-15, ypos, xpos-20, ypos+5, xpos-20, ypos-5);
          }
      } else if(i == charToIndex(target)){
          printCharHighlight(sc, xpos, ypos, size, 'r');
          if(dir == 'r'){
            line(xpos + 15, ypos, xpos+80, ypos);
            triangle(xpos+15, ypos, xpos+20, ypos+5, xpos+20, ypos-5);
          }
       }
      }
      popStyle();

}

void displayRefAlph(int x, char target, char c) {
    pushStyle();

    target = Character.toUpperCase(target);
    String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    println("target: " + target);
    for(int i = 0; i < 26; i++){
      char cur = alph.charAt(i);
      println("cur: " + cur);
      int ypos = 30 + 18/2 + i*18;
      int xpos = x-18 - 18/2;

      if(cur == target){
        if(c == 'r'){
          printCharHighlight(cur, xpos+18, ypos, 18, 'l');
        } else if(c == 'y'){
          printCharHighlight(cur, xpos+18, ypos, 18, 'r');
        }
      }
    }
    popStyle();
  }

ArrayList<Character> stringToArray(String s) {
  ArrayList<Character> output = new ArrayList<Character>();
  for (int i = 0; i < s.length(); i++) {
    output.add(s.charAt(i));
  }
  return output;
}

String arrayToString(ArrayList<Character> arr){
  String s  = "";
  for(int i = 0; i < arr.size(); i++){
    s += arr.get(i);
  }
  return s;
}
