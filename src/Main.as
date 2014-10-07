package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import menu.Menu
	
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Main extends Sprite 
	{
		public static const MENU : String = "menu";
		public static const GAME : String = "game";
		public static const ENDGAME : String = "endGame";
		
		private var menu : Menu = new Menu();
		private var game : Game = new Game();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			switchScene(MENU);
			//addChild(game);
		}
		
		private function switchScene(scene : String) : void {
			
			switch(scene) {
				case MENU:
					if (stage.contains(game)){
						removeChild(game);
						game = null;
					}		//else if contains endscreen
					menu = new Menu()
					addChild(menu)
					break;
				case GAME:
					if (stage.contains(menu)) {
						removeChild(menu)
						menu = null
					}
					game = new Game();
					addChild(game);
					break;
			}
		}
		
	}
	
}