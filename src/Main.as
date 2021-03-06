package 
{
	import flash.events.Event;
	import org.flixel.*;
	import com.spacecowboysoftware.minimalism.*;
	
	/**
	 * ...
	 * @author Jesse Abram
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(900, 900, GameState, 1);
			FlxG.worldBounds = new FlxRect(0, 0, 900, 900);
			
		}
		
		override protected function create(FlashEvent:Event):void
		{
			super.create(FlashEvent);
			stage.removeEventListener(Event.DEACTIVATE, onFocusLost);
			stage.removeEventListener(Event.DEACTIVATE, onFocus);
		}
		
	}
	
}