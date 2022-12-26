function onCreate()
    precacheImage('kamy1') -- change "iconnamefile" to your correct file
    precacheImage('kamy2') -- change "iconnamefile" to your correct file
end

function onUpdate(elapsed)
    if getProperty('health') > 1.6 then
        setProperty('iconnameP1.visible', false) -- change "iconnameP1" to your correct name
        setProperty('iconnameloseP1.visible', true) -- change "iconnameloseP1" to your correct name
    else
        setProperty('iconnameP1.visible', true) -- change "iconnameP1" to your correct name
        setProperty('iconnameloseP1.visible', false) -- change "iconnameloseP1" to your correct name
    end
end


function onCreatePost()
        makeLuaSprite('iconnameP1', 'kamy1', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile" to your correct file
        setObjectCamera('iconnameP1', 'hud')
        addLuaSprite('iconnameP1', true)
        setObjectOrder('iconnameP1', getObjectOrder('iconP1') + 1)
        setProperty('iconnameP1.flipX', false)
        setProperty('iconnameP1.visible', true)

        makeLuaSprite('iconnameloseP1', 'kamy2', getProperty('iconP1.x'), getProperty('iconP1.y')) -- change "iconnamefile2" to your correct file
        setObjectCamera('iconnameloseP1', 'hud')
        addLuaSprite('iconnameloseP1', true)
        setObjectOrder('iconnameloseP1', getObjectOrder('iconP1') + 1)
        setProperty('iconnameloseP1.flipX', false)
        setProperty('iconnameloseP1.visible', false)
end

function onUpdatePost(elapsed)
        setProperty('iconnameP1.x', getProperty('iconP1.x') + - 50) -- icon location X (firstIcon)
        setProperty('iconnameP1.angle', getProperty('iconP1.angle'))
        setProperty('iconnameP1.y', getProperty('iconP1.y') - 50) -- icon location Y (firstIcon)
        setProperty('iconnameP1.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (firstIcon)
        setProperty('iconnameP1.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (FirstIcon)

        setProperty('iconnameloseP1.x', getProperty('iconP1.x') + -50) -- icon location X (secondIcon)
        setProperty('iconnameloseP1.angle', getProperty('iconP1.angle'))
        setProperty('iconnameloseP1.y', getProperty('iconP1.y') - 50) -- icon location Y (secondIcon)
        setProperty('iconnameloseP1.scale.x', getProperty('iconP1.scale.x') - 0.06) -- icon size X (secondIcon)
        setProperty('iconnameloseP1.scale.y', getProperty('iconP1.scale.y') - 0.06) -- icon size Y (secondIcon)
end
