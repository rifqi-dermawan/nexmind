#!/usr/bin/env bash
# Nexmind Admin Dashboard - skills.sh
# Purpose: guardrails for vibe coding in Antigravity
# Mode: mobile-first admin dashboard first
# Source of truth: PRD + design system + Stitch UI exports

set -euo pipefail

export APP_NAME="Nexmind Admin"
export PRODUCT_KIND="Mobile-first Admin Dashboard"
export STACK_FRONTEND="Flutter (Dart)"
export STACK_BACKEND="Express.js + TypeScript"
export LOCAL_DB="SQLite (only if needed)"
export THEME_LIGHT_BG="#F8F8F6"
export THEME_DARK_BG="#111111"
export PRIMARY_YELLOW="#FFC107"
export PRIMARY_BLACK="#111111"
export SOFT_YELLOW="#FFF4CC"
export BORDER="#E8E8E3"
export FONT_FAMILY="Inter"
export ICON_FAMILY="Lucide-like outline icons"
export NAV_ITEMS="Dashboard, Users, Conversions, Settings"

# --------------------------------------------------
# 0) GOAL
# --------------------------------------------------
# Build the Admin Dashboard first.
# Do not start from unrelated screens.
# Preserve the UI that already exists from Stitch.
# Only convert it into code.
# Keep Top Bar and Bottom Navigation consistent.
# Bottom Navigation = 4 icons only, no text labels.

# --------------------------------------------------
# 1) INPUTS TO PREPARE BEFORE CODING
# --------------------------------------------------
# Required:
# - PRD_Admin_Dashboard.pdf
# - design.md / DESIGN.md
# - exported Stitch screenshots (Dashboard, Users, Conversions, Settings)
# - icon assets / SVG set
# - logo asset
# - route map
# - component map
# - state matrix
# - API contract or local data contract
# - empty/error/loading references

# --------------------------------------------------
# 2) NON-NEGOTIABLE RULES
# --------------------------------------------------
# - Do not redesign the UI.
# - Do not change Top Bar layout.
# - Do not change Bottom Navigation layout.
# - Do not add text labels to Bottom Navigation.
# - Do not create a new color palette.
# - Do not use mock data as a permanent source.
# - Do not mix icon families.
# - Do not let any screen drift from the global design system.
# - Do not change the active nav geometry between screens.
# - Do not invent new components if a shared component already exists.

# --------------------------------------------------
# 3) IMPLEMENTATION ORDER
# --------------------------------------------------
# Phase 1: Project bootstrap
# Phase 2: Theme tokens and shared design system
# Phase 3: Global shell (Top Bar + Bottom Navigation)
# Phase 4: Dashboard screen
# Phase 5: Users screen
# Phase 6: Conversions screen
# Phase 7: Settings screen
# Phase 8: Secondary screens
# Phase 9: Loading / empty / error states
# Phase 10: Data integration and QA

# --------------------------------------------------
# 4) RECOMMENDED FLUTTER SETUP
# --------------------------------------------------
# - State management: Riverpod
# - Routing: go_router
# - Networking: Dio
# - Models: freezed + json_serializable
# - Secure storage: flutter_secure_storage
# - Local prefs/theme: shared_preferences
# - Icons: one consistent outline icon set
# - Animation: subtle, minimal only
# - Charts: lightweight Flutter chart package
# - Responsive: mobile-first layouts

# --------------------------------------------------
# 5) GLOBAL UI CONTRACT
# --------------------------------------------------
# Shared components:
# - Global Top Bar
# - Global Theme Toggle
# - Global Bottom Navigation
# - Global Back Button
# - Global Icon System
# - Global Card System
# - Global Button System
#
# Bottom Navigation rules:
# - 4 items only
# - icon-only
# - no visible text labels
# - same order everywhere:
#   Dashboard / Users / Conversions / Settings
# - centered
# - floating pill
# - perfectly horizontal
# - safe-area aware
# - same width/height/radius on every screen
#
# Top Bar rules:
# - consistent height
# - icon-only actions
# - theme toggle icon-only (sun/moon/system)
# - no screen-specific redesign

