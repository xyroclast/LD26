package com.spacecowboysoftware.minimalism 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Jesse Abram
	 */
	public class Player extends FlxSprite
	{
		
		public function Player() 
		{
			loadGraphic(Graphics.WhitePixel);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.pressed("W"))
				velocity.y = -100;
			if (FlxG.keys.pressed("A"))
				velocity.x = -100;
			if (FlxG.keys.pressed("S"))
				velocity.y = 100;
			if (FlxG.keys.pressed("D"))
				velocity.x = 100;
			if ((!FlxG.keys.pressed("W") && !FlxG.keys.pressed("S")) ||(FlxG.keys.pressed("W") && FlxG.keys.pressed("S")))
				velocity.y = 0;
			if ((!FlxG.keys.pressed("A") && !FlxG.keys.pressed("D")) || (FlxG.keys.pressed("A") && FlxG.keys.pressed("D")))
				velocity.x = 0;
			if (x < 0)
				x = 0;
			if (x > 900 - 8)
				x = 900 - 8;
			if (y < 0)
				y = 0;
			if (y > 900 - 8)
				y = 900 - 8;
		}
		
	}

}