function onCreate()
	-- background shit
    makeAnimatedLuaSprite('stageback','Bus',-50,20)
    addAnimationByPrefix('stageback','loop','Cerario instância 1',24,true)
    setScrollFactor('galaxiianimated', 0.9, 0.9);
	
	addLuaSprite('stageback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end