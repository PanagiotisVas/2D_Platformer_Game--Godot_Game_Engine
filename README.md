# 2D Platformer Game (Godot Engine)

This document summarizes the steps and functionalities implemented for the creation of a small 2D game using the Godot Engine.

## 🎮 Exercise 1: Creating a Small 2D Game

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

---

## 🚀 Exercise 2: Extensions

In addition to the core requirements above, the project was expanded with the following polish:

* **Advanced Player Animation:** A fourth animation state was added to the character controller. The player now features a distinct sprite for **Falling**, separate from the **Jumping** (ascending) animation, providing smoother visual feedback.