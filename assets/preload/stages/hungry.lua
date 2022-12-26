--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'kyle-trap-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'kyles_loss_sfx-2'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

	makeLuaSprite('obj2', 'the-background-ever', -273, -143)
	setObjectOrder('obj2', 1)
	scaleObject('obj2', 1.2, 1.2)
	addLuaSprite('obj2', true)
	
	makeAnimatedLuaSprite('obj4', 'cool_anime_thing', 338, -212)
	setObjectOrder('obj4', 5)
	scaleObject('obj4', 1.3, 1.3)
	addAnimationByPrefix('obj4', 'anim', 'lightning thing0', 24, true)
	playAnim('obj4', 'anim', true)
	addLuaSprite('obj4', true)
	
end