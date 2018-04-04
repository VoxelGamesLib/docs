# Sign API

There are two ways VGL allows you to work with signs: Sign Buttons or Sign Placeholders

## Sign Buttons

Signs buttons are signs with special '[keys]' which execute some code when being clicked by players.  
To define a button, you need to get the instance of the SignButtons class. To do this you can just @Inject it via guice.  
That class offers you a method registerButton which takes a key and a lambda:
```java
signButtons.registerButton("hello", (user, block) -> user.sendMessage(TextComponent.of("WOW")));
```

## Sign Placeholders

Sign Placeholders allow you to dynamically change text on a sign and show individual text for players.  
There are two types of placeholders, simple, that only replace the key, and full, which replace the whole sign.  
To register placeholders, you need to get the instance of the SignPlaceholders class. To do this you can just @Inject it via guice. 
That class offers you a method registerPlaceholder which takes a key and a lmabda:
```java
       registerPlaceholder("time", (SimpleSignPlaceHolder)
            (user, location, rawLines, lines, key) ->
                TextComponent.of(DateTimeFormatter.ISO_TIME.format(LocalTime.now())));
                
       registerPlaceholder("greeting", (FullSignPlaceHolder)
            (user, loc, rawLines, lines, key) -> new Component[]{
                TextComponent.of("Hey there"),
                user.getDisplayName(),
                TextComponent.of(""),
                TextComponent.of("")
            });
            
       registerPlaceholder("name", (SimpleSignPlaceHolder)
            (user, loc, rawLines, lines, key) -> 
                user.getDisplayName());
```

An example sign for time could look like this:
"Hello [name]."  
"The time is"  
"[time]"  
which would be replaced to:
"Hello MiniDigger"  
"The time is"  
"16:11:25.154"  

Signs update every second or when clicked by a player (with a 1 second cooldown).
