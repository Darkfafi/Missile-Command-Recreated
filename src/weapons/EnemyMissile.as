package weapons 
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class EnemyMissile extends Missile
	{
		public static const REMOVE_TARGET : String = "removeTarget";
		private var _target : DisplayObject;
		
		override internal function drawMissile(color : uint):void 
		{
			graphics.beginFill(0x000000, 1);
			graphics.drawCircle(20, 0, 2);
			graphics.endFill();
			
			graphics.beginFill(color, 1);
			graphics.drawRect(0, -2, 20, 4);
			graphics.endFill();
		}
		
		override public function update(e : Event) :void {
			super.update(e);
			
			if (this.y >= destination.y) {
				
				removeTarget();
				explode();
			}
		}
		
		private function removeTarget():void 
		{
			dispatchEvent(new Event(REMOVE_TARGET,true));
		}
		
		public function set target(value:DisplayObject):void {
			
			_target = value;
		}
		
		public function get target():DisplayObject {
			
			return _target;
		}
		
	}

}