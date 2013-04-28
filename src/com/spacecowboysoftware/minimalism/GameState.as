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
		private var player:Player;
		private var backgroundSprite:FlxSprite;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			FlxG.mouse.show();
			backgroundSprite = new FlxSprite(0, 0, Graphics.Background);
			add(backgroundSprite);
			testText = new FlxText(0, 0, FlxG.width, "Departing of the Sensory");
			testText.alignment = "center";
			testText.size = 64;
			testText.color = 0x000000;
			add(testText);
			player = new Player();
			player.x = FlxG.width / 2 + 4;
			player.y = FlxG.height / 2 + 4;
			//add(player);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}