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
  
  public Rotor(ArrayList<Character> status_arr){
    this.rotnum = 0;
    this.status_str = status_arr.toString();
    this.status_arr = status_arr;
  }
  
  
  //  methods  //
  void rotate(Rotor r, int rot){
    //update rotnum
    r.rotnum+=rot;
    if(r.rotnum>25){
      r.rotnum -= 26;
    }
    
    //rotate array
    for(int i = 0; i < rot; i++){
      Character temp = r.status_arr.remove(0);
      r.status_arr.add(temp);
    }
    
    //copy rotated to string
    r.status_str = r.status_arr.toString();
  }
}
