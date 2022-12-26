local allowCountdown = false;
local playDialogue = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('kylesfnf_cutscene');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		makeLuaSprite('dialoguebg', 'BG_DIALOGUE_1', 0, 0);
		addLuaSprite('dialoguebg', true);
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = false;
		return Function_Stop;
	end
	removeLuaSprite('dialoguebg', true);
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		triggerEvent('startDia')
		startDialogue('dialogue', 'KyleTime');
	end
end

