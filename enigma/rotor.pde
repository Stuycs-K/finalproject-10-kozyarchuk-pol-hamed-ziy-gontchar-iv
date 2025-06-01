public class Rotor {
  int rotnum;
  String status_str;
  ArrayList<Character> status_arr;
  ArrayList<Character> setting_arr;


  //  constructors  //
  public Rotor(String status_str){
    this.rotnum = 0;
    this.status_str = status_str;
    this.status_arr = stringToArray(status_str);
    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
  }

  Rotor(ArrayList<Character> status_arr){
    this.rotnum = 0;
    this.status_str = status_arr.toString();
    this.status_arr = status_arr;
    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
}

  Rotor(String status_str, int setting){
    this.rotnum = 0;
    this.status_str = status_str;

    this.status_arr = stringToArray(status_str);
    // this.status_arr.rotate(setting);

    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");

    this.rotate(setting);
}

  Rotor(ArrayList<Character> status_arr, int setting){
    this.rotnum = 0;
    this.status_str = status_arr.toString();

    this.status_arr = status_arr;
    // this.status_arr.rotate(setting);

    this.setting_arr = stringToArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");

    this.rotate(setting);
}


  //  methods  //
  void rotate(int rot){
    //update rotnum
    this.rotnum+=rot;
    if(this.rotnum>25){
      this.rotnum -= 26;
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
