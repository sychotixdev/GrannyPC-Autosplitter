// Written by Sychotix (twitch.tv/sychotixx... but I don't stream much ;)
// Shoutouts to the Granny (PC) discord

// Steam
state("Granny Chapter Two")
{
	byte mouseIcon      : "UnityPlayer.dll", 0x01688078, 0x8, 0x30, 0x160;
	int sceneBuildIndex : "UnityPlayer.dll", 0x1693058, 0x48, 0x98; // 0 = Intro, 1 = Menu, 2 = Intro Cutscene, 3 = Main Game, 4 = EndScene
}

startup {
	
}

init {
	
}

update {
	
}

start {
	if (old.mouseIcon == 0 && current.mouseIcon == 1 && current.sceneBuildIndex == 3) {
		return true;
	}
}

split {
	
}

reset {
	// If we are sitting at the menu, do not reset unless the timer is still running. If we are watching the intro cutscene, we should reset regardless.
	return (timer.CurrentPhase == TimerPhase.Running && current.sceneBuildIndex == 1) || current.sceneBuildIndex == 2; 
}
