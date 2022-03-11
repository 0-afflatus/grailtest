Doors Redux Mod v1.0
By Leslie E. Krause

Doors Redux is a total rewrite of the Doors mod from Minetest Game. It builds upon the 
work of sofar, PilzAdam, and BlockMen to provide greater functionality in addition to an 
expanded selection of doors from my own Extra Doors mod..

Some of the notable features include:

 - Distinctive sound fx when attempting to open a locked door
 - Multiple locking modes for all doors: unlocked, locked, and shared
 - Multiple closing modes for all doors: auto-close, hold-open, and manual
 - Support for node-center and node-offset door positions
 - Wrench tool cycles between door locking and closing modes
 - Screwdriver tool alternates door position and direction
 - Fully backwards-compatible API with additional functions

Moreover, a set of 18 new doors are readily available! They encompass a wide variety of 
different building styles, so players are no longer restricted to the four basic steel, 
wood, glass, and obsidian glass doors that come shipped with Minetest Game.

 - Mansion Doors (exterior and interior)
 - Prison & Vault Doors (exterior and interior)
 - Barn & Shed Doors (exterior and interior)
 - Castle Doors (exterior and interior)
 - Cottage Doors (exterior and interior)
 - Specialty Doors: Japanese and French
 - Wooden Doors: Colonial, Atherton Double-Lite, Cambridge Single-Lite
 - Steel Doors: Colonial, Atherton Double-Lite, Cambridge Single-Lite

I truly believe that doors are one of the most essential but often overlooked elements of 
good architectural design. They set the tone and character of both a living and working 
space. Have the wrong style of door can make or break the underlying visual aesthetic of 
any building, which is why I accounted for several possible uses.

Incidentally, Doors Redux began as experiment to incororate centered doors into Minetest 
Game because they look so much more visually appealing than the traditional offset doors. 
However, the project turned out to be far more complicated than planned, given the need 
to maintain compatibility with existing worlds. So I ended up rewriting the Doors mod
with a specialized translataion matrix, including B3D models adapted from TumeniNode's
excellent C Doors mod (which I would've used, but it didn't have a translation matrix).

Thankfully, the end result was well worth the effort, since I was able to simplify and 
consolidate all of the logic, and expand the overall feature-set too :)

First and foremost is support for the already familiar screwdriver. With this tool you 
can reposition almost any door depending on the mode of operation. Left-clicking switches
the hand between left vs. right. Whereas right-clicking switches the position between
center vs. offset. It's really that easy!

The wrench is another powerful tool in your arsenal for manipulating doors and trapdoors. 
It can be crafted from just one steel ingot and one steel rod. Like the screwdriver from 
Minetest Game, the wrench has two modes of operation (with the caveat that any existing 
doors placed by the original Doors mod must be replaced to use this tool).

To adjust the closing mode, right-click the door or trapdoor with a wrench. The changes 
will be indicated in chat as follows:

 - Normal (door will remain open or closed as per usual operation)
 - Auto-Close (door will close automatically when opened)
 - Hold-Open (door will be non-closable when opened)

Auto-closing doors are ideally suited for high-traffic commercial buildings like shopping 
centers, where doors must not be left open unattended. The closing mechanism activates 
after a preset time period, defined by 'config.autoclose_timeout' in seconds.

Hold-open doors are ideal for when you want to allow for uninterupted passage through a 
doorway, without having to remove the door entirely. Fire doors in schools are a typical
example of doors that are intended to remain open, except during emergencies.

To adjust the locking mode, left-click the door or trapdoor with a wrench. The changes 
will be indicated in chat as follows:

 - Unlocked (door may be opened and closed by any player)
 - Locked (door may only be opened and closed by the owner)
 - Shared (door may only be opened and closed by members of the protection area)

When placing a door, it will be unlocked. The exception is protected doors, such as most 
metal doors, which are locked by default.

It is important to note the distinction between protected doors and shared locking mode.

 - Protected doors are owned nodes, and therefore can only be removed and manipulated by 
   the player that originally placed the door, regardless of the locking-mode. All 
   varieties of metal doors are protected doors. This is consistent with the terminology 
   used in the official Minetest Game.

 - Shared locking mode, in contrast, emulates the behavior of the "protected doors" in 
   TenPlus1's Protector Redo Mod. Opening and closing of such doors is contingent on 
   membership in the area of protection. Unfortunately, Protector Redo uses the term 
   "protected doors", which is a misnomer.

