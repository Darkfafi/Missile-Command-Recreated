package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import towers.Tower;
	import towers.TowerManager;
	import weapons.EnemyMissile;
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
			_stage.addEventListener(Missile.EXPLODE, removeTarget);
			setTimeout(playLevel, 5000);
		}
		
		private function removeTarget(e:Event):void {
			var index : int = _allEnemyMissiles.indexOf(e.target as EnemyMissile);
			_allEnemyMissiles.splice(index, 1);
			
		}
		
		private function update(e : Event):void {
			
			var l : int = _allEnemyMissiles.length;
			
			for (var i : int = l - 1; i >= 0; i--) {
				
				if(_stage.contains(_allEnemyMissiles[i])){
					_allEnemyMissiles[i].update(e);
				}
			}
			
			if (_allEnemyMissiles.length == 0 && _missilesMade >= _maxMissiles) {
				endLevel();
			}
		}
		
		public function playLevel():void {
			removeEventListener(Event.ENTER_FRAME, update);
			addEventListener(Event.ENTER_FRAME, update);
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
			
			var allTowers : Array = [];
			allTowers = _towerManager.giveTowers();
			
			for (var i : uint = 0; i < amount; i++) {
				
				var missileFactory : MissileFactory = new MissileFactory();
				var target : Tower = allTowers[Math.floor(allTowers.length * Math.random())];
				var destination : Point = new Point(target.x, target.y); // error omdat als alle towers dood zijn hoor je game over te zij en niet nieuwe missiels te maken.
				var xPos : int =  _stage.stageWidth * Math.random();
				
				var enemyMissile : EnemyMissile =  missileFactory.addMissile(MissileFactory.ENEMY_MISSILE, _stage, xPos, 0, destination, (_level) * 0.5) as EnemyMissile;
				enemyMissile.target = target;
				_allEnemyMissiles.push(enemyMissile);
				_missilesMade ++;
			}
			if (_missilesMade < _maxMissiles) {
				
				setTimeout(createEnemyMissles, 2000,_maxMissiles / _level);
			}
		}
	}

}