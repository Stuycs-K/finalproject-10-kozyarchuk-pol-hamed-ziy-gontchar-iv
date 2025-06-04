### Enigma Machine Emulator

## Intro:

## What it was - some history (Polina):
![enigma machine image](https://github.com/Stuycs-K/finalproject-10-kozyarchuk-pol-hamed-ziy-gontchar-iv/blob/main/enigma/image_2025-06-04_073958274.png)

- It was created in WW2 by by Arthur Scherbius, and was used by the Nazis to encode messages.
- The large number of combinations with rotor settings, rotor combinations, and the plugboard led to what made the machine so unbreakable, which was 158,962,555,217,826,360,000 (quintillion) different combinations.
- The machine was broken because the Nazis would repeat certain phrases often in their messages, such as weather reports or "Heil Hitler".
- The signal for the letter goes through the input, into the plugboard, through the rotors, reflected in the reflector, and then back through the rotors, then plugboard, and finally lighting up the encoded letter.

## Running our program (Ivan)
- All you have to do is run "processing-java --sketch=enigma --run".
- Next, follow the user input guidelines to configure all the settings you want.
- Finally just type in your input and watch the visualization happen.

## The Visualization (Ziyad)
Visualization:
- To follow the visualization, you can use the arrows, but also we can see that yellow is for the first round of the process, and red is when it goes back around.
- It starts with the i/o (input / output), if any plugboard settings it will start at the corresponding letter it connects to.
- It goes straight across from the i/o to the first rotor, and then whatever letter you land on, you find in the next column in that same rotor. Then you go straight across to the second rotor.
- Follow this to the reflector, where whatever letter you land on in the right column, the letter to the left is what you reflect to. So find that letter in the right column.
- Finally go across, and this time whatever you land on in the left column, find that letter in the right column, and repeat that process for the other rotors, basically the first step but in reverse. Follow the arrows.
- Finally it'll go back to the i/o and you will get your result. If there is a plugboard setting for that, the output will correspond with the plugboard.
