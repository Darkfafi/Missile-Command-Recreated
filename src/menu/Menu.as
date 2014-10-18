package menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	import media.SoundManager;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Menu extends Sprite
	{
		public static const START_GAME : String = "startGame";
		
		private var startButton : StartButton = new StartButton();
		
		public function Menu() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Button.BUTTON_FUNCTION, buttonPressed);
		}
		
		private function createBackground() :void {
			
			graphics.clear();
			graphics.beginFill(0x024050);
			graphics.drawRect(0,0,stage.stageWidth, stage.stageHeight);
			graphics.endFill();
		}
		
		private function buttonPressed(e:Event):void 
		{
			if(e.target == startButton){
				dispatchEvent(new Event(START_GAME, true));
			}
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			createBackground();
			SoundManager.playSound(SoundManager.MENU_BG_MUSIC);
			startButton.x = (stage.stageWidth / 2) - startButton.buttonWidth/2;
			startButton.y = (stage.stageHeight / 1.8) - startButton.buttonHeight;
			addChild(startButton);
			
		}
		
	}

}