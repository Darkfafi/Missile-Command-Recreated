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
		//public static const CREATE_NEW_TOWERS : String = "createNewTowers";
		
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
			_stage.addEventListener(Missile.EXPLODE, removeTarget); // <--- maakt dat de enemyrockets verwijdert worden. Fix het!
			setTimeout(playLevel, 5000);
		}
		
		private function removeTarget(e:Event):void {
			if(e.target == EnemyMissile){
				var index : int = _allEnemyMissiles.indexOf(e.target as EnemyMissile);
				_allEnemyMissiles.splice(index, 1);
			}
		}
		
		private function update(e : Event):void {
			
			var l : int = _allEnemyMissiles.length;
			
			for (var i : int = l - 1; i >= 0; i--) {
				
				if(_stage.contains(_allEnemyMissiles[i])){
					_allEnemyMissiles[i].update(e);
				}else {
					_allEnemyMissiles.splice(i, 1);
				}
			}
			
			if (_allEnemyMissiles.length == 0 && _missilesMade >= _maxMissiles) {
				endLevel();
			}
			//trace(_allEnemyMissiles.length);
		}
		
		public function playLevel():void {
			addEventListener(Event.ENTER_FRAME, update);
			_maxMissiles = 12 * (_level / 2);
			trace(_maxMissiles);
			createEnemyMissles(_maxMissiles / _level);
			
		}
		public function endLevel() :void {
			
			removeEventListener(Event.ENTER_FRAME, update);
			_missilesMade = 0;
			_level ++;
			setTimeout(playLevel, 3500);
			_towerManager.rebuildTowers();
		}
		
		public function get enemyRockets() : Array {
			
			return _allEnemyMissiles;
		}
		
		private function createEnemyMissles(amount : int) :void {
			
			var allTowers : Array = [];
			allTowers = _towerManager.giveTowers();
			
			for (var i : uint = 0; i < amount; i++) {
				
				var missileFactory : MissileFactory = new MissileFactory();
				var target : Tower = allTowers[Math.floor(allTowers.length * Math.random())];
				var destination : Point = new Point(target.x, target.y); // error omdat als alle towers dood zijn hoor je game over te zij en niet nieuwe missiels te maken.
				var xPos : int =  _stage.stageWidth * Math.random();
				
				var enemyMissile : EnemyMissile =  missileFactory.addMissile(MissileFactory.ENEMY_MISSILE, _stage, xPos, 0, destination, 1 + ((_level/2) * 0.5)) as EnemyMissile;
				enemyMissile.target = target;
				_allEnemyMissiles.push(enemyMissile);
				_missilesMade ++;
			}
			
			if (_missilesMade < _maxMissiles) {
				
				setTimeout(createEnemyMissles, 3000 + (200 * _level),_maxMissiles / _level);
			}
		}
	}

}