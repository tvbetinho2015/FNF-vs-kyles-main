package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['The Void Team'],
			['Tv Betinho',		'tvbetinho',		'Owner, Main Artist, Programmer, Charter and Writer',						'https://twitter.com/tvbetinho',			'0088FF'],
			['Ruiza Yura',		'ruiza',			'Director, Composer and Background Artist\nOriginal composer of Femity',							'https://twitter.com/ry_ruiza',			'9C1C2C'],
			['AYOP MODS OFC',	'ayop',				'Founder of Void Team',												'https://www.youtube.com/c/KingOfTheMods_Othername',		'7BF965'],
			['Animou',			'gotas',			'Cutscene Animator',						'https://www.tiktok.com/@animuou',			'c7f2ff'],
			['Luck G4mes',		'luckgames',		'Animator of Eyz And Kamy',											'https://twitter.com/Luck_G4mes',							'4F4AFF'],
			['AL3Xo',			'al3xo',			'Composer of Cosmic Void and Eyzgonal\nCreator of Eyzgonal',								'https://www.youtube.com/user/mariovieiraneto1', 		'300663'],
			['Um Minuto Restante',		'vyc7or',	'Composer of Comic\nMade a Strings Cover',												'https://www.youtube.com/channel/UC-gy3N1uVKFzVLTj-NGp40Q',		'FFFFFF'],
			['Ninja Espacial',	'annon',			'Remixer of Comic Void',											'https://www.youtube.com/channel/UC93yfLklEwNHEsJHo2v1inA',			'EBDBD3'],
			['Gab',				'gab',				'Remixer of Clouds and Femity',															'https://gamejolt.com/@GabNaab',			'1CA43F'],
			['S4DDE',			's4dde',			'Charter and Coder',											'https://twitter.com/s4ddeeee',				'383838'],
			['ButterCup',							'linnk',		'Kylespark OG idea\n and co-Writer of Main Story Mode',							'https://www.youtube.com/channel/UCCbmjTI0f4VaR4wwP_4VmyQ',					'8e4461'],
			['Fen Nix',			'bruno',									'Remixer of Cosmic Void',		'https://twitter.com/fennix07',														'B64C2E'],
			['Murilo Funkin', 	'murilo',						'Charter of Femity Legacy',						'https://www.youtube.com/channel/UCB4QjT0_IQSvA_YwFDBIHNA',		'227525'],
			['Saki',			'saki',			'Artist of Kyles\' in Trapping',						'https://www.youtube.com/@voidteamfunkin',				'63c5f2'],
			['IGUHz',			'iguhz',		'Charter of Eyzgonal',									'https://www.youtube.com/channel/UCFQfB-AkMTR5t539bE-5LBg',		'383838'],
			['Void Team Server',	'discord',		'The Public Server',												'https://discord.gg/wfUQxCY4',				'5068F0'],
			[''],
			['Former Members of Void Team'],
			['Namu Animations',				 'namu',				'Animator of Kylespark Character',								'https://twitter.com/NamuAnimations',		'99CCFF'],
			['Samuel Developer',					'samueldev',	'The former Programer of VS. Kylespark demo 1 and 2',	'https://gamebanana.com/members/1967438',									'4681EB'],
			['Garcello Gamer 123',					'garcellogamer',	'The original composer of Clouds',					'https://twitter.com/Lucas1Gabriel9',										'DBE6E8'],
			[''],
			['The mod Contributors'],
			['Applk Clips',		'ace',				'Background Artist',												'https://twitter.com/ApplkClips', 			'0CA61B'],
			['Nikki',			'nikki',			'Loading screen Artist',											'https://www.instagram.com/nikki_0w0_',		'FB4444'],
			['Pettit Cherry',	'cherry',			'3D Model of Eyzgonal',												'https://www.instagram.com/petit_cherrey2',		'FF0434'],
			['Patopunk 77',		'patopunk',			'composer of Best Trio',					'https://www.youtube.com/channel/UCxKjqPWMH0pWvxqfOr7NyJA',				'8e4461'],
			['GB',				'gb',				'Charter of Trapping',						'https://www.youtube.com/channel/UC9RDitaALIreYHD43Xp3DFg',					'ffffff'],
			[''],
			['Honorable mention'],
			['Savestate Corrupted',		'savestate',	'Original Composer Of \'Strings\' from "FUNKIN\' AT THE THEATER"',		'https://gamebanana.com/members/1914394',		'D46F12'],
			[''],
			['The Vazio Cosmico Members'],
			['Vazio Cósmico',		'cosmicvoid',		'Listen to the Podcast (Only in Portuguese)',											'https://www.youtube.com/channel/UCx2W7nd1s0vaM4ICqhridPQ',		'FFFFFF'],
			['KylesPark',		'kylespark1',		'THE MAIN INSPIRATION',											'https://twitter.com/kyles_park',		'FFFFFF'],
			['Gravetto',		'gravetto',			'LEADER OF VAZIO COSMICO',										'https://twitter.com/Gravettojpg',	'2A59B1'],
			['Eyz',				'eyz',				'The Good Guy',													'https://twitter.com/eyyzu',	'FBF6DA'],
			['Nuub',			'nuub',				'A Digimon Fan',												'https://twitter.com/Noob_ardilozuh', 'C52222'],
			['L0gout',			'log',				'"Triangle"',													'https://twitter.com/micaell616', '2D2D2D'],
			['Caio Felipe',		'caiolip',			'IDK what does this guy do...',									'https://twitter.com/ocaiolip', 'C900FF'],
			['Aquele Cometa',	'cometazz',			'that lazy!',													'https://twitter.com/CometaZzzZ', '653283'],
			['Emy Tea',			'kamy',				'the feminist',													'https://twitter.com/emy_teaa', '0ae006'],
			['Sofia Lima',		'sofialima',		'Resident of "Puta que pariu"',									'https://twitter.com/SofiaLimae', 'DE2EFB'],
			[''],
			['Psych Engine Team'],
			['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',								'https://twitter.com/Shadow_Mario_',	'444444'],
			['RiverOaken',			'river',			'Main Artist/Animator of Psych Engine',							'https://twitter.com/RiverOaken',		'B42F71'],
			['shubs',				'shubs',			'Additional Programmer of Psych Engine',						'https://twitter.com/yoshubs',			'5E99DF'],
			[''],
			['Former Engine Members'],
			['bb-panzu',			'bb',				'Ex-Programmer of Psych Engine',								'https://twitter.com/bbsub3',			'3E813A'],
			[''],
			['Engine Contributors'],
			['iFlicky',				'flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',		'https://twitter.com/flicky_i',			'9E29CF'],
			['SqirraRNG',			'sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform',	'https://twitter.com/gedehari',			'E1843A'],
			['EliteMasterEric',		'mastereric',		'Runtime Shaders support',										'https://twitter.com/EliteMasterEric',	'FFBD40'],
			['PolybiusProxy',		'proxy',			'.MP4 Video Loader Library (hxCodec)',							'https://twitter.com/polybiusproxy',	'DCD294'],
			['KadeDev',				'kade',				'Fixed some cool stuff on Chart Editor\nand other PRs',			'https://twitter.com/kade0912',			'64A250'],
			['Keoiki',				'keoiki',			'Note Splash Animations',										'https://twitter.com/Keoiki_',			'D2D2D2'],
			['Nebula the Zorua',	'nebula',			'LUA JIT Fork and some Lua reworks',							'https://twitter.com/Nebula_Zorua',		'7D40B2'],
			['Smokey',				'smokey',			'Sprite Atlas Support',											'https://twitter.com/Smokey_5_',		'483D92'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",							'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",								'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",								'https://twitter.com/evilsk8r',			'5ABD4B'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",								'https://twitter.com/kawaisprite',		'378FC7']
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}