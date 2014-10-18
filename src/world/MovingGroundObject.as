package world 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import weapons.explosions.Explosion;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class MovingGroundObject extends Sprite
	{
		protected var _speed : int;
		private var dir : int = 1;
		
		public function MovingGroundObject() 
		{
			
		}
		
		internal function drawObject() : void {
			
		}
		
		internal function update(e : Event) :void {
			
			movement();
		}
		
		protected function movement():void {
			
			this.x += (_speed * dir);
			
			if (this.x >= stage.stageWidth) {
				dir = -1;
				this.rotationX = dir;
			}else if(this.x <= 0) {
				dir = 1;
				this.rotationX = dir;
			}
		}
		
	}

}