Below are some helpful notes regarding functionality that may be somewhat unique the 
Doors Redux mod:

 - Locking a non-protected door (like an obsidian glass door) will also lock out the 
   player that placed the door until the locking mode is changed.

 - Players that have the 'protection_bypass' privilege, can open, close, and otherwise 
   manipulate any door regardless of ownership or locking-mode.

 - TNT explosions will have no effect on protected doors. However, normal doors will be 
   added to the list of drops, unless they are in a protected area.

 - Use of the wrench and screwdriver is restricted to the owner of the door (in the case 
   of protected doors) or, otherwise, members of the protected area.

 - The owner of a protected door can always dig the door that they placed, even when it 
   is in a protected area that is controlled by another player.

Custom door definitions may be added to the init.lua file, or alternately you may use
the Doors Redux API in your own mods. The following function is available for registering
new doors:

   doors.register_door( name, def )
   Registers a door withe the given name and definition table.

Several fields of the definition table are required, but most are optional

 * def.tiles - the list of textures to apply to the model
 * def.description - the description to show in the craft guide and itemstack tooltips
 * def.inventory_image - the texture for the inventory item
 * def.groups - the group levels of the node ('door = 1' will be added automatically)
 * def.is_lockable - whether the locking mode is adjustable (default is false)
 * def.is_closable - whether the closing mode is adjustable (default is false)
 * def.sound_open - sound effect when opening
 * def.sound_close - sound effect when closing
 * def.sound_locked - sound effect when locked
 * def.can_center - whether center positioning (default is false)

For programmatically examining and manipulating doors, two API functions are provided:

  doors.get_door( pos )
  Returns an object for working with a door at the given position.

The door object, returned by the function above, provides the following methods:

  door_obj.get_properties( )
  Returns a table with four fields describing the various properties of the door:

   * is_open - true for opened or false for closed, as determined by the state
   * type - either "center" or "offset", as determined by the state 
   * hand - either "left" or "right", as determined by the state
   * face - ranges from 1 to 4, corresponding with the value of param2

  door_obj.open( )
  Opens the door, unless it is already in an opened state. This will circumvent any
  ownership checks.

  door_obj.close( )
  Closes the door, unless it is already in a closed state. This will circumvent any
  ownership checks.

A similar function, doors.get_trapdoor( ), allows for working with trapdoors. The object
returned provides the same methods as those above.


Repository
----------------------

Browse source code...
  https://bitbucket.org/sorcerykid/doors

Download archive...
  https://bitbucket.org/sorcerykid/doors/get/master.zip
  https://bitbucket.org/sorcerykid/doors/get/master.tar.gz

Compatability
----------------------

Minetest 0.4.15+ required

Installation
----------------------

  1) Backup the original "doors" mod to a safe location.
  2) Unzip the archive into the mods directory of your game.
  3) Rename the doors-master directory to "doors".

Source code license
----------------------------------------------------------

GNU Lesser General Public License v3 (LGPL-3.0)

Copyright (c) 2018-2020, Leslie E. Krause (leslie@searstower.org)

This program is free software; you can redistribute it and/or modify it under the terms of
the GNU Lesser General Public License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

http://www.gnu.org/licenses/lgpl-2.1.html


