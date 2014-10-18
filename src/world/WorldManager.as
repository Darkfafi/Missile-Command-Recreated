package world 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import weapons.explosions.Explosion;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class WorldManager extends Sprite
	{
		private var _stage : Stage;
		private var worldObjects : Array = [];
		
		
		public function WorldManager(world : Stage) 
		{
			_stage = world;
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		
		public function update(e : Event) :void {
			
			worldHitTest();
		}
		
		public function createObjects(amount : uint) :void {
			for (var i :int = 0; i < amount; i++) {
				var worldObjFactory : WorldObjectsFactory = new WorldObjectsFactory();
				
				var obj : MovingGroundObject = worldObjFactory.addGroundObject(WorldObjectsFactory.CAR_TYPE, _stage);
				
				worldObjects.push(obj);
			}
			
		}
		
		private function worldHitTest() :void {
			for (var i : int = 0; i < _stage.numChildren; i++){
				if(_stage.getChildAt(i) is Explosion){
					var explosion : DisplayObject = _stage.getChildAt(i);
					for (var j : int = 0; j < worldObjects.length; j++){
						if (worldObjects[j].hitTestObject(explosion)) {
							stage.removeChild(worldObjects[j]);
							worldObjects.splice(j, 1);
						}
					}
				}
			}
		}
	}

}