#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo = 
{
	name = "Nextmap Info",
	author = "PSIH :{",
	description = "Prints the nextmap on map end.",
	version = "1.0.0",
	url = "https://github.com/0RaKlE19/nextmapinfo"
};

public void OnPluginStart()
{
	HookEvent("cs_win_panel_match", GameEndMb);
}

public void GameEndMb(Event event, const char[] name, bool dontBroadcast)
{
	char nextmap[256];
	GetConVarString(FindConVar("sm_nextmap"), nextmap, sizeof(nextmap));
	for(int i = 0; i < 5; i++)	PrintToChatAll(" \x04Next map: %s", nextmap);
}