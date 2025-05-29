void setup(){
  String rotor1s = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
  String rotor2s = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
  String rotor3s = "BDFHJLCPRTXVZNYEIWGAKMUSQO";


  ArrayList<Character> rotor1 = stringToArray(rotor1s);
  ArrayList<Character> rotor2 = stringToArray(rotor2s);
  ArrayList<Character> rotor3 = stringToArray(rotor3s);
  // println(rotor1.toString());
  // println(rotor2.toString());
  // println(rotor3.toString());

}

ArrayList<Character> stringToArray(String s) {
  ArrayList<Character> output = new ArrayList<Character>();
  for (int i = 0; i < s.length(); i++) {
    output.add(s.charAt(i));
  }

  return output;
}
