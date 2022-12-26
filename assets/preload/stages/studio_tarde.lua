function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'studio_tarde', -800, -580);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeAnimatedLuaSprite('KylesBG', 'KylesBG', -450, 150);
	scaleObject('KylesBG', 1.1, 1.1);
	setLuaSpriteScrollFactor('KylesBG',0.9, 0.9);

	addLuaSprite('stageback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end