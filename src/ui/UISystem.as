package ui 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import towers.TowerManager;
	import weapons.EnemyMissile;
	import weapons.explosions.ExplosionManager;
	import weapons.Missile;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class UISystem extends Sprite 
	{
		//sundmanager met static functions maken
		private var _level : uint = 1;
		private var _score : int = 0; 
		private var _highscore : int;
		private var _cars : int;
		//ammo ui
		
		private var _uiStyle : TextFormat = new TextFormat();
		
		private var _carsLeftDisplay : TextField = new TextField();
		private var _scoreDisplay : TextField = new TextField();
		private var _levelDisplay : TextField = new TextField();
		private var _highscoreDisplay : TextField = new TextField();
		
		private var innerHighscore : SharedObject;
		
		public function UISystem(lives : int) 
		{
			innerHighscore = SharedObject.getLocal("Highscore");
			
			if (innerHighscore.data) {
				_highscore = innerHighscore.data.score;
			}
			
			_uiStyle.font = 'Impact';
			_uiStyle.size = 16;
			
			_scoreDisplay.defaultTextFormat = _uiStyle;
			_levelDisplay.defaultTextFormat = _uiStyle;
			_highscoreDisplay.defaultTextFormat = _uiStyle;
			_carsLeftDisplay.defaultTextFormat = _uiStyle;
			
			_highscoreDisplay.text = "HIGHSCORE : " + _highscore.toString();
			
			_cars = lives;
			
			_carsLeftDisplay.text = "CARS LEFT : " + _cars;
			
			_levelDisplay.y = 20;
			_highscoreDisplay.y = _levelDisplay.y + 30;
			_scoreDisplay.y = _highscoreDisplay.y + 30;
			_carsLeftDisplay.y = _scoreDisplay.y + 30;
			
			_levelDisplay.width = 500;
			_highscoreDisplay.width = 500;
			_scoreDisplay.width = 500;
			_carsLeftDisplay.width = 500;
			
			_levelDisplay.selectable = false;
			_highscoreDisplay.selectable = false;
			_scoreDisplay.selectable = false;
			_carsLeftDisplay.selectable = false;
			
			updateLevel();
			updateScore(0);
			
			addChild(_levelDisplay);
			addChild(_scoreDisplay);
			addChild(_highscoreDisplay);
			addChild(_carsLeftDisplay);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Missile.EXPLODE, destroyedRocket);
			stage.addEventListener(LevelSystem.NEXT_LEVEL, nextLevel);
			stage.addEventListener(TowerManager.REMOVE_CAR, destroyedCar);
		}
		
		private function destroyedCar(e:Event):void 
		{
			updateScore( -200);
			_cars --;
			_carsLeftDisplay.text = "CARS LEFT : " + _cars;
		}
		
		private function nextLevel(e:Event):void {
			_level ++;
			updateScore(_level * 150 + (50 * _cars));
			updateLevel();
		}
		
		private function destroyedRocket(e:Event):void {
			if (e.target is EnemyMissile) {
				updateScore(100);
			}
		}
		public function updateLevel() :void {
			
			_levelDisplay.text = "LEVEL : " + _level;
		}
		public function updateScore(score : int) :void {
			_score += score;
			_scoreDisplay.text = "SCORE : " + _score;
			
			if (_score > _highscore) {
				innerHighscore.data.score = _score;
				_highscore = innerHighscore.data.score;
				_highscoreDisplay.textColor = 0xFF9999;
				_highscoreDisplay.text = "HIGHSCORE : " + _highscore.toString();;
			}
			
		}
		
	}

}