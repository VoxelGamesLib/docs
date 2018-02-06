# Features

There is not much here yet, but in the future this will be the place
where all features are listed and its parameters explained.
This may also contain links and documentation for 3rd party features.

### DoubleJumpFeature(com.voxelgameslib.voxelgameslib.feature.features.DoubleJumpFeature) v1.0  
Author: MiniDigger  
Description: Lets player jump higher  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### SpawnFeature(com.voxelgameslib.voxelgameslib.feature.features.SpawnFeature) v1.0  
Author: MiniDigger  
Description: Handles (re)spawning  
#### Params  
isRespawn (boolean)  
isInitialSpawn (boolean)  
#### Dependencies  
com.voxelgameslib.voxelgameslib.feature.features.MapFeature  
#### Soft Dependencies  
  
### JumpPad(com.voxelgameslib.voxelgameslib.feature.features.JumpPadFeature) v1.0  
Author: MiniDigger  
Description: Lets players use pressure plates to get launched up in the sky  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### PostGameFeature(com.voxelgameslib.voxelgameslib.feature.features.PostGameFeature) v1.0  
Author: aphelion  
Description: Implements post-game logic  
#### Params  
#### Dependencies  
com.voxelgameslib.voxelgameslib.feature.features.PersonalScoreboardFeature  
#### Soft Dependencies  
  
### NoDamageFeature(com.voxelgameslib.voxelgameslib.feature.features.NoDamageFeature) v1.0  
Author: MiniDigger  
Description: Small feature that disables any damage  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### ChannelFeature(com.voxelgameslib.voxelgameslib.feature.features.ChannelFeature) v1.0  
Author: aphel  
Description: Adds support for multiple channels in phases, e.g. for team based chats  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### NoHungerLossFeature(com.voxelgameslib.voxelgameslib.feature.features.NoHungerLossFeature) v1.0  
Author: aphelion  
Description: Stops hunger loss  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### ClearInventoryFeature(com.voxelgameslib.voxelgameslib.feature.features.ClearInventoryFeature) v1.0  
Author: MiniDigger  
Description: Simple feature that clears the inventory of all players when the game starts (or a new player joins)  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### VoteFeature(com.voxelgameslib.voxelgameslib.feature.features.VoteFeature) v1.0  
Author: MiniDigger  
Description: Allow players to vote on maps  
#### Params  
maxMaps (int)  
enableVoteMenu (boolean)  
#### Dependencies  
#### Soft Dependencies  
  
### PersonalScoreboard(com.voxelgameslib.voxelgameslib.feature.features.PersonalScoreboardFeature) v1.0  
Author: aphel  
Description: Each player has their own individual scoreboard  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### NoBlockPlaceFeature(com.voxelgameslib.voxelgameslib.feature.features.NoBlockPlaceFeature) v1.0  
Author: MiniDigger  
Description: Small feature that blocks block placing if active  
#### Params  
whitelist ([Lorg.bukkit.Material;)  
blacklist ([Lorg.bukkit.Material;)  
#### Dependencies  
#### Soft Dependencies  
  
### ScoreboardFeature(com.voxelgameslib.voxelgameslib.feature.features.ScoreboardFeature) v1.0  
Author: MiniDigger  
Description: Handles the scoreboard for all other features  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### MapFeature(com.voxelgameslib.voxelgameslib.feature.features.MapFeature) v1.0  
Author: MiniDigger  
Description: Handles loading and unloading of the map for this phase  
#### Params  
shouldUnload (boolean)  
type (com.voxelgameslib.voxelgameslib.feature.features.MapFeature$Type)  
#### Dependencies  
#### Soft Dependencies  
  
### AutoRespawnFeature(com.voxelgameslib.voxelgameslib.feature.features.AutoRespawnFeature) v1.0  
Author: MiniDigger  
Description: Makes dead players respawn automatically  
#### Params  
#### Dependencies  
#### Soft Dependencies  
  
### HealFeature(com.voxelgameslib.voxelgameslib.feature.features.HealFeature) v1.0  
Author: MiniDigger  
Description: Small feature that heals and feeds players on join  
#### Params  
heal (boolean)  
feed (boolean)  
#### Dependencies  
#### Soft Dependencies  
  
### GameModeFeature(com.voxelgameslib.voxelgameslib.feature.features.GameModeFeature) v1.0  
Author: MiniDigger  
Description: Simple feature that changes the gamemode of all players in the phase  
#### Params  
mode (org.bukkit.GameMode)  
#### Dependencies  
#### Soft Dependencies  
  
### VoidTeleportFeature(com.voxelgameslib.voxelgameslib.feature.features.VoidTeleportFeature) v1.0  
Author: aphel  
Description: Teleports player to spawn if they fall into the void  
#### Params  
#### Dependencies  
com.voxelgameslib.voxelgameslib.feature.features.SpawnFeature  
#### Soft Dependencies  
  
### MapInfoFeature(com.voxelgameslib.voxelgameslib.feature.features.MapInfoFeature) v1.0  
Author: MiniDigger  
Description: Displays some information about the current map in the scoreboard of the phase  
#### Params  
#### Dependencies  
com.voxelgameslib.voxelgameslib.feature.features.MapFeature  
com.voxelgameslib.voxelgameslib.feature.features.ScoreboardFeature  
#### Soft Dependencies  
  
### NoBlockBreakFeature(com.voxelgameslib.voxelgameslib.feature.features.NoBlockBreakFeature) v1.0  
Author: MiniDigger  
Description: Small feature that blocks block breaking if active  
#### Params  
whitelist ([Lorg.bukkit.Material;)  
blacklist ([Lorg.bukkit.Material;)  
#### Dependencies  
#### Soft Dependencies  
  
