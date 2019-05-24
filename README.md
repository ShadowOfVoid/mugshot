# mugshot

### Description
Grabs the mugshot of a ped and uploads it to gyazo. I made this mainly to be able to easily grab mugshots of a ped and use it in NUI.

### Installation
This resource requires you to have <a href="https://github.com/citizenfx/screenshot-basic">screenshot-basic</a> installed.
1. Register a gyazo application <a href="https://gyazo.com/oauth/applications">here</a>.
2. Add the license key to the `uploadUrl` at the top in the client.lua.
3. Add `start mugshot`to your server.cfg. Remember to start it after screenshot-basic and before your scripts that are using the exports.

### Usage
This will upload a screenshot of your own ped and return the image url. This is a client event.
```
local url = exports["mugshot"]:getMugshotUrl(GetPlayerPed(-1))
```

### This is an ugly workaround!
There's currently no way of choosing an area of the screen with the <a href="https://github.com/citizenfx/screenshot-basic">screenshot-basic</a> resource without modifying it. It will always screenshot the whole screen. That's why I'm making this ugly workaround. 

It displays the mugshot in the top left corner for a second. It then takes a screenshot and uploads it to gyazo. Since it's a screenshot of the whole screen we need to crop it. It uses a website called images.weserv.nl that does it for you. You'll then get a link to the mugshot without having to modify anything.

The reason why I choosed gyazo was because it has the easiest api and the default w.wew.wtf has blocked websites like images.weserv.nl.
