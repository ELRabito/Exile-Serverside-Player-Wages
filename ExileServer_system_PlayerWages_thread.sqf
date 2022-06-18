/**
* ExileServer_system_PlayerWages_thread
*
* by El Rabito
*
*/
{
	private _player = _x;
	if (alive _player) then
	{
		if ((_player call ExileClient_util_world_isInTraderZone) || (_player call ExileClient_util_world_isInTerritory)) then
		{	
			[_player, "toastRequest", ["ErrorTitleAndText", ["Activity reward",format ["You do not earn Activity rewards in Safezones or Territories!"]]]] call ExileServer_system_network_send_to;
			{playSound "addItemFailed"} remoteExec ["call",_player];
		}else
		{
			private _playerUID = getPlayerUID _player;
			private _playerMoney = _player getVariable ["ExileMoney", -1];
			if(_playerMoney >= 0)then
			{	
				private _playerScore = _player getVariable ["ExileScore",0];
				if(_playerScore < 0) then				
				{
					[_player, "toastRequest", ["ErrorTitleAndText", ["Activity reward","You do not get paid for being an unrespected rat!"]]] call ExileServer_system_network_send_to;
					{playSound "addItemFailed"} remoteExec ["call",_player];
					continue;
				};
				
				private _increase = round (_playerScore * 0.001); // INCREASE DEPENDING ON THE RESPECT AMOUNT
				if (_increase < 1) then {_increase = 0};
				private _amount = 250 + _increase;
				private _newPlayerMoney = _playerMoney + _amount;
				_player setVariable ["ExileMoney", _newPlayerMoney,true];
				[_player, "toastRequest", ["InfoTitleAndText", ["Activity reward",format ["You received +%1 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/><br/>You have now %2 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _amount, _newPlayerMoney]]]] call ExileServer_system_network_send_to;
				{playSound "readoutClick"} remoteExec ["call",_player];
				format["setPlayerMoney:%1:%2", _newPlayerMoney, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			};
		};
	};
	
} forEach entities [["Exile_Unit_Player"], [], true, true];
