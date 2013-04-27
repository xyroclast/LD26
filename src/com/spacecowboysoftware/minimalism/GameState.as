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
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			FlxG.mouse.show();
			testText = new FlxText(0, 0, FlxG.width, "Minimalism");
			testText.alignment = "center";
			testText.size = 64;
			add(testText);
			player = new Player();
			player.x = FlxG.width / 2 + 4;
			player.y = FlxG.height / 2 + 4;
			add(player);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}