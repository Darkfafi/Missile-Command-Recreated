package ui 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import towers.TowerManager;
	import weapons.explosions.ExplosionManager;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class UISystem extends Sprite 
	{
		//sundmanager met static functions maken
		private var _level : int = 1; //<--- will be set acording to other data
		private var _score : uint = 0; 
		//ammo ui
		
		private var _uiStyle : TextFormat = new TextFormat();
		
		private var _scoreDisplay : TextField = new TextField();
		private var _levelDisplay : TextField = new TextField();
		
		public function UISystem(towersMan : TowerManager,scoreMan  : ExplosionManager, levelMan : LevelSystem) 
		{
			_scoreDisplay.setTextFormat(_uiStyle);
			_levelDisplay.setTextFormat(_uiStyle);
			
			_levelDisplay.y = 20;
			_scoreDisplay.y = _levelDisplay.y + 30;
			
			updateLevel();
			updateScore(0);
			
			addChild(_levelDisplay);
			addChild(_scoreDisplay);
		}
		public function updateLevel() :void {
			_levelDisplay.text = "Level : " + _level;
		}
		public function updateScore(score : uint) :void {
			_score += score;
			_scoreDisplay.text = "Score : " + _score;
		}
		
	}

}