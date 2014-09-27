package towers 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import weapons.MissileManager;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Tower extends Sprite
	{
		private var _ammo : int; 
		private var _destination : Point = new Point();
		public static const FIRE : String = "fire";
		
		internal function setPos(xPos : int, yPos : int) :void {
			
			x = xPos;
			y = yPos;
		}
		
		internal function drawTower() :void{		
		}
		
		internal function initTower() :void {
			//missileManager = new MissileManager(stage);
		}
		
		public function set ammo(value:int):void {
			
			_ammo = value;
		}
		
		public function get ammo():int {
			
			return _ammo;
		}
		
		public function get destination():Point {
			
			return _destination;
		}
		
		public function set destination(value:Point):void {
			
			_destination = value;
		}
		
		internal function fire(xDes : int, yDes : int) :void {
			ammo -= 1;
			_destination.x = xDes;
			_destination.y = yDes;
			dispatchEvent(new Event(FIRE, true));
			//missileFactory fire function	
		}
	}
}