# How to write an addon

An addon to VGL is just a normal bukkit plugin with some extra stuff.  
We will be looking at the 1vs1 game as an example, you can find the full (and updated) code [here](https://github.com/VoxelGamesLib/1vs1)  
Your mainclass is pretty straight forward. You want to extend JavaPlugin as usual, but also implement Module (from VGL).
You also should mark the class @Singleton and add a @ModuleInfo
```java
@Singleton
@ModuleInfo(name = "1vs1", authors = "MiniDigger", version = "1.0.0")
public class OneVsOnePlugin extends JavaPlugin implements Module
```
The most important thing is that you add a onLoad that looks like this:
```java
    @Override
    public void onLoad() {
        ModuleHandler.offerModule(this); // always do this first!
    }
```
This is the part where your addon hooks into VGL. you want to ignore bukkits onEnable and onDisable and use VGL's enable and disable instead.
This will make sure, that you don't do stuff before VGL has initialized your module properly.  
After the module has been initalized, you can easly access any part of VGL via guice injections.  
If you are new to guice, check out this short introduction [here](introduction-to-guice) 

If your addon offers a new gamemode, you also should register that in your main file.  
Add a constant called GAMEMODE to hold a reference to your gamemode:
```java
public static final GameMode GAMEMODE = new GameMode("1vs1", OneVsOneGame.class);
```
then register that in your enable method:
```java
    @Override
    public void enable() {
        gameHandler.registerGameMode(GAMEMODE);
    }
```
Now your game is ready to be played by users!  
Be sure to checkout the other guides in the developer area to learn how to create phases, features and games!