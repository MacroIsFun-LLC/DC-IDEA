# Dransik ClassiK Editor (Modernized & Modularized)

A modernized, AutoIt-based editor for **Dransik ClassiK** game assets. This project refactors the original monolithic editor architecture into a highly maintainable, modular system.

## Project Architecture

The application is structured around a central hub that dispatches editor functions to individual GUI modules:

- **Main Hub**: `Dransik ClassiK Editor.au3`
  - Manages the main application window, menu system, and status bar.
  - Serves as the entry point for all sub-editors.
  - Handles global application state and the primary message loop.

- **GUI Modules**: Over 30 specialized `*_GUI.au3` files.
  - Each module corresponds to a legacy GUI definition (`.txt` resource script).
  - Standalone, modular implementations for NPC, Map, Armor, Shop, Encounter, Treasure, and Spell management.
  - Layouts are derived from the original C++ editor resource definitions to ensure full feature parity.

## Core Components

- **Map Editor**: High-level workspace for world building.
- **NPC Editor**: Comprehensive attribute and alignment management for game actors.
- **Armor & Weapon Data**: Specialized dialogs for item stats and requirement validation.
- **Shop & Inventory**: Modular merchant management and inventory tracking.
- **Encounters & Treasures**: Deep-level logic for world spawning and loot tables.
- **Usecode Editor**: Integrated hooks for script management and compilation.

## Getting Started

1. Ensure you have [AutoIt3](https://www.autoitscript.com/site/autoit/) installed.
2. Run **`Dransik ClassiK Editor.au3`** to launch the main application.
3. Access specific editors via the **Edit** and **Game Data** menus.
