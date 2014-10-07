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
		
		private var _stage : Stage;
		
		public function MissileManager(world : Stage):void {
			
			_stage = world
			
			_stage.addEventListener(Tower.FIRE, createMissile);
			addEventListener(Event.ENTER_FRAME, update);
		}
		public function update(e : Event):void {
			
			var l : int = _allMissiles.length;
			
			for (var i : int = l - 1; i >= 0; i--) {
				if (_stage.contains(_allMissiles[i])) {
					_allMissiles[i].update(e);
				}else {
					_allMissiles.splice(i, 1);
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