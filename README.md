# Development Doc

The general development process involved first planning and then to start working on each goal one at a time. At some points, I had to just start testing on a feature if it was too volatile. If something was working mostly functional, I would move onto the next. Each step required researching and deciding a more efficient way that would allow me to learn about the tools. I would end up using LDtk to test and have an idea on how to design my world maps. There were a lot of inbuilt tools that would allow me to test and plan before fully implementing. To ensure I would not have any issues on Git and my main file, I would end up making copies of my game and testing possibly more volatile features. 
## Design Decisions
- From my research and also testing with saving and loading, Godot has a more straightforward way of allowing user saves. This is done from storing the data in user cache in a web game from “user://”. The idea to just use Godot’s inbuilt save system over database plugins and APIs like SilentWolf and Firebase, was mainly because it is not a multiplayer game and is not meant to be a complex game.
- SilentWolf has also been improved more for Godot 4 and from my testing, has limitations for storing data.
- The decision to use a resource system and selection inventory bar was because there were not a lot of items I had planned to use in the game. The resource and inventory bar were sufficient and straightforward rather than having a buggy inventory system.
For the progression system, it is fine for it to be more linear as through researching and my own experience with games, gameplay loops are better suited to be more simple. The required amount to level up should not significantly increase per level, as it makes progression feel massively slower. 
## Major Challenges
- One of the main challenges I have while developing the game is the huge differences between Godot 3 and Godot 4, which I will talk about more. Most tutorials/videos are primarily about Godot 4 as it is more recent and has priority in search algorithms. The general consensus is that Godot 4 is much more user friendly in comparison to Godot 3, even though Godot in general has a learning curve in its different tools. 
- One big difference between the two versions is the Tilemap and automap systems. Godot 4 has just massively improved Tilemaps to the point where it is easier to understand them. Meanwhile, it takes a significant amount more time to understand.
- There were several bugs in total I had to fix. Most of these were based on some possible performance issues. _process(delta) is a volatile function, since it runs every single possible frame. With my game not being as large scale, it would not be as impactful, but was not impossible. Some issues I had were working with both the tree with detecting hits and the chicken. The tree would constantly duplicate itself, which would cause performance issues if left too long. The chicken was not properly following the player.

## Solutions:
- The solution was generally to just use the old documentation with Godot 3 and manually change/figure out how the tools were used in the Godot 3. This did help me indirectly learn more about both versions and how one thing was used over the other. If I found some interesting ideas from a YouTube video, I would try to learn what the creator is doing and would learn more from slowly converting their code from Godot 4 to 3.

- I was able to learn tilemaps and use it in a more inefficient, but viable way to design my maps and sprites. 

- For the tree, I had to check for animation ending with the hitbox and also needed  to create an instance of a timer node/object. Using an attached timer caused issues for some reason, but creating a simple instance would work. For the chicken, I had to check for global variables of my character position to properly follow and had to fix the collision check. I ended up using a lot of global variables, which is not very optimized, but allows for simple and straightforward solutions. My game does not have any very complex algorithms, just focusing on being functional as a game beta/prototype.  


## Prototype Demo
First Prototype version of a farming type game, still in development.

## Controls
Currently, you can use WASD or arrow keys to move character. You can use the scroll whell to select which seed you want to plant. To plant, you can press left click on the tilled dirt for it to grow. Once it reaches the stage, it can be harvested by going to the plant itself.

# Some tools and resources used:
- LDtk for designing levels
- Godot documentation
- itch.io for inspiration and assets

# Assets Used: 
[Free Inventory by ElvGames](https://elvgames.itch.io/free-inventory-for-rpg-or-farming-games)

[Sprout Lands UI Pack by Cup Nooble](https://cupnooble.itch.io/sprout-lands-ui-pack)

[Sprout Lands Asset Pack by Cup Nooble](https://cupnooble.itch.io/sprout-lands-asset-pack)

[Demo RPG Asset Pack by Notokapixel](https://narehop.itch.io/tileset-topdown-demo)
