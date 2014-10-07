package weapons.explosions 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import weapons.Missile;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class ExplosionManager extends Sprite
	{
		private var _stage : Stage;
		private var _allExplosions : Array = [];
		
		public function ExplosionManager(world : Stage) 
		{
			_stage = world;
			_stage.addEventListener(Missile.EXPLODE, explodeRocket);
		}
		
		private function explodeRocket(e : Event):void {
			
			var target : Missile = e.target as Missile;
			var explosion : Explosion = new Explosion(0.2, 7);
			
			explosion.x = target.x;
			explosion.y = target.y;
			
			_stage.addChild(explosion);
			_allExplosions.push(explosion);
		}
		public function update(e : Event) :void {
			
			var l : int = _allExplosions.length;
			for (var j : int = l - 1; j >= 0; j--) {
				if(_stage.contains(_allExplosions[j])){
					_allExplosions[j].update(e);
				}else {
					_allExplosions.splice(j, 1);
					trace(_allExplosions.length);
				}
			}
		}
	}

}