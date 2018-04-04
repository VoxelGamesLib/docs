# Stats API

VGL allows you to track all kind of stats for your players. This page will explain you how your addon and provide new stat types and how to use the api in general.

# Defining new stat types

StatTypes are defined via an enum, that has to look somewhat like this:

```java
public enum OneVsOneStats implements Trackable {

    KILLS(OneVsOneLangKey.STAT_KILLS_NAME, OneVsOneLangKey.STAT_KILLS_TEXT, true, StatFormatter.INT),
    GAMES(OneVsOneLangKey.STAT_GAMES_NAME, OneVsOneLangKey.STAT_GAMES_TEXT, true, StatFormatter.INT);

    private Stat stat;
    private Translatable displayName;
    private Translatable text;
    private boolean announce;
    private StatFormatter statFormatter;

    OneVsOneStats(Translatable displayName, Translatable text, boolean announce) {
        this(displayName, text, announce, StatFormatter.DOUBLE);
    }

    OneVsOneStats(Translatable displayName, Translatable text, boolean announce, StatFormatter statFormatter) {
        this.displayName = displayName;
        this.text = text;
        this.announce = announce;
        this.statFormatter = statFormatter;
    }

    @Override
    public void setStat(Stat stat) {
        this.stat = stat;
    }

    @Override
    public Stat getStat() {
        return stat;
    }

    @Override
    public StatInstance getInstance(User user) {
        return stat.getInstance(user);
    }

    @Override
    public StatInstance getInstance(UUID id) {
        return stat.getInstance(id);
    }

    @Override
    public StatInstance getNewInstance(UUID uuid) {
        return stat.getNewInstance(uuid);
    }

    @Override
    public Translatable getDisplayName() {
        return displayName;
    }

    @Override
    public Translatable getText() {
        return text;
    }

    @Override
    public StatFormatter getStatFormatter() {
        return statFormatter;
    }

    @Override
    public String formatLong(double val, Locale locale) {
        return Lang.string(text, locale, statFormatter.format(val));
    }

    @Override
    public String formatShort(double val) {
        return statFormatter.format(val);
    }

    // workaround for not having access to the user handler
    @Override
    public User getUser(UUID id) {
        return stat.getUser(id);
    }

    @Override
    public Trackable[] getValues() {
        return values();
    }

    @Override
    public boolean shouldAnnounce() {
        return announce;
    }

    @Override
    public void setAnnounce(boolean announce) {
        this.announce = announce;
    }

    @Override
    public String getPrefix() {
        return "ONEVSONE";
    }
}
```

Most of the stuff you can just copy paste (blame java for not having enum inheritance), you want to change the prefix (last line) tho.   
This will be used as an identifier of your addon for stats, limilar how minecraft keys work for items in minecraft. if you have a stats type with the prefix ONEPLUSONE and an enum constant named KILLS, you can use the stat type in commands using ONEPLUSONE:KILLS.  
The other thing you will want to change are obvisouly the enum constants. They need i18n names, a boolean stating if changes should be announced to the player, and optionally a formatter.  
Check the `StatsFormatter` class to take a look at default formatters or implement your own one. You can fine the class [here](https://github.com/VoxelGamesLib/VoxelGamesLibv2/blob/master/VoxelGamesLib/src/main/java/com/voxelgameslib/voxelgameslib/stats/StatFormatter.java).

# Registering external trackables (aka stat types)

Now you need to register that class. To do that, @Inject a StatHandler class into your module and in your enable method, register it with some random enum instance: 
```java
statsHandler.registerTrackable(OneVsOneStats.KILLS);
```

# Using the stats api

Using the stats api is easy:
```java
OneVsOneStats.GAMES.getInstance(user).increment(); // increment ONEPLUSONE:GAMES by 1
OneVsOneStats.GAMES.getInstance(user).increment(2); // increment ONEPLUSONE:GAMES by 2

OneVsOneStats.GAMES.getInstance(user).decrement(); // decrement ONEPLUSONE:GAMES by 1
OneVsOneStats.GAMES.getInstance(user).decrement(2); // decrement ONEPLUSONE:GAMES by 2

OneVsOneStats.GAMES.getInstance(user).getVal(); // return the val of ONEPLUSONE:GAMES
OneVsOneStats.GAMES.getInstance(user).setVal(42); // set ONEPLUSONE:GAMES to 42
```
Be sure to also check out the [javadocs for statsinstance](https://voxelgameslib.github.io/VoxelGamesLibv2/VGL/javadoc/com/voxelgameslib/voxelgameslib/stats/StatInstance.html).
