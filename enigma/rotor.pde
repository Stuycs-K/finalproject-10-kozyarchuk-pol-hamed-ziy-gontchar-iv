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
    // noStroke();
    square(x - size/2, y - size/2, size);
    fill(0);
    text(c, x/2, y/2);
  } // Print character to screen

  void diaplay(int x) {
    for (int i = 0; i < 26; i++) {

    }
  } // Print rotor to screen

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
