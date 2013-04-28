package com.spacecowboysoftware.minimalism 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jesse Abram
	 */
	public class GameState extends FlxState
	{
		private var testText:FlxText;
		private var text2:FlxText;
		private var player:Player;
		private var backgroundSprite:FlxSprite;
		private var stabCount:uint = 0;
		private var leftEar:Boolean = false;
		private var rightEar:Boolean = false;
		private var bloodSprite:FlxSprite;
		private var blackSprite:FlxSprite;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			backgroundSprite = new FlxSprite(0, 0);
			backgroundSprite.loadGraphic(Graphics.Background, true, false, 900, 900);
			backgroundSprite.addAnimation("Cycle", [0, 1, 2,0,1,2,0,1,2,0,1,2,0,1,2,3,3,0, 1, 2,0,1,2,0,1,2,0,1,2,0,1,2,4,4], 10, true);
			add(backgroundSprite);
			backgroundSprite.play("Cycle");
			testText = new FlxText(0, 0, FlxG.width, "Departing of the Sensory");
			testText.alignment = "center";
			testText.size = 64;
			testText.color = 0x000000;
			add(testText);
			text2 = new FlxText(0, 175, FlxG.width, "By Jesse Abram");
			text2.alignment = "center";
			text2.size = 16;
			text2.color = 0x000000;
			add(text2);
			player = new Player();
			player.x = FlxG.width / 2 + 4;
			player.y = FlxG.height / 2 + 4;
			//add(player);
			FlxG.playMusic(Sounds.Minimalism);
			bloodSprite = new FlxSprite(0, 0, Graphics.Blood);
			blackSprite = new FlxSprite(0, 0, Graphics.Black);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("Q"))
			{
				stabEye();
			}
			if (FlxG.keys.justPressed("W"))
			{
				stabLeftEar();
			}
			if (FlxG.keys.justPressed("E"))
			{
				stabRightEar();
			}
		}
		
		public function stabLeftEar():void
		{
			if (!leftEar)
			{
				var tempPan:int = FlxG.music._transform.pan;
				FlxG.music._transform.pan = -1;
				FlxG.play(Sounds.Stab);
				FlxG.music._transform.pan = tempPan;
			}
			if (rightEar == true)
			{
				FlxG.music.stop();
			}
			else
			{
				FlxG.music._transform.pan = 1;
			}
			leftEar = true;
		}
		
		public function stabRightEar():void
		{
			if (!rightEar)
			{
				var tempPan:int = FlxG.music._transform.pan;
				FlxG.music._transform.pan = 1;
				FlxG.play(Sounds.Stab);
				FlxG.music._transform.pan = tempPan;
			}
			if (leftEar == true)
			{
				FlxG.music.stop();
			}
			else
			{
				FlxG.music._transform.pan = -1;
			}
			rightEar = true;
		}
		
		public function stabEye():void
		{
			if (stabCount == 0)
			{
				add(bloodSprite);
				FlxG.music._transform.pan = -1;
			}
			else if (stabCount == 1)
			{
				add(blackSprite);
				FlxG.music._transform.pan = 1;
			}
			stabCount++;
		}
		
	}

}