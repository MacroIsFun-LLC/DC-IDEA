# Dransik ClassiK Editor Release Notes

## [v0.0.0.7] - The "Polished & Premium" Update (Latest)
This update focuses on refined usability, aesthetic perfection, and a professional startup experience.

### Key Enhancements
- **Comprehensive Spacing Audit**: Balanced and optimized the layouts of all 38 GUI modules. Controls no longer overlap, and labels have proper padding for a clean, non-squished look on all DPI scales.
- **Premium Loading Sequence**: Replaced the static splash screen with a dynamic, high-quality progress bar that provides real-time feedback during initialization.
- **Dual-Mode Diagnostics**: Integrated console logging that mirrors the loading bar progress, allowing developers to track startup milestones via SciTE or CLI.
- **Improved About Dialog**:
    -   Implemented a custom viewport to display the specific quadrant 1 of `AboutGUI.png`.
    -   Added a clear "Fan Product" disclaimer at the bottom of the dialog.
- **Stability Fixes**: Resolved silent hanging issues by correcting several legacy `WEnD` syntax typos in sub-GUI modules.

### Components Finalized
- All 38 modular sub-GUIs (Armor, NPC, Shape, Map, Spell, etc.) have been audited and passed for production layout standards.
- Main application hub is fully integrated with a robust message loop and auto-incrementing build system.

---

## [v0.0.0.6] - The "Modernization" Milestone
This pre-release represents the **complete UI modernization and modularization** of the Dransik ClassiK Editor suite.

- **Modular Hub**: A centralized main application (`Dransik ClassiK Editor.au3`) that manages a comprehensive menu system and dispatches events to 38 decoupled GUI modules.
- **100% UI Coverage**: Every original GUI definition reconstructed as a standalone `.au3` module with full feature parity.
- **Modern Windows Support**: Integrated High-DPI awareness for crisp rendering on Windows 10 and 11.
- **Enhanced Navigation**: Full menu structure derived directly from original resource scripts.

### Next Steps
The UI is now 100% complete and polished. The next development phase will focus on deep-level data integration and populating the placeholder functions with real game-world logic.

---
**Warranty Note**: This software is provided under the "Taillight License." It's guaranteed to work until you can't see the developer's taillights no more. Use at your own risk!
