package menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import media.SoundManager;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Menu extends Sprite
	{
		public static const START_GAME : String = "startGame";
		
		private var startButton : StartButton = new StartButton();
		private var fullScreenButton : FullScreenButton = new FullScreenButton();
		
		private var displayHighscore : TextField = new TextField();
		private var displayName : TextField = new TextField();
		
		private var innerHighscore : SharedObject;
		
		
		public function Menu() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			innerHighscore = SharedObject.getLocal("Highscore");
			
			displayHighscore.defaultTextFormat = new TextFormat('Impact',20,0xFF9999);
			displayHighscore.selectable = false;
			
			if (innerHighscore.data) {
				if(innerHighscore.data.score > 0){ 
					displayHighscore.text = "CURRENT HIGHSCORE : " + innerHighscore.data.score;
				}else {
					displayHighscore.text = "CURRENT HIGHSCORE : NO HIGHSCORE YET!";
				}
			}
			
			displayName.defaultTextFormat = new TextFormat('Impact', 30, 0xFF0000);
			
			displayName.text = "MISSILE COMMAND RECREATED!";
			displayName.selectable = false;
			
			addEventListener(Button.BUTTON_FUNCTION, buttonPressed);
		}
		
		private function createBackground() :void {
			
			graphics.clear();
			graphics.beginFill(0x444444);
			graphics.drawRect(0,0,stage.stageWidth, stage.stageHeight);
			graphics.endFill();
			
			graphics.beginFill(0x1240AB);
			graphics.lineStyle(2, 0x000000);
			graphics.drawRect(0,0,stage.stageWidth, 100);
			graphics.drawRect(0,500,stage.stageWidth, 100);
			graphics.endFill();
			
		}
		
		private function buttonPressed(e:Event):void 
		{
			if(e.target == startButton){
				dispatchEvent(new Event(START_GAME, true));
			}else if(e.target == fullScreenButton){
				if(stage.displayState == StageDisplayState.NORMAL){
					stage.displayState = StageDisplayState.FULL_SCREEN; 
					stage.scaleMode = StageScaleMode.EXACT_FIT;
				}else { stage.displayState = StageDisplayState.NORMAL; }
			}
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			createBackground();
			
			SoundManager.playSound(SoundManager.MENU_BG_MUSIC);
			
			displayName.x = stage.stageWidth / 2 - displayName.width * 1.8;
			displayName.y = stage.stageHeight / 4.5;
			
			startButton.x = (stage.stageWidth / 2) - startButton.buttonWidth/2;
			startButton.y = (stage.stageHeight / 1.7) - startButton.buttonHeight;
			
			fullScreenButton.x = startButton.x;
			fullScreenButton.y = startButton.y + 70;
			
			displayHighscore.x = startButton.x - displayHighscore.width;
			displayHighscore.y = startButton.y - 100;
			
			displayHighscore.width = 800;
			displayName.width = 800;
			
			addChild(startButton);
			addChild(fullScreenButton);
			
			addChild(displayHighscore);
			addChild(displayName);
		}
		
	}

}