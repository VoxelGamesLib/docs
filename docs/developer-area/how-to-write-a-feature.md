# How to write a feature

Features are small parts of a game that gets added to a phase. Features are the modular core of VGL.  
You should try to create as many features as possible so that game designers can easily remix them into new games.  

A feature consits of multile parts:  //TODO make this a list  
* [A @FeatureInfo annotation](#featureinfo)   
* [@Expose'd variables](#exposed-variables)   
* [Event Handlers](#event-handlers)  
* [Dependencies](#dependencies)  
* [start/stop/tick methods](#startstoptick-methods)    

## General

A feature extends `AbstractFeature`.  
You can access other features (make sure you read about [dependencies](#dependencies) first) by calling
`YourFeature feature = getPhase().getFeature(YourFeature.class);`  
You can find a list of existing features [here](../components/features/) or you can look into 
[the features package](https://github.com/VoxelGamesLib/VoxelGamesLibv2/tree/master/src/main/java/me/minidigger/voxelgameslib/feature/features) 
VGL has.

## @FeatureInfo

The feature info adds some metadata to features, that is used to generate documentation. its fairly straight 
forward. Take a look at this example: 
`@FeatureInfo(name = "NoBlockBreakFeature", author = "MiniDigger", version = "1.0", description = "Small feature that blocks block breaking if active")`

## Exposed Variables

Its always a good idea to expose as many vars as possible. Exposed vars will end up in the game definitions, so that
game designers can easily adjust them if needed.  
You have to be careful to what you expose, not every type can be easily serialized! (if you are missing a type, there is currently no way to add a custom type adapter, 
create an issue on github and we will look into that)  
Lets look back at our NoBlockBreakFeature:
```java
@Expose
private Material[] whitelist = new Material[0];
@Expose
private Material[] blacklist = new Material[0];
```
It exposes a material black and whitelist. Its important to have a default value so that you don't end up dealing with nulls.
VGL will make sure that if a game designer modified the values, those fields will be updated.

## Event Handlers

There are two types of event handlers in VGL: normal `@EventHandler`s and `@GameEvent`s. 
The `@EventHandler` annotation works like in every other bukkit plugin, but you need to make sure that you only handle events, that are related 
to the game the feature runs in. You don't want the NoBlockBreakFeature of the SurvivalGames game affect the Bedwars game that is currently running too!  
Thats where `@GameEvent` comes in. It tries to figure out if the event was caused by a player and only forward it to your method, if the player plays in the game the
feature is attached too. This doesn't work for every event, you might have to do some checks yourself (like check the world name or something like that).  
VGL will print a warning when it couldn't resolve a user.
Generally, `@GameEvent` works exactly as `@EventHandler`:
```java
@GameEvent
public void onBlockBreak(BlockBreakEvent event) {
// your event code
}
```

## Dependencies

Some features require that other features are active. For example there is a Scoreboard feature, that provides scoreboards for all players.  
The map info feature uses that scoreboard and displays some info about the current active map on it.  
That mean, the map info feature depends on both the scoreboard feature and the map feature.  
To implement that, you just have to override the getDependencies (or getSoftDependencies) method:
```java
@Override
public Class[] getDependencies() {
    return new Class[]{MapFeature.class, ScoreboardFeature.class};
}
```
VGL then will make sure that the features are present (expect for soft dependencies) and loaded before your feature.  
Once you have that, you can easily access the feature like this:  
```java
ScoreboardFeature scoreboardFeature = getPhase().getFeature(ScoreboardFeature.class);
Scoreboard scoreboard = scoreboardFeature.getScoreboard();
scoreboard.createAndAddLine(ChatColor.YELLOW + "" + ChatColor.BOLD + "Author: ");
.....
```


## Start/Stop/Tick methods

VGL also provides you with some additonal methods you can override:  // TODO make this a list  
* void start(): called when the phase this feature is attached to starts  
* void stop(): called when the phase this feature is attached to stops  
* void tick(): called when the phase this feature is attached to ticks (20 times each second)  
* void init(): called when the feature is added to phase