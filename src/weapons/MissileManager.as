package weapons 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import towers.Tower;
	import weapons.explosions.Explosion;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class MissileManager extends Sprite
	{
		private var _allMissiles : Array = [];
		private var _allExplosions : Array = [];
		
		private var _stage : Stage;
		
		public function MissileManager(world : Stage):void {
			
			_stage = world;
			_stage.addEventListener(Tower.FIRE, createMissile);
			_stage.addEventListener(Missile.EXPLODE, explodeRocket);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function explodeRocket(e:Event):void {
			
			var target : Missile = e.target as Missile;
			var explosion : Explosion = new Explosion(0.2, 7);
			
			explosion.x = target.x;
			explosion.y = target.y;
			
			_stage.addChild(explosion);
			_allExplosions.push(explosion);
		}
		
		public function update(e : Event):void {
			
			var lm : int = _allMissiles.length;
			var le : int = _allExplosions.length;
			
			for (var i : int = 0; i < lm; i++) {
				if (_allMissiles[i] == null) {
					_allMissiles.splice(i, 1);
				}
				if (_stage.contains(_allMissiles[i])) {
					_allMissiles[i].update(e);
				}
			}
			
			for (var j : int = 0; j < le; j++) {
				if (_allExplosions[j] == null) {
					_allExplosions.splice(i, 1);
				}
				if(_stage.contains(_allExplosions[j])){
					_allExplosions[j].update(e);
				}
			}
		}
		
		public function createMissile(e:Event):void {
			
			var missileFactory : MissileFactory = new MissileFactory();
			var missile : Missile = missileFactory.addMissile(MissileFactory.BASIC_MISSILE, _stage, e.target.x, e.target.y, e.target.destination, 15);
			_allMissiles.push(missile);
		}
		
	}

}