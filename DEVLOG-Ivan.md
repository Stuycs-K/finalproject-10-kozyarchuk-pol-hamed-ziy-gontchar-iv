Work from 5/15 - 5/23
- Didn't know we were supposed to be logging research so this is a little late but here goes. Spent A LOT of time trying to understand how the hell this machine is able to function.
- Found this emulator almost instantly and it is quite useful for visualizing the steps in between encryption: https://www.101computing.net/enigma-machine-emulator/
- Had another 3d version we played around with but that was too complex, so we turned to something like this instead: https://cryptii.com/pipes/enigma-machine
- This one is SO COOL in the visualization but has given us at least one wrong output that differs from other sites (though most other inputs were correct): https://observablehq.com/@tmcw/enigma-machine
- This website had a very good and detailed reading explanation of the inner workings of the machine: https://www.ciphermachinesandcryptology.com/en/enigmatech.htm
- This site is also pretty good for general information on the machine, perhaps not as detailed though: https://www.cryptomuseum.com/crypto/enigma/working.htm
- Wiki where we got the rotor configurations from: https://en.wikipedia.org/wiki/Enigma_rotor_details
- THIS YOUTUBE VIDEO WAS PROBABLY THE CLICK POINT FOR ME: https://www.youtube.com/watch?v=ybkkiGtJmkM&pp=ygUOZW5pZ21hIG1hY2hpbmU%3D
- Revisited this video from the Perusall but found it didn't have as much technical info; I prefer the above one far more but it's still fine: https://www.youtube.com/watch?v=G2_Q9FoD-oQ&pp=ygUOZW5pZ21hIG1hY2hpbmU%3D
- Spent a lot of time playing around trying to figure out where the steps went and how they got there
- Abstract plans for code process and visualization elements

Work from 5/28
- Spent more time running through cases, and realized the most fatal error was probably the rotor wheels on the sites being weirdly configured, but once I realized how I should have put it, I genuinely understood how it works and what we must start doing to have it work. Starting to see code plan in my mind
- Updated the readme with pretty much as much info as we could have up to this point
- Added base processing file for enigma machine work to be done

Work from 5/29
- In class:
  - Caught up teammates on enigma functionality
  - Planned out file code structure and layout for running the file (although this is kinda a work in progress)
  - Started coding the encoding, a lot of skeleton functions with no use yet
  - Rotating an arraylist, encoding primary functions
- HW:
  - Refined main branch code for errors, mostly on return types
  - Added code to actually see how the encryption process is coming along (but not testable as of writing, will be checked later)
  - Function for character to it's ASCII value, to an index
  - Polina locked in with Rotor class which cleans everything SO NICELY!
  - Fixed rotating logic to be right-wards instead of left
  - Added reflector to the end of what we have for the encryption process so far

Work for 5/30-6/1
- In class:
  - Running through a bunch of simulations trying to understand what was going on, and how we can match that in our code
  - Went through it as well with Mr. K to try and see, but we didn't find an answer
  - WHY DOES THE LOGIC WORK FOR THE OTHER ROTORS BUT NOT FOR ROTOR 1!?!?!?!!
- HW:
  - I found this video and it explains the logic very clearly, and outlines a good path for implementing a coded solution: (https://www.youtube.com/watch?v=UKbP3Rjxhy0)
  - OH MY GOD I GOT ENCRYPTING AND DECRYPTING TO WORK FOR ALL VALUES BY FOLLOWING THE STRUCTURE OF THE VIDEO
    - I did this by adding another arraylist in the rotor class that tracks the settings
    - Reworked the process of the encryption function in the same way the video works
  - Added the notches as part of the rotor class, and made it functionally working for the rotate function
  - Fixed output formatting such that every five characters is a space
  - Added the functionality of a plugboard into the main enigma file, with it's own function as well
