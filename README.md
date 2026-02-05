# 2D Platformer Game (Godot Engine)

![Status](https://img.shields.io/badge/Status-Completed-success)
![University](https://img.shields.io/badge/Context-University%20Project-blue)
![Tech](https://img.shields.io/badge/Tech-GDScript%20%7C%20Spark%20%7C%20Godot%20%Game%20%Engine-orange)

**University of Patras - CEID**
**Course:** Game Development
**Student:** Vasilopoulos Panagiotis (ID: 1097453)

## 🎮 Creating a Small 2D Game
This document summarizes the steps and functionalities implemented for the creation of a small 2D game using the Godot Engine.

### 1. Level Design
* Created a `Main.tscn` scene which includes a **TileMap**.
* Utilized tiles from pre-made asset packs.
* **Physics Collision Shapes** were defined in the TileSet Editor exclusively for the tiles used in the level.
* *Note: The level design was intended to include gaps (cliffs), but this feature was not implemented in time.*

### 2. Player Character
* Implemented as a `CharacterBody2D`.
* Added an `AnimatedSprite2D` containing distinct animations for the following states:
    * `idle`
    * `run`
    * `jump`
* Added a `CollisionShape2D` adjusted to fit the character's body.
* Developed a movement script handling:
    * Horizontal movement.
    * Jumping.
    * Gravity application.
    * Animation state switching based on player action.

### 3. Collectibles (Coins)
* Created a separate scene `Collectible.tscn` using an `Area2D`.
* The coin uses an `AnimatedSprite2D` for visual effects.
* Collision detection is handled via the `body_entered` signal (filtered to detect only the player).
* **On contact:**
    * The coin disappears (`queue_free()`).
    * The score counter increases.
* Collectibles are part of a **Group** to facilitate signal connection.
* The score is displayed on the screen using a `CanvasLayer` and a `Label`.

### 4. Enemy (Slime)
* Implemented as a `CharacterBody2D`.
* **Components:**
    * `AnimatedSprite2D` for movement animation.
    * `CollisionShape2D` for interaction with the ground.
    * **RayCast2D sensors:**
        * `wall_check`: To detect walls.
        * `edge_check`: To detect the edge of platforms.
* **AI Behavior:**
    * The enemy patrols automatically (left-right).
    * Direction flips when a wall is hit or a platform edge is reached.
* Added a `player_kill_zone` (`Area2D`) to detect the player.
* **Collision Logic:** If the player touches the enemy, the scene reloads (Game Over).

### 5. Death Zones (Cliffs)
* *Status: Not yet implemented.*

### 6. Collision & Physics Logic
* Utilized **Collision Layers and Masks** to ensure:
    * Both Player and Enemy interact with the Ground.
    * The Player does *not* physically collide with the Enemy's body (preventing pushing).
    * Damage is strictly handled via `Area2D` signals.

### 7. Controls
Input actions were defined using the Godot Input Map.

| Action | Key |
| :--- | :--- |
| Move Left | **A** |
| Move Right | **D** |
| Jump | **Space** |


## 🚀 Extensions

In addition to the core requirements above, the project was expanded with the following polish:

* **Advanced Player Animation:** A fourth animation state was added to the character controller. The player now features a distinct sprite for **Falling**, separate from the **Jumping** (ascending) animation, providing smoother visual feedback.

---

### 🎵 Audio Assets Setup
Due to GitHub file size limits, the high-quality audio files are hosted externally.

1. **Download** the music assets from this link: [https://drive.google.com/uc?export=download&id=1EfOm-iECbhXDjUdZjLrLSWY-0tkQq2R8]
2. **Extract** the contents of the zip file.
3. **Place** the extracted folder into the root folder of the project. Make sure the name of the folder is `audio`

*Note: The game will run without these files, but will have no audio.*
