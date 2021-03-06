package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import menu.Menu
	import media.SoundManager;
	import world.WorldManager;
	import flash.display.LoaderInfo;
	import flash.display.StageScaleMode;
	
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Main extends Sprite 
	{
		public static const MENU : String = "menu";
		public static const GAME : String = "game";
		public static const ENDGAME : String = "endGame";
		
		private var loadingScreen : LoadingScreen = new LoadingScreen();
		private var menu : Menu = new Menu();
		private var game : Game = new Game();
		private var gameOver : GameOver = new GameOver();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			SoundManager.loadSounds();
			addEventListener(Event.ENTER_FRAME, checkSounds);
			
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			addEventListener(Menu.START_GAME, startGame);
			stage.addEventListener(WorldManager.GAME_OVER, endGame);
		}
		
		private function endGame(e:Event):void 
		{
			switchScene(MENU);
		}
		
		private function checkSounds(e:Event):void 
		{
			
			if (SoundManager.allSoundsLoaded) {
				if (contains(loadingScreen)) {
					removeChild(loadingScreen);
				}
				removeEventListener(Event.ENTER_FRAME,checkSounds);
				switchScene(MENU);
			}else if (!contains(loadingScreen)) {
				addChild(loadingScreen);
			}
		}
		
		private function startGame(e:Event):void 
		{
			switchScene(GAME);
		}
		
		public function switchScene(scene : String) : void {
			
			switch(scene) {
				case MENU:
					if (stage.contains(game)) {
						game.destroy();
						removeChild(game);
						game = null;
					}
					
					menu = new Menu()
					addChild(menu)
					break;
				case GAME:
					if (stage.contains(menu)) {
						removeChild(menu);
						menu = null;
					}else if (stage.contains(gameOver)) {
						removeChild(gameOver);
						gameOver = null;
					}
					trace(game);
					game = new Game();
					addChild(game);
					break;
			}
		}
	}
	
}