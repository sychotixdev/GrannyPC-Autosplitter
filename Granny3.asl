// Written by Sychotix (twitch.tv/sychotixx... but I don't stream much ;)
// Shoutouts to the Granny (PC) discord

// Steam
state("Granny 3")
{
	byte mouseIcon      : "UnityPlayer.dll", 0x013EE2B4, 0x30, 0x30, 0xE2C;
	string50 scenePath  : "UnityPlayer.dll", 0x136F1C0, 0x10, 0xC, 0x0;

}

startup {
	
}

init {
	
}

update {
	
}

start {
	if (old.mouseIcon == 0 && current.mouseIcon == 1 && "Assets/1_Scenes/Scene.unity" == current.scenePath) {
		return true;
	}
}

split {
	
}

reset {
	// If we are sitting at the menu, do not reset unless the timer is still running.
	return (timer.CurrentPhase == TimerPhase.Running && "Assets/1_Scenes/Menu.unity" == current.scenePath);
	return false;	
}
