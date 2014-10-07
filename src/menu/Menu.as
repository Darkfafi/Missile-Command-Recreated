package menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Menu extends Sprite
	{
		private var startButton : StartButton = new StartButton();
		
		public function Menu() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			startButton.x = stage.stageWidth / 2 - startButton.width;
			startButton.y = stage.stageHeight / 2 - startButton.height;
			addChild(startButton);
			
		}
		
	}

}