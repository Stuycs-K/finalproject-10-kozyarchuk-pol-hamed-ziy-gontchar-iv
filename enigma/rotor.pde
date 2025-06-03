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
      println("Rotated Arr: " + this.status_arr.toString());

      temp = this.setting_arr.remove(0);
      this.setting_arr.add(temp);
      println("Rotated Setting: " + this.setting_arr.toString());
    }

    //copy rotated to string
    this.status_str = arrayToString(this.status_arr);

    return returner;
  }

  void printChar(char c, int x, int y, int size) {
    fill(255);
    square(x - size/2, y - size/2, size);
    fill(0);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(c, x, y);
  } // Print character to screen

  void printChar(char c, int x, int y, int size, color bcol, color fcol) {
    fill(bcol);
    square(x - size/2, y - size/2, size);
    fill(fcol);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(c, x, y);
  }

  void display(int x, int y, int size, int gap) {
    for (int i = 0; i < 26; i++) {
      char sc = this.status_arr.get(i);
      char ac = this.setting_arr.get(i);

      int ypos = y + size/2 + i * size;
      int xpos = x + size/2;

      printChar(sc, xpos + gap + size, ypos, size);
      printChar(ac, xpos, ypos, size);
    }
  } // Print rotor to screen

  void display(int x, int y, int size, int gap, char oldChar, char newChar, color oldColor, color newColor, boolean line) {
    // Variables to hold the positions of the old and new characters
    int oldxpos = 0, oldypos = 0, newxpos = 0, newypos = 0;

    // Highlight the old and new characters
    for (int i = 0; i < 26; i++) {
      char sc = this.status_arr.get(i);
      char ac = this.setting_arr.get(i);

      int ypos = y + size/2 + i * size;
      int xpos = x + size/2;

      printChar(sc, xpos + gap + size, ypos, size);
      printChar(ac, xpos, ypos, size);

      if (sc == oldChar) {
        printChar(sc, xpos + gap + size, ypos, size, oldColor, color(255));
        oldxpos = xpos + gap + size;
        oldypos = ypos;
      } 
      // Overwrite the character with highlight
      if (ac == newChar) {
        printChar(ac, xpos, ypos, size, newColor, color(255));
        newxpos = xpos;
        newypos = ypos;
      } // Overwrite the character with highlight
    }
    
    if (line) {
      stroke(0);
      line(newxpos, newypos, oldxpos, oldypos); // Draw line between old and new character
    }
  }

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
