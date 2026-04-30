# 🎯 Deadeye Dimensions – RedM Interior Dimension System

Deadeye Dimensions is an advanced dimension system for RedM servers using RoutingBuckets, designed to minimize OneSync and player density issues.

Unlike traditional solutions, this script introduces **automatic interior detection**, eliminating the need to manually create PolyZones for every building.

## 🚀 Features
- 🔍 Automatic interior detection
- 📦 Optional PolyZone support
- ⚙️ Whitelist & blacklist system for interiors
- 👥 Solves 32 player limit issues using dimensions
- 🔄 Reduces OneSync sync problems
- 📡 Dynamic activation based on player density (radius-based)
- 🐎 Entity synchronization:
  - Horses
  - Vehicles
  - Attached props
- 🔔 Optional dimension change notifications
- 🧩 Pre-dimension change client hook for custom logic

## 🧠 How It Works
Players entering interiors can automatically be placed into separate dimensions.

This prevents overcrowding and sync issues by distributing players across multiple virtual instances.

## 🏠 Interior Modes

### ✅ Whitelist Mode
Only selected interiors will use the dimension system.

Use the command:
```
/getInteriorId
```
to retrieve the interior ID and add it to your config.

### 🚫 Blacklist Mode
All interiors are automatically detected, except those explicitly excluded.

This is useful for:
- Bank robberies
- General stores
- Mission-related interiors

## 📊 Dynamic Activation
The system can optionally activate only when a certain number of players are within a configurable radius.

This improves performance and avoids unnecessary dimension usage.

## 🔄 Entity Handling
When switching dimensions, the script automatically transfers:
- 🐎 Player horses
- 🚗 Vehicles
- 📦 Attached props

## 🧩 Custom Hooks
A client-side function is triggered before dimension switching.

This allows you to:
- Despawn horses
- Execute custom logic
- Prevent certain entities from being transferred

## 🔔 Notifications
Optional notifications can be enabled when a player switches dimensions.

## ⚙️ Installation
1. Download or clone the repository
2. Place the folder in your server resources directory
3. Add the resource to your `server.cfg`
4. Configure the script via the config file

## 💻 Commands
- `/getInteriorId` → Returns the current interior ID

## 🔗 Compatibility
- Standalone
- VORP
- RedEM

## 📜 License
This project is protected. Unauthorized redistribution or resale is prohibited.

## 🔎 Keywords
RedM script, RedM dimensions, RedM interior system, RedM OneSync fix, RDR2 multiplayer script, RedM instance system, RedM performance
