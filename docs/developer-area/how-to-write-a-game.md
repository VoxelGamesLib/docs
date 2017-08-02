# How to write a game

A Game is made up from multiple parts. First you want to make sure you have some phases and features you want to use.
Be sure to check out the other tutorials for that. 
Then you can create a game class. It shoudl extend `AbstractGame` and have a `@GameInfo` annotation:
```java
@GameInfo(name = "1vs1", author = "MiniDigger", version = "v1.0", description = "1vs1 Description")
public class OneVsOneGame extends AbstractGame
```
Then you need to have a constructor. You want to give the super constructor the gamemode constant you made in your addon class
(If you didn't do that, go back to that step [here](how-to-write-an-addon)).  
Your constructor should look like this:
```java
    public OneVsOneGame() {
        super(OneVsOnePlugin.GAMEMODE);
    }
```
Then you have two methods: `initGameFromModule` and `initGameFromDefinition.` 
Your games will be serialized into a game definition by default, so that game designers can edit it easily.  
That mean, that you only want to create phases and features in the `initGameFromModule` method.
Your initGameFromDefinition method should just be this:
```java
    @Override
    public void initGameFromDefinition(@Nonnull GameDefinition gameDefinition) {
        super.initGameFromDefinition(gameDefinition);

        loadMap();
    }
```
`loadMap` will make sure that the lobby map is loaded.  
You define all your phases in the `initGameFromModule` method:
```java
    @Override
    public void initGameFromModule() {
        setMinPlayers(2);
        setMaxPlayers(2);

        LobbyWithVotePhase lobbyWithVotePhase = createPhase(LobbyWithVotePhase.class);
        GracePhase gracePhase = createPhase(GracePhase.class);
        OneVsOnePhase survivalGamesPhase = createPhase(OneVsOnePhase.class);

        lobbyWithVotePhase.setNextPhase(gracePhase);
        gracePhase.setNextPhase(survivalGamesPhase);

        activePhase = lobbyWithVotePhase;

        loadMap();
    }
```
As you can see, there are multiple steps:
First, you spefify the min and maxmium amount of players required to play this game.  
Then you create all your phases.  
After that, you make sure the order of phases is right.  
In the end, you specify the first active phase and load the lobby map.
And thats all! Now you can just start a game ingame via `/game start <gamemode>`!