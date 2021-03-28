// v1.0 of Granny (PC) for Steam's current version (3/22/21)
// Written by Sychotix (twitch.tv/sychotixx... but I don't stream much ;)
// Rewritten more beautifully (and a better pointer for InventoryController) to Ero
// Shoutouts to the Granny (PC) discord

// Steam
state("Granny", "v1.2.1")
{
	long mouseIconPtr   : "UnityPlayer.dll", 0x1633700, 0x8, 0x30, 0x120;
	byte mouseIcon      : "UnityPlayer.dll", 0x1633700, 0x8, 0x30, 0x120, 0xC;
	int sceneBuildIndex : "UnityPlayer.dll", 0x168FF58, 0x48, 0x98; // 0 = Intro, 1 = Menu, 2 = Forest Cutscene, 3 = Main Game, 4 = EndScene
	long inventoryControllerPtr : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x868;
	// checkTheCar class
	bool forwardOK : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x188, 0x6C;
	bool carMoving : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x188, 0x74;
	// carFrontSensor
	float hitGaragedoorCounter  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x800, 0x10, 0xA18, 0x398, 0xD4;
	//CheckExitDoor

	/*bool lampa1ok  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x10c;
	bool lampa2ok  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x10d;
	bool planka1Bort  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x10E;
	bool planka2Bort  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x10F;
	bool hangLockBort  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x110;
	bool DpadlockBort  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x111;
	bool batteryLockOk  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x112;
	bool extremeLockOk  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x113;
	bool extraLockPlaced  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x11E;
	bool easyDiff  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x11f;
	bool normalDiff  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x120;
	bool hardDiff  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x121;
	bool extremeDiff  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x122;
	bool practiseDiff  : "mono-2.0-bdwgc.dll", 0x4A2460, 0x210, 0xE50, 0x28, 0x123;*/

}

startup {
	vars.splitsDict = new Dictionary<string, int> {
		{         "Painting Piece 1", 0x54A },
		{         "Painting Piece 2", 0x54B },
		{         "Painting Piece 3", 0x54C },
		{         "Painting Piece 4", 0x54D },
		{                   "Pliers", 0x54E },
		{                   "Hammer", 0x54F },
		{                     "Vase", 0x550 },
		{                   "Vase 2", 0x551 },
		{                 "Safe Key", 0x552 },
		{               "Master Key", 0x553 },
		{              "Padlock Key", 0x554 },
		{                     "Code", 0x555 },
		{                 "Crossbow", 0x556 },
		{                    "Arrow", 0x557 },
		{        "Crossbow Arrow OK", 0x558 },
		{               "Weapon Key", 0x559 },
		{              "Screwdriver", 0x55A },
		{                   "Planka", 0x55B },
		{                  "Battery", 0x55C },
		{            "Playhouse Key", 0x55D },
		{                  "Car Key", 0x55E },
		{                    "Melon", 0x55F },
		{                    "Teddy", 0x560 },
		{           "Cogwheel (red)", 0x561 },
		{         "Cogwheel (metal)", 0x562 },
		{                  "Message", 0x563 },
		{             "Winch Handle", 0x564 },
		{ "Old Shotgun (Not loaded)", 0x565 },
		{     "Old Shotgun (Loaded)", 0x566 },
		{   "Shotgun part (trigger)", 0x567 },
		{     "Shotgun part (stock)", 0x568 },
		{    "Shotgun part (barrel)", 0x569 },
		{              "Engine Part", 0x56A },
		{              "Car Battery", 0x56B },
		{                  "Gas Can", 0x56C },
		{                   "Wrench", 0x56D },
		{               "Spark Plug", 0x56E },
		{                     "Meat", 0x56F },
		{              "Special Key", 0x570 },
		{                     "Book", 0x571 },
		{              "Pepperspray", 0x572 },
		{                   "Remote", 0x573 },
		{                "Bird Seed", 0x574 },
		{              "Freeze Trap", 0x575 }
	};

	// A setting for turning off splits is unfounded here.
	// LiveSplit has a default setting for turning on/off start, split and reset.
	settings.Add("boolSplits", false, "Split upon collecting an item:");
	foreach (var split in vars.splitsDict)
		settings.Add(split.Key, false, split.Key, "boolSplits");

	//settings.Add("extraExitCondition", false, "Exit condition (used for final split)");
	//settings.SetToolTip("extraExitCondition", "This is used to minimize auto-split when returning to main menu");
	//settings.Add("extraDoorLocks", false, "Extra locks (Door)", "extraExitCondition");
}

init {
	/*IntPtr invConInstance = IntPtr.Zero;
	new DeepPointer("mono-2.0-bdwgc.dll", 0x4A2448, 0x910).DerefOffsets(game, out invConInstance);
	if (invConInstance == IntPtr.Zero) {
		Thread.Sleep(2000);
		throw new Exception("InventoryController couldn't be initialized!");
	}*/

	vars.completedSplits = new HashSet<string>();
	vars.boolWatchers = new MemoryWatcherList();
}

update {
	if (current.inventoryControllerPtr > 0)
	{
		if (vars.boolWatchers.Count == 0 || current.inventoryControllerPtr != old.inventoryControllerPtr)
		{
			vars.boolWatchers.Clear();
			
			foreach (var split in vars.splitsDict)
				vars.boolWatchers.Add(new MemoryWatcher<bool>(new DeepPointer(new IntPtr(current.inventoryControllerPtr + split.Value))) { Name = split.Key });
			
		}
		else vars.boolWatchers.UpdateAll(game);
	}
}

start {
	if (old.mouseIconPtr == 0 && current.mouseIconPtr > 0 &&  current.mouseIcon == 1 && current.sceneBuildIndex == 3) {
		vars.completedSplits.Clear();
		return true;
	}
}

split {
	foreach (var watcher in vars.boolWatchers) {
		if (watcher.Changed && watcher.Current && !vars.completedSplits.Contains(watcher.Name)) {
			vars.completedSplits.Add(watcher.Name);
			return settings[watcher.Name];
		}
	}

	// I think this logic should work, but it shouldn't be necessary with scene id
	/*if(current.lampa1ok && current.lampa2ok && current.planka1Bort && current.planka2Bort && current.hangLockBort)
	{
		if (current.normalDiff && )
		{
			return current.batteryLockOK && current.dpadLockbort && (!settings[extraDoorLocks] || settings[extraDoorLocks] && current.extremeLockOK)
		}
		if (current.easyDiff)
		{
			return current.extraLockPlaced && current.dpadLockbort &&  && current.batteryLockOK  && current.extremeLockOK;
		}
		if ((current.extremeDiff || current.practiseDiff || current.hardDiff) &)
		{
			if (settings[extraDoorLocks])
				return current.extraLockPlaced && current.dpadLockbort && current.batteryLockOk && current.extremeLockOk
			else
			{
				return !current.extraLockPlaced || current.extraLockPlaced && current.dpadLockbort;
			}
		}
	}*/

	return old.mouseIconPtr > 0 && current.mouseIconPtr == 0 && current.sceneBuildIndex == 3 ||
		current.carMoving && current.forwardOK && current.hitGaragedoorCounter == 2.0f;
	;
}

reset {
	// If we are sitting at the menu, do not reset unless the timer is still running. If we are watching the forest cutscene, we should reset regardless.
	return (timer.CurrentPhase == TimerPhase.Running && current.sceneBuildIndex == 1) || current.sceneBuildIndex == 2; 
}
