# 🎯 Deadeye Dimensions – RedM Interior System

Advanced RedM dimension system using RoutingBuckets to reduce OneSync issues and player density limitations.

It features extremely performant **automatic interior detection**, removing the need for manual PolyZone setup.

## 🚀 Features
- 🔍 Automatic interior detection
- 📦 Optional PolyZone support
- ⚙️ Interior whitelist & blacklist system
- 👥 Solves player density issues using dimensions (RoutingBuckets)
- 🔄 Improves OneSync stability
- 📡 Dynamic activation based on nearby players
- 🐎 Entity sync (horses, vehicles, props)
- 🔔 Optional notifications on dimension change
- 🧩 Client hook before dimension switch

## 🧠 How It Works
Players entering interiors are automatically moved into separate dimensions.

This reduces congestion and improves server performance by distributing players across isolated instances.

## 🏠 Interior Modes
- **Whitelist:** Only selected interiors use the system  
- **Blacklist:** All interiors included except excluded ones (e.g. banks, stores)

## ⚙️ Installation
1. Add resource to your server  
2. Ensure it in `server.cfg`  
3. Configure in config file  

If you do not want to use PolyZone:
- Remove it from `fxmanifest.lua`
- Disable it in `Config.Modules`

## 💻 Command
- `/getInteriorId` → Get current interior ID

## 🔗 Compatibility
- Vorp Framework  
- PolyZone (optional)

## 📊 Support
Discord: https://discord.gg/DU5eb5vJ4q  

## 🛒 More Scripts
https://deadeyeac.com  

## 📜 License
Unauthorized redistribution or resale is prohibited.

## 🙏 Credits
This project is inspired by:  
https://github.com/Fixitfy/fx-channel/tree/Fixitfy

Deadeye Dimensions was fully rewritten from scratch and includes several quality-of-life improvements and enhancements, especially for larger servers and better overall usability.

Visit https://fixitfy.fragmentor.io for more great RedM scripts and resources.
