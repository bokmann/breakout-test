credit where credit is due:

https://github.com/SamanthaRadocchia/breakout-game

That is the original source of the ruby code for this project.  I needed a ruby equivalent to a breakout game that students in my high school class had in Java, and this was close.  I started with samantha's code, added it to the rask shell, then began changing the structure to do more.




checkout, bundle install, and see if you can start the game with:

rake game:play


note - in order to get gosu installed, you might need to install a few other things on your machine.

you can make gosu's dependencies happy with a few installs from homebrew:

brew install sdl2 libogg libvorbis


If you can't get it working, don't worry... I'm not even sure I'm going to have tie to demo this tomorrow.

If you can get it working, my goal is to show the students how I can commit code, rollback, keep a history, then share it with you, then have you do something (like add scoring) while I do something else (like fix the strange bug in the paddle sollision)  then integrate the work together with git.

