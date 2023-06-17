// Written by Sychotix (twitch.tv/sychotixx... but I don't stream much ;)
// Shoutouts to the Granny (PC) discord

// Steam
state("Granny Chapter Two")
{
	byte mouseIcon      : "UnityPlayer.dll", 0x01688078, 0x8, 0x30, 0x160;
	int sceneBuildIndex : "UnityPlayer.dll", 0x1693058, 0x48, 0x98; // 0 = Intro, 1 = Menu, 2 = Intro Cutscene, 3 = Main Game, 4 = EndScene
}

startup {
	vars.Log = (Action<object>)(output => print("[G2-ASL] " + output));

	vars.ItemOffsets = new Dictionary<string, int>()
	{
		{ "Cutting Pliers", 0xB8 },
		{ "Door Lock", 0xD0 },
		{ "Crowbar", 0xE8 },
		{ "Safe Key", 0x100 },
		{ "Padlock Key", 0x118 },
		{ "Door Handle", 0x130 },
		{ "Spark Plug", 0x148 },
		{ "Boat Key", 0x160 },
		{ "Gasoline Can", 0x178 },
		{ "Shotgun", 0x190 },
		{ "Hand Wheel", 0x1A8 },
		{ "Boat Steering Wheel", 0x1C0 },
		{ "Stun Gun", 0x1E0 },
		{ "Weapon Key", 0x1F8 },
		{ "Security Key", 0x210 },
		{ "Wrench", 0x228 },
		{ "Special Key", 0x240 },
		{ "Vase", 0x258 },
		{ "Meat", 0x270 },
		{ "Helicopter Key", 0x288 },
		{ "Duct Tape", 0x2A0 },
		{ "Painting Piece 1", 0x2B8 },
		{ "Painting Piece 2", 0x2D0 },
		{ "Painting Piece 3", 0x2E8 },
		{ "Glass Fuse", 0x300 },
		{ "Grenade", 0x318 },
	};

	settings.Add("item_pickup", true, "Split on item pickup:");

	vars.ItemsGot = new Dictionary<string, bool>();
	vars.ItemWatchers = new MemoryWatcherList();
	foreach(string key in vars.ItemOffsets.Keys)
	{
		vars.ItemsGot.Add(key, false);
		vars.ItemWatchers.Add(
			new MemoryWatcher<bool>(
				// InventoryController - may break, worked for me
				new DeepPointer("GameAssembly.dll", 0xCBC280, 0x280, 0x88, 0x10, 0x30, 0xD8, 0x28,
				vars.ItemOffsets[key])
			) { Name = key }
		);

		settings.Add(key, false, key, "item_pickup");
	}
}

init {
	
}

update {
	vars.ItemWatchers.UpdateAll(game);
}

start {
	if (old.mouseIcon == 0 && current.mouseIcon == 1 && current.sceneBuildIndex == 3) {
		return true;
	}
}

onStart {
	// mark everything as not picked up yet
	foreach(string key in vars.ItemOffsets.Keys) vars.ItemsGot[key] = false;
}

split {
	// Split when an item is picked up
	foreach(string key in vars.ItemOffsets.Keys)
	{
		if(!vars.ItemsGot[key]					// if we haven't already picked this item up
			&& !vars.ItemWatchers[key].Old		// and we just picked it up
			&& vars.ItemWatchers[key].Current)  
		{
			vars.ItemsGot[key] = true;

			return settings[key];
		}
	}

	return false;
}

reset {
	// If we are sitting at the menu, do not reset unless the timer is still running. If we are watching the intro cutscene, we should reset regardless.
	return (timer.CurrentPhase == TimerPhase.Running && current.sceneBuildIndex == 1) || current.sceneBuildIndex == 2; 
}