# --------------------------------------------------
# 6) DESIGN TOKENS
# --------------------------------------------------
# Light mode:
# background  #F8F8F6
# surface     #FFFFFF
# highlight   #FFF4CC
# primary     #FFC107
# text        #111111
# border      #E8E8E3
#
# Dark mode:
# background  #111111
# surface     #1C1C1C
# elevated    #242424
# primary     #FFC107
# text        #FFFFFF
# muted       #B8B8B8
# border      #333333

# --------------------------------------------------
# 7) FILE / FOLDER SHAPE
# --------------------------------------------------
# lib/
#   core/
#     theme/
#     router/
#     widgets/
#     constants/
#   features/
#     auth/
#     dashboard/
#     users/
#     conversions/
#     settings/
#     notifications/
#     support/
#     analytics/
#     maintenance/
#
# Keep shared widgets in core/widgets.
# Keep screen-specific widgets inside feature folders.

# --------------------------------------------------
# 8) BUILD RULES PER SCREEN
# --------------------------------------------------
# Dashboard:
# - detailed KPI cards
# - subtle yellow accents or gradients only in small areas
# - analytics cards
# - recent activity
# - system health
# - quick actions
#
# Users:
# - list / card view
# - search
# - filter
# - detail navigation
#
# Conversions:
# - conversion list
# - status badges
# - conversion detail
#
# Settings:
# - appearance
# - help & support
# - maintenance
# - admin profile
#
# Secondary screens:
# - reuse global shell if appropriate
# - or hide Bottom Navigation for full-screen auth/detail states
# - never invent a new navigation pattern

# --------------------------------------------------
# 9) STATE MATRIX
# --------------------------------------------------
# Every screen should consider:
# - default
# - loading
# - empty
# - error
# - success
# - disabled
#
# Theme states:
# - light
# - dark
# - system
#
# Navigation states:
# - active
# - inactive
# - pressed
# - focused

# --------------------------------------------------
# 10) DATA RULES
# --------------------------------------------------
# - For admin dashboard phase 1, mock data may be used only
#   as temporary placeholders for UI wiring.
# - Replace with real data contract as soon as possible.
# - Keep data shape stable.
# - Keep naming consistent.
# - Do not hardcode layout-breaking sample data.

# --------------------------------------------------
# 11) VIBE CODING FLOW
# --------------------------------------------------
# 1. Read PRD and design.md first.
# 2. Implement theme tokens.
# 3. Build shared shell.
# 4. Build Dashboard.
# 5. Reuse shell for Users, Conversions, Settings.
# 6. Add secondary screens.
# 7. Test light/dark mode.
# 8. Test bottom navigation consistency.
# 9. Test safe area on real devices.
# 10. Polish only after structure is stable.

# --------------------------------------------------
# 12) FLUTTER COMMANDS TO RUN OFTEN
# --------------------------------------------------
# flutter pub get
# flutter analyze
# flutter test
# flutter run
# flutter build apk
#
# During vibe coding, fix errors immediately before moving on.

# --------------------------------------------------
# 13) QA CHECKLIST
# --------------------------------------------------
# - Top Bar identical across screens?
# - Bottom Navigation identical across screens?
# - 4 nav items only?
# - No text labels in Bottom Nav?
# - Same icon family everywhere?
# - Light / Dark mode consistent?
# - Safe area respected?
# - No clipped content?
# - No horizontal overflow?
# - No screen-specific design drift?
# - Dashboard feels detailed but still clean?
# - Yellow accents are controlled, not excessive?

# --------------------------------------------------
# 14) DONE CRITERIA
# --------------------------------------------------
# The Admin Dashboard is ready for the next phase when:
# - shared shell is stable
# - theme switching works
# - bottom navigation is identical everywhere
# - Dashboard / Users / Conversions / Settings are consistent
# - secondary screens follow the same design language
# - code is clean enough for developer handoff

# End of skills.sh
