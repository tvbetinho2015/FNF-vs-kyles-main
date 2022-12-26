function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'studio', -800, -580);
	setScrollFactor('stageback', 0.9, 0.9);
	
	addLuaSprite('stageback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end