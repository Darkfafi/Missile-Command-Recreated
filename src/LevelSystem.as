package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import towers.Tower;
	import towers.TowerManager;
	import weapons.Missile;
	import weapons.MissileFactory;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class LevelSystem extends Sprite
	{
		private var _stage : Stage;
		private var _towerManager : TowerManager;
		private var _level : int = 1;
		private var _missilesMade : int;
		private var _maxMissiles : int;
		private var _allEnemyMissiles : Array = [];
		
		public function LevelSystem(world : Stage,towerManager : TowerManager) 
		{
			_stage = world;
			_towerManager = towerManager;
			addEventListener(Event.ENTER_FRAME, update);
			setTimeout(playLevel, 5000);
		}
		
		private function update(e : Event):void {
			
			var l : int = _allEnemyMissiles.length;
			
			for (var i : uint = 0; i < l; i++) {
				if (_allEnemyMissiles[i] == null) {
					_allEnemyMissiles.splice(i, 1);
				}
				if(_stage.contains(_allEnemyMissiles[i])){
					_allEnemyMissiles[i].update(e);
				}
			}
		}
		
		public function playLevel():void {
			
			_maxMissiles = 12 * (_level / 2);
			trace(_maxMissiles);
			createEnemyMissles(_maxMissiles / _level);
			
		}
		public function endLevel() :void {
			//if(allrockets = < 0) {level ++ && playLevel} <--- aantekening
			_level ++;
			playLevel();
		}
		
		private function createEnemyMissles(amount : int) :void {
			trace(amount);
			var allTowers : Array = [];
			allTowers = _towerManager.giveTowers();
			
			for (var i : uint = 0; i < amount; i++) {
				
				var missileFactory : MissileFactory = new MissileFactory();
				var target : Tower = allTowers[Math.floor(allTowers.length * Math.random())];
				var destination : Point = new Point(target.x, target.y);
				var xPos : int =  _stage.stageWidth * Math.random();
				
				var enemyMissile : Missile =  missileFactory.addMissile(MissileFactory.ENEMY_MISSILE, _stage, xPos, 0, destination, (_level)* 10.5);
				_allEnemyMissiles.push(enemyMissile);
			}
		}
	}

}