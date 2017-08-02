# How to write a phase

A phase is a time period in which certain features are active. 
Writing a phase is pretty straight forward. VGL offers two base phase types: AbstractPhase and TimedPhase. 
Timed phases end after a spefified amount of time, abstract phases need to be ended by a feature. 
This doesn't mean that features can't end timed phases.  
Lets take a look at the OneVsOnePhase:
```java
public class OneVsOnePhase extends TimedPhase {

    @Override
    public void init() {
        setName("OneVsOnePhase");
        setTicks(2 * 60 * GameConstants.TPS);
        super.init();
        setAllowJoin(false);
        setAllowSpectate(true);

        MapFeature mapFeature = getGame().createFeature(MapFeature.class, this);
        mapFeature.setShouldUnload(true);
        addFeature(mapFeature);

        SpawnFeature spawnFeature = getGame().createFeature(SpawnFeature.class, this);
        spawnFeature.setRespawn(false);
        spawnFeature.setInitialSpawn(false);
        addFeature(spawnFeature);

        GameModeFeature gameModeFeature = getGame().createFeature(GameModeFeature.class, this);
        gameModeFeature.setGameMode(GameMode.SURVIVAL);
        addFeature(gameModeFeature);

        OneVsOneFeature oneVsOneFeature = getGame().createFeature(OneVsOneFeature.class, this);
        addFeature(oneVsOneFeature);

        DuelFeature duelFeature = getGame().createFeature(DuelFeature.class, this);
        addFeature(duelFeature);
    }
}
```
Looks pretty easy, right? 
Lets break it down:
the phase extends `TimedPhase`, so it will end after a speficied amount of time (ticks).  
We see a init method. that method is called when the phase is added to the game. generally, thats the only 
method you need, all game logic should be part of the features.
At the top of the init method, we set the name and the time, call the super (IMPORTANT!) and configure if players
can join or spectate. 
Below that, we add a bunch of features. You want to create a feature via the `creatFeature` method `Game` offers,
set some options and then add the feature to the phase. 
Checkout [How to write a Feature](how-to-write-a-feature) to learn more about features.