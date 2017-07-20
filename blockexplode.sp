#include <sourcemod>

#define BLOCKEXPLODE_VERSION "1.0"
Handle be_enabled;

public Plugin myinfo = 
{
    name = "Block Explode",
    author = "Simon",
    description = "Block's explode command",
    version = BLOCKEXPLODE_VERSION,
    url = "yash1441@yahoo.com"
};

public OnPluginStart()
{
    CreateConVar( "be_version", BLOCKEXPLODE_VERSION, "ExplodeBlock Version", FCVAR_NOTIFY );
    be_enabled = CreateConVar("be_enabled", "1", "Enable or disable ExplodeBlock; 0 - disabled, 1 - enabled");
    AddCommandListener(BlockExplode, "explode");
}

public Action BlockExplode(client, const char[] command, argc)
{
    if (GetConVarInt(be_enabled) == 1)
    {
        PrintToChat(client, "\x01\x0B\x02[BlockExplode]\x01 The \x04explode\x01 command is blocked!");
        return Plugin_Handled;
    }
    return Plugin_Continue;
}  