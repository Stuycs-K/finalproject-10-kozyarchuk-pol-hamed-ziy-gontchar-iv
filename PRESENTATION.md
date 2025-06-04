### [Enigma Machine Emulator](https://youtu.be/1dc-PChjIdE)

## Intro:

## What it was - some history
![enigma machine image](https://github.com/Stuycs-K/finalproject-10-kozyarchuk-pol-hamed-ziy-gontchar-iv/blob/main/enigma/image_2025-06-04_073958274.png)

- It was created in WW2 by by Arthur Scherbius, and was used by the Nazis to encode messages.
- The large number of combinations with rotor settings, rotor combinations, and the plugboard led to what made the machine so unbreakable, which was 158,962,555,217,826,360,000 (quintillion) different combinations.
- The machine was broken because the Nazis would repeat certain phrases often in their messages, such as weather reports or "Heil Hitler".
- The signal for the letter goes through the input, into the plugboard, through the rotors, reflected in the reflector, and then back through the rotors, then plugboard, and finally lighting up the encoded letter.

## Running our program
- All you have to do is run "processing-java --sketch=enigma --run".
- Next, follow the user input guidelines to configure all the settings you want.
- You can choose any one of the three rotors we support, and in any order. Trying to type invalid input will not work.
- Next you will be able to configure your rotor settings, though you can choose not to which would result in the default positions for all of them. Trying to enter something besides Y or N will not work. For the settings numbers, attempts that are too high will not work either.
- Then, you will have the option to configure the plugboard. You can input the first letter of the connection, and then you will be prompted for the other letter you would want it to connect to. You will have another yes or no prompt at the end of every addition to the plugboard, to choose when to stop.
- Finally you will have reached our program. You can start typing on your keyboard, which will trigger the visualization and show the input/output at the bottom.
- If you want to reset, you don't have to redo the whole commandline running, just press 0 on the keyboard and you will be reprompted for settings.

## The Visualization
Visualization:
- To follow the visualization, you can use the arrows, but also we can see that yellow is for the first round of the process, and red is when it goes back around.
- It starts with the i/o (input / output), if any plugboard settings it will start at the corresponding letter it connects to.
- It goes straight across from the i/o to the first rotor, and then whatever letter you land on, you find in the next column in that same rotor. Then you go straight across to the second rotor.
- Follow this to the reflector, where whatever letter you land on in the right column, the letter to the left is what you reflect to. So find that letter in the right column.
- Finally go across, and this time whatever you land on in the left column, find that letter in the right column, and repeat that process for the other rotors, basically the first step but in reverse. Follow the arrows.
- Finally it'll go back to the i/o and you will get your result. If there is a plugboard setting for that, the output will correspond with the plugboard.
