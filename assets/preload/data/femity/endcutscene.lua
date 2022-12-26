local allowCountdown = false
function onEndSong()
     if not allowCountdown and isStoryMode then --Block the first countdown
        startVideo('Unlockweek');
        allowCountdown = true;
         return Function_Stop;
    end
     return Function_Continue;
end
