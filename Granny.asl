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
	long inventoryControllerPtr : "mono-2.0-bdwgc.dll", 0x4A2448, 0x910;
	// checkTheCar class
	bool forwardOK : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x188, 0x6C;
	bool carMoving : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x188, 0x74;
	// carFrontSensor
	float hitGaragedoorCounter  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x800, 0x10, 0xA18, 0x398, 0xD4;
	
	//CheckExitDoor
	/*vars.lampa1ok  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x10c;
	vars.lampa2ok  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x10d;
	vars.planka1Bort  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x10E;
	vars.planka2Bort  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x10F;
	vars.hangLockBort  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x110;
	vars.DpadlockBort  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x111;
	vars.batteryLockOk  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x112;
	vars.extremeLockOk  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x113;
	vars.extraLockPlaced  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x11E;
	//vars.easyDiff  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x11f; // Note, this value is always 0 because reasons
	vars.normalDiff  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x120;
	vars.hardDiff  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x121;
	vars.extremeDiff  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x122;
	//vars.practiseDiff  : "mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8, 0x123;*/

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

	

	settings.Add("extraExitCondition", false, "Exit condition (used for final split)");
	settings.SetToolTip("extraExitCondition", "This is used to minimize auto-split when returning to main menu");
	settings.Add("extraDoorLocks", false, "Extra locks (Door)", "extraExitCondition");
}

init {
	/*IntPtr invConInstance = IntPtr.Zero;
	new DeepPointer("mono-2.0-bdwgc.dll", 0x4A2448, 0x910).DerefOffsets(game, out invConInstance);
	if (invConInstance == IntPtr.Zero) {
		Thread.Sleep(2000);
		throw new Exception("InventoryController couldn't be initialized!");
	}*/

	vars.hasDoneCarSplit = false;
	vars.completedSplits = new HashSet<string>();
	vars.boolWatchers = new MemoryWatcherList();
	vars.lampa1ok  = null;
	vars.lampa2ok  = null;
	vars.planka1Bort  = null;
	vars.planka2Bort  = null;
	vars.hangLockBort  = null;
	vars.DpadlockBort  = null;
	vars.batteryLockOk  = null;
	vars.extremeLockOk  = null;
	vars.extraLockPlaced  = null;
	//vars.easyDiff  = new MemoryWatcher<bool>(new DeepPointer(inventoryControllerInstance, 0x11f; // Note, this value is always 0 because reasons
	vars.normalDiff  = null;
	vars.hardDiff  = null;
	vars.extremeDiff  = null; 
	//vars.practiseDiff  = new MemoryWatcher<bool>(new DeepPointer(inventoryControllerInstance, 0x123;*/
	
	/*IntPtr inventoryControllerInstance = IntPtr.Zero;
	new DeepPointer("mono-2.0-bdwgc.dll", 0x4A2448, 0x910).DerefOffsets(game, out inventoryControllerInstance);
	if (inventoryControllerInstance == IntPtr.Zero) {
		Thread.Sleep(2000);
		print("InventoryController couldn't be initialized!");
		return;
	}*/
}

