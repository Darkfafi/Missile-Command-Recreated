package world 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import towers.TowerManager;
	import weapons.EnemyMissile;
	import weapons.explosions.Explosion;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class WorldManager extends Sprite
	{
		public static const GAME_OVER : String = "gameOver";
		
		private var _stage : Stage;
		private var worldObjects : Array = [];
		
		
		public function WorldManager(world : Stage) 
		{
			_stage = world;
			addEventListener(Event.ENTER_FRAME, update);
			_stage.addEventListener(TowerManager.REMOVE_CAR, removeCar);
		}
		
		private function removeCar(e:Event):void 
		{
			if(worldObjects.length > 0){
				_stage.removeChild(worldObjects[0]);
				worldObjects.splice(0, 1);
			}
			
			if (worldObjects.length <= 0) {
				_stage.dispatchEvent(new Event(GAME_OVER,true));
			}
		}
		
		
		public function update(e : Event) :void {
			var l : int = worldObjects.length;
			for (var i : int = 0; i < l; i++) {
				worldObjects[i].update(e);
			}
		}
		
		public function createObjects(amount : uint) :void {
			for (var i :int = 0; i < amount; i++) {
				var worldObjFactory : WorldObjectsFactory = new WorldObjectsFactory();
				
				var obj : MovingGroundObject = worldObjFactory.addGroundObject(WorldObjectsFactory.CAR_TYPE, _stage);
				
				worldObjects.push(obj);
			}
		}
		public function destroy() :void {
			removeEventListener(Event.ENTER_FRAME, update);
			_stage.removeEventListener(TowerManager.REMOVE_CAR, removeCar);
		}
	}
}