package weapons 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Missile extends Sprite
	{
		internal var speed : Number;
		internal var movement : Point = new Point();
		internal var destination : Point = new Point();
		public static const EXPLODE : String = "explode";
		
		internal function drawMissile(color : uint) :void {
			
			
		}
		internal function armMissile(_speed : Number,_rotation : Number, _destination : Point) :void {
			
			speed = _speed
			
			destination.x = _destination.x;
			destination.y = _destination.y;
			
			movement.x = Math.cos(_rotation / 180 * Math.PI);
			movement.y = Math.sin(_rotation / 180 * Math.PI);
			
		}
		internal function setPos(_xPos : int, _yPos : int, _rot : Number) :void {
			
			x = _xPos;
			y = _yPos;
			rotation = _rot;
		}
		internal function update(e : Event) :void {
			this.x += movement.x * speed;
			this.y += movement.y * speed;
		}
		
		internal function explode() :void {
			
			dispatchEvent(new Event(EXPLODE, true));
		}
	}

}