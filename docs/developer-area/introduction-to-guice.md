# Introduction to guice

VGL heavily uses guice. This short page aims to give you a small overview of what you can do with guice.
For more details we suggest you to read googles excelent wiki https://github.com/google/guice/wiki

## Basic injections

Guice is an dependency injection framework. That means, you can get a reference to any class handled by guice
via a simple `@Inject` annotation on a field.  
For example, you might want to start a bukkit scheduler in your OneVsOne game.
All you have to do is this:
```java
// some field
@Inject
private OneVsOnePlugin plugin;

// some method
Bukkit.getScheduler().runTask(plugin, task);
```
Guice will take care of getting the right instance of OneVsOnePlugin.  

To make this all work, you have to add an annotation to the classes you only ever want one instance of.  
For example, you never want more then 1 instance of your plugin class, since else bukkit would complain.  
To tell guice that, you need to add a `@Singleton` annotation to the class. 

Generally you can inject almost every class. Want to do something with users? `@Inject UserHandler userHandler;`.
Need to get the games of a player? `@Inject GameHandler gameHandler`. 

## Named injections

Guice also has the option to have multiple instances of the same type. To specify which instance you want, you use the
`@Named("name")` annotation.  
VGL defined a set of named annotations, you can see them here:  
https://github.com/VoxelGamesLib/VoxelGamesLibv2/blob/master/src/main/java/me/minidigger/voxelgameslib/VoxelGamesLibModule.java#L58-L72  
For example, the `KitHandler` gets a reference to the kits folder like this:
```java
    @Inject
    @Named("KitsFolder")
    private File kitsDir;
```

## Inject Gson

VGL also setup guice to provide two guice instances. Those are equiped with the custom type adapters for stuff like phases for features.  
There is the normal `@Inject Gson gson` which will be injected with a json instance that has pretty prinitng and excludes every field that isn't 
marked with `@Exposed`. The other one will include all fields, you can get it with 
```java
@Inject
@Named("IgnoreExposedBS")
private Gson gson;
```
This instance has pretty prining enabled too. Need one without pretty printing? let us know!

## Custom guice settings

this is currently not implemented. If you need this, be sure to bump https://github.com/VoxelGamesLib/VoxelGamesLibv2/issues/71 to let us know!