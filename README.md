# Deadeye Anticheat

A server-side driven anticheat for **RedM** servers running **VORP**. It ships with more than 25 detection modules, a database-backed ban system with hardware-token matching, Discord logging, a Discord-role based priority queue and a built-in clientloader that keeps the client code out of the player's cache.

---

## Features

- **25+ detection modules**: every module can be toggled on or off and has its own log, kick and ban settings
- **Persistent bans**: stored in MySQL and matched on license, Steam, Discord, IP and hardware tokens, so a new account on the same machine is still recognised
- **Discord logging**: one webhook per module plus a separate ban/unban log, with the player's RedM name, Steam ID and Discord ID in every embed
- **Priority queue**: optional connect queue with Discord-role priorities, reserved slots, join throttling and reconnect grace
- **Discord role check**: kicks players who lose a required Discord role while they are online
- **Built-in clientloader**: `client.lua` is never listed as a client script. It is sent to each player at runtime and executed in memory, so it can't be dumped from the client cache. Repeated requests for it are treated as a dump attempt (AC28)
- **AdvancedProtection**: an extra detector that runs inside txAdmin's `monitor` resource and flags known cheat menus
- **Stealth mode**: hides the anticheat from connecting players (no queue, no deferral cards, silent client console) while ban checks keep running
- **Admin tools**: unban, clear peds and clear vehicles commands, plus a server export to temporarily whitelist a player

## Requirements

