# How to create a map

This page aims to explain how to create a map and get it into the VGL system.

TODO: add pictures and a video

## Building your map

We recommend you to build your map on a dedicated build server. That way you can throw all your Worldedits and Voxelsnipers on there and using them without fearing any interference. 
If you work alone, you can just setup a local server, since you will need to use mcedit to delete chunks, this saves you from downloading the map.  
While building, think about where special positions like spawns or objectives should be located. You don't need to set them now, but you will need to do that when you import the map into VGL.  

## Importing into VGL

Once you builded your map, add it to a server which has VGL installed. This can be a local server or a remote test server. I wouldn't recommend to do this on a production server, but it should work too.  
Just place the map in the root foler of your server, next to the world and world_nether folders.  
VGL has a chat based wizard like interface to import your map. Start it with `/wc start`.    

1. You will see a promt asking you for the name. Click the promt and enter the name of the world (the name of the folder you uploaded). 
    Don't worry, this is not the display name players will see.  
1. This will start the edit mode and you will be teleported to the world spawn.  
    The edit mode is similar to other gamemodes VGL offers, but you are not expected to show off your PvP abilities here. This mode is designed to allow you to easily modify the special locations of the map.  
    You will now see a promt to select the center of the map. This is not the spawn for the players, this is only used for scanning for markers and preloading chunks.
1. Once you set a center, you will be promted to select the radius. Again, just for internal stuff, it doesn't really need to be percice, if you set it too large, creating the world might take some time.
1. After setting the radius, you will be asked for a display name. This is the name the players will see. 
1. Now that you have the name set, you can set the author. This can be your name, a list of names or the name of your build team. It doesn't really matter, its just a nice way of crediting the creators.
1. Now we have all that done, we can configure the gamemodes. The wizard will show you a list of all currently installed gamemodes, you can select one by clicking it. Once you selected all gamemodes, press done.
1. Now we can get to the fun part: setting all markers. Enable the edit mode by clicking on the promt or running `/wc edit on`.  
    You now can set markers. To learn what marker does what, check the documentation of the game modes. The easiest way to get markers is running `/editmode gui`. 
    You will see a gui with all known (all markers of all features that are currently loaded), click one to get the item, place one to set a marker. Pretty easy, eh?  
    Once you set all markers, finish the world import by running `/wc edit off`. Don't worry if you forgot a marker or smth, you can always edit your map later to add more. 
1. You are done now. You will see a nice summary and a promt to finish. Once you press that, VGL will write all your config into a config.json, it will scan for all your placed markers, zip everything up and upload it into your world repositiory. 
    The edit mode gamemode will abort now. 