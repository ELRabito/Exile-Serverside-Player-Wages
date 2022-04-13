# Exile-Serverside-Player-Wages

What it does: Serverside player wages with safezone/territory check and respect multiplier. 

# Installation
1. Add this line below to "\@ExileServer\addons\exile_server\bootstrap\fn_preInit.sqf"

        ['ExileServer_system_PlayerWages_thread','exile_server\code\ExileServer_system_PlayerWages_thread.sqf',false],

2.  Add ExileServer_system_PlayerWages_thread.sqf into "\@ExileServer\addons\exile_server\code\".
- Adjust the poptab amount,respect multiplier and the toast message to your likings.

3. Add this line below to "\@ExileServer\addons\exile_server\bootstrap\fn_preInit.sqf"
- The number at the beginning is the time in seconds (How often it runs).

        [600, ExileServer_system_PlayerWages_thread, [], true] call ExileServer_system_thread_addTask;

4. Repack your server pbo and done.

# License Info: If you server is named KFB (Kentucky Fried Bambi) you have no permission to use this. Any violation will result in a DMCA.
