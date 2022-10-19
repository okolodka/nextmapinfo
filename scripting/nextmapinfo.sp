#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo = 
{
	name = "Nextmap Info",
	author = "PSIH :{",
	description = "Prints the nextmap on map end.",
	version = "1.1.0",
	url = "https://github.com/0RaKlE19/nextmapinfo"
};

public void OnPluginStart()
{
	HookEvent("cs_win_panel_match", GameEndMb);
	LoadTranslations("basetriggers.phrases");
}

public void GameEndMb(Event event, const char[] name, bool dontBroadcast)
{
	char nextmap[256];
	char szBuffer[356];
	GetConVarString(FindConVar("sm_nextmap"), nextmap, sizeof(nextmap));
	for(int n = 0; n<=MaxClients; n++)
	{
		if(IsClientInGame(n))
		{
			FormatEx(szBuffer, sizeof(szBuffer), " \x04%T", "Next Map", n, nextmap);
			for(int i = 0; i < 5; i++)
				PrintToChat(n, szBuffer);
		}
	}
}