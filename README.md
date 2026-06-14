# Weeping Souls

**Weeping Souls** is a creature-battle RPG prototype built in **Godot** as a team learning project at the University of St. Thomas. It grew out of an earlier solo **Python/pygame** attempt called [**Something Will Work**](https://github.com/JarvinChavez/something-will-work).

Explore an overworld, talk to NPCs, and fight using typed moves, items, and custom battle UI — all wired in GDScript with Godot scenes and resources.

> **Status:** Prototype · not completed · preserved as a learning milestone

---

## Project lineage

| Stage | Repo | Stack | Notes |
|-------|------|-------|-------|
| 1 · Solo prototype | [**something-will-work**](https://github.com/JarvinChavez/something-will-work) | Python · pygame | Menus + overworld stub + stat experiments |
| 2 · Team rebuild | **Weeping Souls** (this repo) | Godot · GDScript | Battles, dialogue, moves, NPCs, assets |

If you want to see where the idea started, start with Something Will Work. This repo is the Godot evolution.

---

## What's in the project

Open the Godot project at **`WeepingSouls/project.godot`**.

| Area | Contents |
|------|----------|
| `Battle System/` | Turn-based battle scenes, opponent logic, battle UI |
| `BattleSystem_Scripts/` | Move stats, battle flow scripts |
| `Info/` | Moves, items, NPC stats, player data, soul remnants |
| `Info/Npcs/` | Dialogue system + JSON dialogue files |
| `scenes/` | Menus, areas, characters |
| `assets/` | Sprites and backgrounds |
| `player/` | Player movement / interaction |

**Implemented (partial):** main menu, battle encounters, move resources, NPC dialogue boxes, item resources, GUI work.

**Not finished:** full game loop, balancing, polish, content completion.

---

## Run locally

1. Install **[Godot 3.x](https://godotengine.org/download)** (project uses Godot 3 scene format).
2. Open Godot → **Import** → select `WeepingSouls/project.godot`.
3. Press **F5** (Play). Main scene: `scenes/Menu.tscn`.

No separate build step required for local testing.

---

## Stack

Godot 3 · GDScript · JSON (dialogue)

---

## Team

Team Godot project · **Jarvin Chavez** contributed battle systems, scripting, and UI work.

Related solo prototype: [**Something Will Work**](https://github.com/JarvinChavez/something-will-work)

---

## Author

**Jarvin Chavez** · [GitHub](https://github.com/JarvinChavez)
