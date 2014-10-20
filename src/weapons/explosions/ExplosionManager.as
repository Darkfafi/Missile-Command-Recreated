package weapons.explosions 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import media.SoundManager;
	import weapons.Missile;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class ExplosionManager extends Sprite
	{
		public static const ENEMY_HIT : String = "enemyHit";
		private var _stage : Stage;
		private var _allExplosions : Array = [];
		private var levelSystem : LevelSystem;
		
		public function ExplosionManager(_world : Stage, _levelSystem : LevelSystem) 
		{
			_stage = _world;
			levelSystem = _levelSystem;
			_stage.addEventListener(Missile.EXPLODE, explodeRocket);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function explodeRocket(e : Event):void {
			
			var target : Missile = e.target as Missile;
			var explosion : Explosion = new Explosion(0.2, 7);
			
			explosion.x = target.x;
			explosion.y = target.y;
			
			_stage.addChild(explosion);
			SoundManager.playSound(SoundManager.EXPLOSION);
			_allExplosions.push(explosion);
			_stage.removeChild(target);
		}
		
		public function update(e : Event) :void {
			var enemyRockets : Array = levelSystem.enemyRockets;
			var l : int = _allExplosions.length;
			
			for (var j : int = l - 1; j >= 0; j--) {
				if(_stage.contains(_allExplosions[j])){
					_allExplosions[j].update(e);
				}else {
					_allExplosions.splice(j, 1);
				}
				
				var lx : int = enemyRockets.length;
				for (var i : int = 0 ; i < lx; i++) {
					if(_allExplosions[j] != null && enemyRockets[i] != null){
						if (_allExplosions[j].hitTestObject(enemyRockets[i])) {
							
							enemyRockets[i].explode();
						}	
					}
				}
			}
		}
		public function destroy() :void {
			_stage.removeEventListener(Missile.EXPLODE, explodeRocket);
			removeEventListener(Event.ENTER_FRAME, update);
		}
	}

}