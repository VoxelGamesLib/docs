# Command API

VGL does not longer uses a custom command api, it uses [ACF by aikar](https://github.com/aikar/commands/)

Features can provide commands by implementing `FeatureCommandImplementor` (I hate that name as much as you do) 
and defining them in an inner class that extends `AbstractFeatureCommand`:

```java
    public class VoteFeature extends AbstractFeature implements FeatureCommandImplementor{
    
    .....
    
    @Override
    public AbstractFeatureCommand getCommandClass() {
        return new VoteFeatureCommand();
    }

    @Singleton
    class VoteFeatureCommand extends AbstractFeatureCommand {

        @CommandAlias("vote")
        @CommandPermission("%user")
        @Syntax("[map] - the map to vote for")
        public void vote(User sender, @Optional Integer map) {
            if (map == null) {
                sendVoteMessage(sender);
            } else {
                confirmVote(sender, map);
            }
        }
    }
}
```

Other classes can register commands by injecting a `BukkitCommandManager` via and registering the command using that.

For a general documentation on how to write command with ACF, please see the [ACF wiki](https://github.com/aikar/commands/wiki)