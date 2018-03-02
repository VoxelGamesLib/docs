# Introduction

VoxelGamesLib allows map makers to easily build, configure and share their maps. These pages aim to explain on how you do exactly that.


## Guidelines

There are some tips and guidelines on how to make a good map:

#### Use a void world

VoxelGamesLib will load all worlds with a void world generator, to minimize chunk generation and loading impact. You should build your maps in a void world, or move it into a void world using mcedit.  
While in mcedit, also make sure to truncate any extra chunks to reduce file size.

#### Build your map for many modes

In VGL you will be defining special locations in your world via named player skulls. You should make sure to put as many as possible to allow your map to be played with multiple gamemodes.  
For example: your 1vs1 map might need only 1 spawn for each team, but if you add more, users could also play 2vs2 or even 4vs4 based gamemodes on it.  
Don't worry, VGL will only allow your map to be played with the gamemodes you defined and tested to make sure that players will have a good experience.

#### Iterate on your design

VGL allows you to quickly make changes to your maps, without needing to go thru all the pain of setting it up again. You can quickly add new positions or modify the world.  
You should use this to improve your maps over time. Listen to player feedback or just watch them play and think about how you can improve your maps.

#### Share your maps

The VGL believes in the power of open source. You take and you give, sharing is caring, you know all those sayings. Many map makers already shared their maps and every server is allowed to use them, so its only fair to share
your stuff too. That way, you can build up a reputation in the community and allow more players to enjoy your maps, and after all, thats why we do all of this, right?