Multimedia License (textures, sounds, and models)
----------------------------------------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)

   /models/door_a.obj
   by sofar

   /models/door_b.obj
   by sofar

   /models/fencegate_open.obj
   by sofar

   /models/fencegate_closed.obj
   by sofar

   /textures/default_steel_rod.png
   by sorcerykid

   /textures/doors_door_barn1.png
   by sorcerykid

   /textures/doors_door_barn2.png
   by sorcerykid

   /textures/doors_door_castle1.png
   by sorcerykid

   /textures/doors_door_castle2.png
   by sorcerykid

   /textures/doors_door_cottage1.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_door_cottage2.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_door_dungeon1.png
   by sorcerykid

   /textures/doors_door_dungeon2.png
   by sorcerykid

   /textures/doors_door_french.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_door_japanese.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_door_mansion1.png
   by sorcerykid

   /textures/doors_door_mansion2.png
   by sorcerykid

   /textures/doors_door_steelglass1.png
   by sorcerykid

   /textures/doors_door_steelglass2.png
   by sorcerykid

   /textures/doors_door_steelpanel1.png
   by sorcerykid

   /textures/doors_door_steel.png
   by PilzAdam

   /textures/doors_door_woodglass1.png
   by sorcerykid

   /textures/doors_door_woodglass2.png
   by sorcerykid

   /textures/doors_door_woodpanel1.png
   by sorcerykid

   /textures/doors_door_wood.png
   by Fernando Zapata

   /textures/doors_item_barn1.png
   by sorcerykid

   /textures/doors_item_barn2.png
   by sorcerykid

   /textures/doors_item_castle1.png
   by sorcerykid

   /textures/doors_item_castle2.png
   by sorcerykid

   /textures/doors_item_cottage1.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_item_cottage2.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_item_dungeon1.png
   by sorcerykid

   /textures/doors_item_dungeon2.png
   by sorcerykid

   /textures/doors_item_french.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_item_glass.png
   by Krock & paramat
   inspired by VanessaE

   /textures/doors_item_japanese.png
   by kilbith (relicensed WTFPL)
   modified by sorcerykid

   /textures/doors_item_mansion1.png
   by sorcerykid

   /textures/doors_item_mansion2.png
   by sorcerykid

   /textures/doors_item_obsidian_glass.png
   /textures/doors_item_steelglass1.png
   by sorcerykid

   /textures/doors_item_steelglass2.png
   by sorcerykid

   /textures/doors_item_steelpanel1.png
   by sorcerykid

   /textures/doors_item_steel.png
   by PilzAdam

   /textures/doors_item_woodglass1.png
   by sorcerykid

   /textures/doors_item_woodglass2.png
   by sorcerykid

   /textures/doors_item_woodpanel1.png
   by sorcerykid

   /textures/doors_item_wood.png
   by Fernando Zapata

   /textures/doors_trapdoor.png
   by BlockMen

   /textures/doors_trapdoor_side.png
   by paramat

   /textures/doors_trapdoor_steel.png
   by sofar

   /textures/doors_trapdoor_steel_side.png
   by paramat

   /textures/doors_door_glass.png
   by Krock & paramat
   inspired by VanessaE

   /textures/doors_door_obsidian_glass.png
   by red-001
   inspired by PilzAdam & BlockMen

   /textures/doors_wrench.png
   obtained from https://github.com/Rogier-5/minetest-mod-rotate
   by Rogier

   /sounds/doors_door_close.ogg
   by bennstir

   /sounds/doors_door_open.ogg
   by CGEffex
   modified by BlockMen

   /sounds/doors_door_locked.ogg
   obtained from https://freesound.org/people/BenjaminNelan/sounds/321087/
   by BenjaminNelan (relicensed CC0)
   modified by sorceryid

   /sounds/doors_fencegate_close.ogg
   obtained from http://www.freesound.org/people/BarkersPinhead/sounds/274807/
   by BarkersPinhead
   obtained from http://www.freesound.org/people/rivernile7/sounds/249573/
   by rivernile7

   /sounds/doors_fencegate_open.ogg
   obtained from http://www.freesound.org/people/mhtaylor67/sounds/126041/
   by mhtaylor67 (relicensed CC0)

   /sounds/doors_glass_door_close.ogg
   obtained from https://www.freesound.org/people/SkeetMasterFunk69/sounds/235546/
   by SkeetMasterFunk69 (relicensed CC0)

   /sounds/doors_glass_door_open.ogg
   obtained from https://www.freesound.org/people/SkeetMasterFunk69/sounds/235546/
   by SkeetMasterFunk69 (relicensed CC0)

   /sounds/doors_steel_door_close.ogg
   by HazMatt

   /sounds/doors_steel_door_open.ogg
   by HazMatt

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/3.0/


Multimedia License (textures, sounds, and models)
----------------------------------------------------------

Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

   /models/door_c.obj
   by TumeniNodes

   /models/door_d.obj
   by TumeniNodes

   /models/door_e.obj
   by TumeniNodes

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

ShareAlike — If you remix, transform, or build upon the material, you must distribute
your contributions under the same license as the original.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/4.0/
