local allowCountdown = false
function onEndSong()
     if not allowCountdown and isStoryMode then --Block the first countdown
        startVideo('freeplayunlocked');
        allowCountdown = true;
         return Function_Stop;
    end
     return Function_Continue;
end
