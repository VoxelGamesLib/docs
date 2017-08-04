# How to use the i18n API

VGL was made with i18n in mine. Every user facing message is configurable. Your games should do that too.  
To do that, VGL internally uses a nice api and provides ways where you can inject your own keys to be translated.

## The lang key class

First you will need a lang key class. VGL has a class named LangKey for internal usage, your class will look similar to it.
Use this as a template:
```java
public enum MyLangKey implements ExternalTranslatable {

    DUMMY("dummy"),// we will need this once later

    SOME_MSG("{aqua}This is a {yellow}{adjective}{aqua} API", "adjective");

    @Nonnull
    private final String defaultValue;

    @Nonnull
    private final String[] args;

    private static UUID uuid = UUID.randomUUID();

    HubLangKey(@Nonnull String defaultValue, @Nonnull String... args) {
        this.defaultValue = defaultValue;
        this.args = args;
    }
    
    @Override
    @Nonnull
    public String getDefaultValue() {
        return defaultValue;
    }

    @Override
    @Nonnull
    public String[] getArgs() {
        return args;
    }

    @Override
    public UUID getUuid() {
        return uuid;
    }

    @Override
    public Translatable[] getValues() {
        return values();
    }
}
```
As you can see, its an enum in which you define keys, default values and the args the keys use. To lern more
about how the lang format works, check out the guide here //TODO add link to guide

## Registering the new lang key class

VGL will need to know about the new keys and we need files where your users can change the messages. LangHandler takes 
care of all that. Just @Inject a LangHander into your plugin class and call this in your enable method:
```java
 langHandler.registerExternalLangProvider(MyLangKey.DUMMY, new File(getDataFolder(), "lang"));
```
This will create a folder with some lang files for the default values.

## Using the i18n api to translate messages

There are many ways you can send a message using the api. You can to take a look at the Lang class for all options.
Most of the time you want to use Lang#msg like this:
```java
Lang.msg(user,MyLangKey.SOME_MSG,"cool");
```
That will send `This is a cool API` to the player, translated into his default lang.  
The order of the arguments is the same as the order you specified in the enum. 