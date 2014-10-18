package world 
{
	import flash.display.Stage;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class WorldObjectsFactory 
	{
		public static const CAR_TYPE : String = "carType";
		
		public function addGroundObject(objectType : String, container : Stage) : MovingGroundObject {
			
			var object : MovingGroundObject = this.createObject(objectType);
			
			object.drawObject();
			object.x = container.stageWidth * Math.random();
			object.y = container.stageHeight - (20 + 2 * Math.random());
			
			container.addChild(object);
			
			return object;
		}
		
		private function createObject(objectType : String) : MovingGroundObject {
			
			switch(objectType) {
				
				case CAR_TYPE:
				return new Car();
				break;
				
				
				default:
				throw new Error("Not a legit Object my man <3");
				return null;
			}
		}
	}

}