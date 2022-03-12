Minetest mod "Stamina"
=====================

(C) 2015 - BlockMen
(C) 2016 - Auke Kok <sofar@foo-projects.org>


About this mod:
---------------
This mod adds a stamina, or "hunger" mechanic to Minetest. Actions like
crafting, walking, digging or fighting make the player exhausted. When
enough exhaustion has been accumulated, the player gets more hungry,
and loses stamina.

If a player is low on stamina, they start taking periodical damage,
and ultimately will die if they do not eat food.

Eating food no longer heals the player. Instead, it increases the
stamina of the player. The stamina bar shows how well fed the player
is. More bread pieces means more stamina.

Walking while holding down Aux1 (usually E key) will make player sprint so
long as their stamina bar is 3 or more bread.  This will make the player run
that bit faster and jump a tiny bit higher.

Q&A time: Why won't I move the stamina bar to the right?

Answer: this conflicts with the builtin breath bar. To move the
builtin breath bar, I basically have to entirely re-implement it
in lua including timers to catch breath changes for each online
player, which is all a waste of time, just to move a few pixels
around.


For Modders:
------------
This mod intercepts minetest.item_eat(), and applies the hp_change
as stamina change. The value can be positive (increase stamina) or
negative (periodically damage the player by 1 hp).

Callbacks that are registered via minetest.register_on_item_eat()
are called after this mod, so the itemstack will have changed already
when callbacks are called. You can get the original itemstack as 6th
parameter of your function then.

A global function is available for mods to change player stamina levels:

   stamina.change(player, change)


TenPlus1 Additions:
-------------------

 - Added support for POVA and player_monoids
 - Added Pipeworks checks for fake players
 - Added 60 second drunk effect when foods have {alcohol=1} group (eat 4 or more)
 - Moved exhaustion and hud_id to player table instead of player attributes


License:
--------
Code:
- all code LGPL-2.1+
Textures:
- stamina_hud_poison.png - BlockMen (CC-BY 3.0)
- stamina_hud_fg.png - PilzAdam (WTFPL), modified by BlockMen
- stamina_hud_bg.png - PilzAdam (WTFPL), modified by BlockMen
Sounds:
- stamina_eat.*.ogg - http://www.freesound.org/people/sonictechtonic/sounds/242215/ CC-BY-3.0

stamina_burp.ogg - https://www.freesfx.co.uk/sfx/burp (small burp)
stamina_sip.ogg - https://elements.envato.com/sip-16081-C7V5YLG
