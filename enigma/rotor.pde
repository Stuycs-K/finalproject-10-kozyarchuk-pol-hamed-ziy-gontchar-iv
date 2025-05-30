public class Rotor {
  int rotnum;
  String status_str;
  ArrayList<Character> status_arr;
  
  
  //  constructors  //
  public Rotor(String status_str){
    this.rotnum = 0;
    this.status_str = status_str;
    this.status_arr = stringToArray(status_str);
  }
  
  Rotor(ArrayList<Character> status_arr){
    this.rotnum = 0;
    this.status_str = status_arr.toString();
    this.status_arr = status_arr;
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
