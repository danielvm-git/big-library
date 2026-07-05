# DESIGN_LATEST.md

<!-- AGENT NOTE: Generated from visual analysis and CSS parsing. Grill-me should validate. -->

## 1. Overview
This design system defines the visual architecture for the Big Library. It leverages a clean, high-contrast, "April Green" aesthetic tailored for technical reading, MCP token management, and structured OKF document display.

## 2. Colors
- **Brand / Accent**: `rgb(22, 163, 74)` (#16A34A) - Used for primary actions, active tabs, and focus rings.
- **Backgrounds**: Light mode defaults to `var(--neutral-25)` for backgrounds and `var(--neutral-0)` for surfaces.
- **Typography Colors**: `var(--neutral-800)` for primary text, `var(--neutral-600)` for secondary.
- **Semantic Roles**: Success (Green), Warning (Amber), Error (Red), Info (Blue).

## 3. Typography
- **Primary Font**: Inter (UI, Body, Headings).
- **Monospace Font**: Fira Code (Code blocks, Tokens).
- **Scale**:
  - `text-xs`: 12px
  - `text-s`: 14px
  - `text-m`: 16px (Base)
  - `text-l`: 20px
  - `text-xl`: 24px
  - `text-2xl`: 32px
  - `text-3xl`: 40px

## 4. Spacing
- **Base Unit**: 4px.
- **Scale**: space-1 (2px), space-2 (4px), space-4 (8px), space-8 (16px), space-12 (24px), space-16 (32px), space-32 (64px).

## 5. Radii
- `radius-xs`: 4px
- `radius-s`: 8px
- `radius-m`: 12px
- `radius-l`: 16px
- `radius-full`: 9999px

## 6. Elevation & Shadows
- `shadow-xs`: 0 1px 2px (cards, subtle elevations)
- `shadow-s`: 0 1px 3px (hover states)
- `shadow-m`: 0 4px 6px (dropdowns, lifted elements)
- Focus Ring: `0 0 0 3px rgba(22, 163, 74, 0.30)`

## 7. Components
- **Buttons**: `.btn` with variants (`.btn-primary`, `.btn-secondary`, `.btn-danger`, `.btn-ghost`). Primary buttons use the accent green.
- **Cards**: `.card` with `var(--bg-surface)` and `var(--radius-m)`. Includes `card-header` and `card-title`.
- **Badges**: Pill-shaped `.badge` for categorizing books (Agile & Lean, Architecture, Management).
- **Inputs**: `.input` and `.input-with-prefix` for forms and token displays.
- **Layout**: Two-column `.layout` with a fixed `.sidebar` (252px) and a flexible `.content` area.
- **Tabs**: Horizontal navigation with `border-bottom` active states (`.tab.active`).

## 8. Do's and Don'ts
<!-- AGENT NOTE: Generated from visual analysis. Grill-me should validate. -->
- **Do** use the April Green accent sparingly for primary CTAs and active states.
- **Do** rely on the 4px spacing grid for alignment.
- **Don't** mix custom hex colors; always use the CSS variables defined in the system.
- **Don't** override component radii manually.
