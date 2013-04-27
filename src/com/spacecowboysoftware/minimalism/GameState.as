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
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			FlxG.mouse.show();
			testText = new FlxText(0, 0, FlxG.width, "Hello, World!");
			add(testText);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}