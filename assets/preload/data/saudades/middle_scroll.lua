--Examples:

--Dragon = Opponent (Dad), Fox = Player (BF),
--Opponents notes: 0 - 3
--Player notes: 4 - 7

-- Arrow Swap: 0-1: 740, 2-3: + 4, 4-5: 85, 6-7: + 4

local Meow1 = 0
local Meow2 = 112
local Meow3 = 112 * 2
local Meow4 = 112 * 3

function onUpdate(elapsed)
    	if curStep == 5 then
		noteTweenX('dragonTween1', 0, 740 + Meow1, 0.5, 'quartInOut');
                noteTweenAngle("dragonAngle1", 0, -360, 0.5, "quartInOut");
		noteTweenAlpha("dragonAlpha1", 0, 0, 0.5, "quartInOut");

    		noteTweenX('dragonTween2', 1, 740 + Meow2, 0.5, 'quartInOut');
                noteTweenAngle("dragonAngle2", 1, -360, 0.6, "quartInOut");
		noteTweenAlpha("dragonAlpha2", 1, 0, 0.5, "quartInOut");

    		noteTweenX('dragonTween3', 2, 740 + Meow3, 0.5, 'quartInOut');
                noteTweenAngle("dragonAngle3", 2, -360, 0.6, "quartInOut");
		noteTweenAlpha("dragonAlpha3", 2, 0, 0.5, "quartInOut");

    		noteTweenX('dragonTween4', 3, 740 + Meow4, 0.5, 'quartInOut');
                noteTweenAngle("dragonAngle4", 3, -360, 0.6, "quartInOut");
		noteTweenAlpha("dragonAlpha4", 3, 0, 0.5, "quartInOut");

		noteTweenX('foxTween1', 4, 415 + Meow1, 0.5, 'quartInOut');
                noteTweenAngle("foxAngle1", 3, -360, 0.6, "quartInOut");
		noteTweenAlpha("foxAlpha1", 3, 0, 0.5, "quartInOut");

    		noteTweenX('foxTween2', 5, 415 + Meow2, 0.5, 'quartInOut');
                noteTweenAngle("foxAngle2", 3, -360, 0.6, "quartInOut");
		noteTweenAlpha("foxAlpha2", 3, 0, 0.5, "quartInOut");

    		noteTweenX('foxTween3', 6, 415 + Meow3, 0.5, 'quartInOut');
                noteTweenAngle("foxAngle3", 3, -360, 0.6, "quartInOut");
		noteTweenAlpha("foxAlpha3", 3, 0, 0.5, "quartInOut");

    		noteTweenX('foxTween4', 7, 415 + Meow4, 0.5, 'quartInOut');
                noteTweenAngle("foxAngle4", 3, -360, 0.6, "quartInOut");
		noteTweenAlpha("foxAlpha4", 3, 0, 0.5, "quartInOut");
	end

	if curStep == 50 then
		noteTweenX('dragonTween1', 0, 85 + Meow1, 0.5, 'quartInOut');
    		noteTweenX('dragonTween2', 1, 85 + Meow2, 0.5, 'quartInOut');
    		noteTweenX('dragonTween3', 2, 90 + Meow3, 0.5, 'quartInOut');
    		noteTweenX('dragonTween4', 3, 90 + Meow4, 0.5, 'quartInOut');
		noteTweenX('foxTween1', 4, 740 + Meow1, 0.5, 'quartInOut');
    		noteTweenX('foxTween2', 5, 740 + Meow2, 0.5, 'quartInOut');
    		noteTweenX('foxTween3', 6, 744 + Meow3, 0.5, 'quartInOut');
    		noteTweenX('foxTween4', 7, 744 + Meow4, 0.5, 'quartInOut');
	end
end

function onSongStart()
	for i = 0,7 do 
		x = getPropertyFromGroup('strumLineNotes', i, 'x')

		y = getPropertyFromGroup('strumLineNotes', i, 'y')

		table.insert(defaultNotePos, {x,y})
	end
end
