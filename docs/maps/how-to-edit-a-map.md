# How to edit a map

This page aims to explain how to edit a map, once it was addded to a world repository. 

TODO: add images and a vid.

## WorldCreator Modify Mode

You can enter the edit mode again by running `/wm start <worldname>`. VGL will get the world, unzip it and load it, while teleporting you to the center. 
 
Now you can utilize a bunch of commands to modify the world. You an use `/wm` with the subcommands `displayname`, `author`, `radius`, `center` or `gamemode` to change those.  

To change markers (they should be currently visible), enter `/editmode on` and use the same commands you know already.  

Once you are done, run `/editmode off` and `/wm stop` to stop editing. This will let VGL do all the packaging, saving and uploading again and the changed map will be available to be used in games.
