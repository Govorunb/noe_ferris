using System.Text;
using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Linq;
using UndertaleModLib.Util;
using ImageMagick;

EnsureDataLoaded();

bool TryGetAssets(
    out UndertaleRoom noeRoom,
    out UndertaleSprite noelleRoomBg,
    out UndertaleCode eventCreate,
    out UndertaleCode eventStep)
{
    noeRoom = Data.Rooms.ByName("room_lw_noellehouse_noelle");
    noelleRoomBg = Data.Sprites.ByName("bg_noellehouse_noelle");
    eventCreate = Data.Code.ByName("gml_Object_obj_ch4_PDC14A_noelle_Create_0");
    eventStep = Data.Code.ByName("gml_Object_obj_ch4_PDC14A_noelle_Step_0");
    
    return noeRoom is {}
        && noelleRoomBg is {}
        && eventCreate is {}
        && eventStep is {};
}

if (!TryGetAssets(out var room, out var bgSprite, out var createCode, out var stepCode))
{
    throw new ScriptException($"""
    Could not find needed game assets. Please make sure you opened the Chapter 4 data.win.
    The currently open game reports it's called '{Data.GeneralInfo.DisplayName.Content}'.
    """);
}

string scriptDir = Path.GetDirectoryName(ScriptPath);
string bgPath = Path.Join(scriptDir, "art/bg_noellehouse_noelle.png");
string createPath = Path.Join(scriptDir, "noe_ferris_Create_0.gml");
string stepPath = Path.Join(scriptDir, "noe_ferris_Step_0.gml");

if (!File.Exists(bgPath) || !File.Exists(createPath) || !File.Exists(stepPath))
{
    throw new ScriptException("Could not find replacement assets.\nThey should be placed next to the script file.\n\nDid you download the whole repository?");
}

MagickImage newBg = TextureWorker.ReadBGRAImageFromFile(bgPath);
string newCreateGml = File.ReadAllText(createPath);
string newStepGml = File.ReadAllText(stepPath);

if (!ScriptQuestion("Did you remember to back up your data.win?"))
{
    ScriptMessage("To uninstall the mod without a backup data.win, you will have to verify files on Steam.");
}

string[] layersToRemove = new[] { "GIVE_DEPTH", "TILES_Vents" };
string[] objectsToRemove = new[] { "obj_homealone_vent_hidden", "obj_homealone_vent_overlay", "obj_noellehouse_noelle" };
foreach (var layerName in layersToRemove)
{
    room.Layers.Remove(room.Layers.FirstOrDefault(l => l.LayerName.Content == layerName));
}
foreach (var objName in objectsToRemove)
{
    var gameObj = room.GameObjects.FirstOrDefault(go => go.ObjectDefinition.Name.Content == objName);
    foreach (var layer in room.Layers)
    {
        layer.InstancesData?.Instances.Remove(gameObj);
    }
    room.GameObjects.Remove(gameObj);
}

UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data);
importGroup.QueueReplace(createCode, newCreateGml);
importGroup.QueueReplace(stepCode, newStepGml);
importGroup.Import();
bgSprite.Textures[0].Texture.ReplaceTexture(newBg);

ScriptMessage("Done!\n\nDon't forget to Save this data.win (Ctrl+S)");
