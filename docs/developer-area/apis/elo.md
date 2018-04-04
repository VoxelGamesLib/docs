# Elo

VGL uses an implementation of the TrueSkill algorithm to calculate a Elo score for players, based on their wins and looses and the scores of their opponents.  
The framework does this automatically. If you use the TeamFeature, VGL will make sure that everybody on the winning team sees an increase in their rating, while the other teams looses points.  
For normal or duel based games, VGL will do the same: The winner will see an increase while the rest will some Elo.  

If you want to learn more about how exactly the algorithm works, I suggest you to read this excellent blog post, which helped me understand the topic: http://www.moserware.com/2010/03/computing-your-skill.html
I will not explain it in full detail here, but give a slight overview:  
Basically, the higher the difference between your skill/rating/elo and the skill/rating/elo of your openent(s), the more elo the lower rated player can gain and the higher player can loose. if you win against a higher skilled player, you will see an higher increase in elo than winning against a lower skilled player. Additionally, trueskill also has a sort of stability factor, to work against fast changes. At the beginning, you will see fast changes in your rating, but the more games you play, the more will your elo stabilize in some area. 

## The api

You can get access to the rating of a User via User#getRating(GameMode). The value you will most likely be interrested in is the mean, this is what we would call the elo score. 
Thats really all you need, since VGL handles everything for you.