| Dependency | Used for |
| --- | --- |
| [RedM](https://redm.net/) server artifacts | Runtime (`fx_version 'cerulean'`, Lua 5.4) |
| [vorp_core](https://github.com/VORPCORE/vorp-core-lua) | Player groups (admin whitelists, command permissions) and character selection |
| [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua) | Anti-Spawnweapons (compares held weapons against the inventory) |
| [oxmysql](https://github.com/overextended/oxmysql) | Ban storage |
| txAdmin | Only needed for AdvancedProtection |

## Installation

1. Download the repository and place it in your `resources` folder as `deadeye_anticheat`. Any other name works too, but the export examples below use this one.
2. Import `deadeye_anticheat.sql` into your database. It creates the `deadeye_anticheat` (bans) and `deadeye_anticheat_tokens` (hardware tokens) tables.
3. Configure `config.lua` and `config_secure.lua` (see [Configuration](#configuration)).
4. Add the resource to your `server.cfg` **after** its dependencies:

   ```cfg
   ensure oxmysql
   ensure vorp_core
   ensure vorp_inventory
   ensure deadeye_anticheat
   ```

5. Start the server and restart it once so [AdvancedProtection](#advancedprotection) becomes active.
6. On live servers, remove the GitHub link from the `description` line in `fxmanifest.lua`.

## Configuration

The configuration is split into two files:

| File | Loaded on | Contents |
| --- | --- | --- |
| `config.lua` | Server **and** client | Module toggles, punishments, thresholds, whitelists, messages |
| `config_secure.lua` | Server only | Discord webhooks, bot tokens, guild IDs, queue branding |

> Keep secrets in `config_secure.lua` only. `config.lua` is sent to every client.

### General

| Option | Description |
| --- | --- |
| `Config.Devmode` | Allows restarting the resource while players are online. **Never enable on live servers.** |
| `Config.Stealthmode.Enabled` | Hides the anticheat from connecting players. Disables the priority queue and deferral cards. |
| `Config.Modules` | Turns each module on or off. |
| `Config.Punishments` | Sets `Log`, `Kick` and `Ban` per module. |

Most modules also accept `Whitelistgroups` (VORP groups that are exempt) and `Whitelistzones` (`{x, y, z, r}` spheres where the check is skipped, e.g. safezones, stables or teleport points).

### Priority queue

Enable it with `Config.Priorityqueue.Usepriorityqueue` and fill in `DiscordBottoken` and `Guildid` in `SConfig.Priorityqueue`. Each entry in `Priorities` maps a Discord role ID to a power value. Players with a higher power are moved further up the queue.

| Option | Description |
| --- | --- |
| `Maxplayers` | `false` uses `sv_maxclients`, otherwise a fixed number |
| `Joindelay` | Milliseconds between two players being let in |
| `Maxconnecting` | Maximum players loading in at the same time |
| `Reservedslots` / `Reservedpower` | Slots kept free for players with at least this power |
| `Connectinggrace` | Seconds a released player has to finish loading in |
| `Reconnectgrace` | Seconds a player keeps their queue position after a disconnect |

The logo and welcome text on the queue card are set in `SConfig.Priorityqueue`.

### Discord role check

Set `DiscordBottoken`, `Guildid` and `Roleid` in `SConfig.Discordrolecheck`. Online players are re-checked every five minutes. Exempt players with `Whiteliststeamids` or `Whitelistlicenses` in `Config.Discordrolecheck`.

## Detection modules

Every detection is identified by a code. The code is shown in kick and ban messages and in the Discord log.

| Code | Module | Detects |
| --- | --- | --- |
| – | Antirapidfire | Rapid fire with configured weapons (blocks the shots, no punishment) |
| AC01 | AntiAI | Weapon damage multipliers |
| AC02 | AntiInjection | Client resources that don't exist on the server (injected resources) |
| AC03 | NuiBlocker | NUI devtools |
| AC05 | AntiCrash | Crash attempts |
| AC06 | AntiDevmode | Client developer mode |
| AC07 | ForceReleaseChannel *(alpha)* | Game builds other than the configured release build |
| AC08 | AntiSpawnweapons | Weapons that aren't in the player's inventory |
| AC09 | BlacklistWeapons | Blacklisted weapons |
| AC10 | BlacklistAmmo | Blacklisted ammo types |
| AC11 | AntiPedhack | Changing the player ped |
| AC12 | AntiInvincible | Godmode and entity proofs |
| AC13 | AntiExplosion | Invisible, silent or high-damage explosions |
| AC14 | AntiFreecam *(alpha)* | Cameras detached far from the player |
| AC15 | AntiInvisible | Making yourself invisible |
| AC16 | CommandDetection | Blacklisted commands registered on the client |
| AC17 | AntiKillaura | Killaura |
| AC18 | AntiMasskill | Many kills in a short interval |
| AC19 | EntityBlacklist | Blacklisted peds, vehicles and objects |
| AC20 | AntiEntityspam | Spawning too many entities of one model |
| AC21 | AntiController | Controller input |
| AC22 | Discordrolecheck | Losing the required Discord role |
| AC23 | AntiInfiniteAmmo | Infinite ammo / no reload |
| AC24 | AntiTeleport *(alpha)* | Teleporting outside whitelisted zones |
| AC25 | AntiBiggerHitbox | Enlarged hitboxes |
| AC26 | AntiTriggerBot | Inhuman reaction times |
| AC27 | AdvancedProtection | Known cheat menus |
| AC28 | Clientloader | Re-requesting the protected client files (dump attempt) |

Modules marked *alpha* can produce false positives. Test them on your server before enabling punishments.

> **AntiAI:** the damage values in `Config.AntiAI.Weapons` don't change weapon damage. If another script modifies weapon damage, enter the modified values here.

## AdvancedProtection

AdvancedProtection runs a small detector inside txAdmin's `monitor` resource that looks for traces left behind by known cheat menus. It only works when the server is started through txAdmin.

When `Config.Modules.AdvancedProtection` is enabled, the anticheat checks `monitor` on every server start:

- **Installed and up to date**: nothing is printed.
- **Missing or outdated**: the anticheat copies `detector.lua` into `monitor` and adds `client_script 'detector.lua'` to the end of its `fxmanifest.lua`. Restart the server once to activate it.
- **Can't be installed automatically**: some hosts don't allow writing into the server artifacts. The console then prints the manual installation steps, with the exact paths for your server.

Until AdvancedProtection is active, the console prints the Deadeye banner and the next step every 30 seconds. `monitor` is replaced when you update your server artifacts, so the detector is installed again on the first start after an update.

## Commands

The commands can be run from the server console or in-game by players whose VORP group is in the command's `admingroups`.

| Command | Description |
| --- | --- |
| `/acunban <banid>` | Removes a ban. The Ban-ID is shown to the banned player and in the ban log. |
| `/clearpeds [delay]` | Deletes all non-player peds after `delay` seconds |
| `/clearvehicles [delay]` | Deletes all vehicles after `delay` seconds |

Command names and permitted groups are set in `Config.Unban`, `Config.ClearPeds` and `Config.ClearVehicles`.

## Exports

```lua
-- Server-side: exempt a player from all punishments for the given number of seconds
exports.deadeye_anticheat:Whitelistbyid(source, seconds)
```

Use this in your own scripts before doing something the anticheat would otherwise flag, such as teleporting a player or giving them a weapon. If you renamed the resource folder, replace `deadeye_anticheat` with your folder name.

## Project structure

```
deadeye_anticheat/
├── AdvancedProtection/
│   └── detector.lua        # detector for txAdmin's monitor resource
├── html/                   # NUI page (devtools and release-channel checks)
├── client.lua              # client detections, delivered by the clientloader
├── clientloader.lua        # runtime delivery of client.lua
├── config.lua              # shared configuration
├── config_secure.lua       # server-only secrets
├── deadeye_anticheat.sql   # database schema
├── fxmanifest.lua
└── server.lua              # detections, bans, queue, logging, commands
```

## License

Released under the [MIT License](LICENSE).
