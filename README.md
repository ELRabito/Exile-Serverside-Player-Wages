# Exile-Serverside-Player-Wages


\@ExileServer\addons\exile_server\bootstrap\fn_preInit.sqf

1. Add this line and add the file in the right folder! Adjust the poptab amount or toast to your likings.

  ['ExileServer_system_PlayerWages_thread','exile_server\code\ExileServer_system_PlayerWages_thread.sqf',false],

2. Add this to ExileServer_system_process_postInit
- The number at the beginning is the time in seconds (How often it runs)

  [600, ExileServer_system_PlayerWages_thread, [], true] call ExileServer_system_thread_addTask;

3. Repack your server pbo and done.