update {
	// If we are not in-game, just return here
	if (current.sceneBuildIndex != 3)
		return;
	
	if (vars.boolWatchers.Count == 0 || current.inventoryControllerPtr != old.inventoryControllerPtr)
	{
		vars.boolWatchers.Clear();
		
		foreach (var split in vars.splitsDict)
		{
			IntPtr inventoryControllerBoolPtr = new IntPtr(current.inventoryControllerPtr + split.Value);
			vars.boolWatchers.Add(new MemoryWatcher<bool>(inventoryControllerBoolPtr) { Name = split.Key });
		}
	}
	
	// If we are not initialized or just  re-entered the  game... set everything up again.
	if (vars.lampa1ok == null || old.sceneBuildIndex != 3)
	{
		print("Running update");
		

		IntPtr checkExitDoorInstance = IntPtr.Zero;
		new DeepPointer("mono-2.0-bdwgc.dll", 0x492DE8, 0x38, 0x9B0, 0x190, 0x30, 0x7F8).DerefOffsets(game, out checkExitDoorInstance);
		if (checkExitDoorInstance == IntPtr.Zero) {
			Thread.Sleep(2000);
			print("CheckExitDoor couldn't be initialized!");
			return;
		}
		
		vars.lampa1ok  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x10c));
		vars.lampa2ok  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x10d));
		vars.planka1Bort  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x10E));
		vars.planka2Bort  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x10F));
		vars.hangLockBort  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x110));
		vars.DpadlockBort  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x111));
		vars.batteryLockOk  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x112));
		vars.extremeLockOk  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x113));
		vars.extraLockPlaced  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x11E));
		//vars.easyDiff  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x11f; // Note, this value is always 0 because reasons
		vars.normalDiff  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x120));
		vars.hardDiff  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x121));
		vars.extremeDiff  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x122));
		//vars.practiseDiff  = new MemoryWatcher<bool>(new DeepPointer(checkExitDoorInstance, 0x123;*/	
	} else
	{
		vars.boolWatchers.UpdateAll(game);		
		vars.lampa1ok.Update(game);
		vars.lampa2ok.Update(game);
		vars.planka1Bort.Update(game);
		vars.planka2Bort.Update(game);
		vars.hangLockBort.Update(game);
		vars.DpadlockBort.Update(game);
		vars.batteryLockOk.Update(game);
		vars.extremeLockOk.Update(game);
		vars.extraLockPlaced.Update(game);
		//vars.easyDiff  = new MemoryWatcher<bool>(new DeepPointer(inventoryControllerInstance, 0x11f; // Note, this value is always 0 because reasons
		vars.normalDiff.Update(game);
		vars.hardDiff.Update(game);
		vars.extremeDiff.Update(game);
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
		if (watcher.Current && !vars.completedSplits.Contains(watcher.Name)) {
			print("Splitting for item get: " + watcher.Name);
			vars.completedSplits.Add(watcher.Name);
			return settings[watcher.Name];
		}
	}

	// This is the case when we should stop the timer for the door exit
	// Now lets check all of the bits and bobs as a just-in-case (sometimes this happens when we haven't completed the door)
	// Also just for the hell of it, I'm duplicating the game logic for each difficulty to be super precise
	if (old.mouseIconPtr > 0 && current.mouseIconPtr == 0 && current.sceneBuildIndex == 3)
	{
		print("Made it past first test");
		if(vars.lampa1ok.Current && vars.lampa2ok.Current && vars.planka1Bort.Current && vars.planka2Bort.Current && vars.hangLockBort.Current)
		{
					print("Made it past second test");

			if (vars.hardDiff.Current)
			{
				return vars.batteryLockOk.Current && vars.DpadlockBort.Current && (!settings["extraDoorLocks"] || settings["extraDoorLocks"] && vars.extremeLockOk.Current);
			}
			else if (vars.extremeDiff.Current) // Originally thought easy?
			{
				return vars.extraLockPlaced.Current && vars.DpadlockBort.Current && vars.batteryLockOk.Current  && vars.extremeLockOk.Current;
			}
			else // Easy, normal, practice
			{
				if (settings["extraDoorLocks"])
					return vars.extraLockPlaced.Current && vars.DpadlockBort.Current && vars.batteryLockOk.Current && vars.extremeLockOk.Current;
				else
				{
					print("In the final test. vars.extraLockPlaced: " + vars.extraLockPlaced.Current + " vars.DpadlockBort " + vars.DpadlockBort.Current);
					return !vars.extraLockPlaced.Current || vars.extraLockPlaced.Current && vars.DpadlockBort.Current;
				}
			}
		}
	}
		
	// If we haven't returned at this point, return if the car ending is completed
	if (current.carMoving && current.forwardOK && current.hitGaragedoorCounter == 2.0f)
	{
		vars.hasDoneCarSplit = true;
		return true;
	}
	
	return false;
}

reset {
	// If we are sitting at the menu, do not reset unless the timer is still running. If we are watching the forest cutscene, we should reset regardless.
	return (timer.CurrentPhase == TimerPhase.Running && current.sceneBuildIndex == 1) || current.sceneBuildIndex == 2; 
}
