package weapons.explosions 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ....0
	 * @author Ramses di Perna
	 */
	public class Explosion extends Sprite
	{
		private var maxSizeReached : Boolean = false;
		private var speed : Number = new Number();
		private var maxSize : Number = new Number();
		
		public static const REMOVE : String = "remove";
		
		public function Explosion(_speed : Number, _maxSize : Number,_beginSize : Number = 5) 
		{
			graphics.beginFill(0xff4500);
			graphics.drawCircle(0, 0, _beginSize);
			graphics.endFill();
			
			speed = _speed;
			maxSize = _maxSize;
			
		}
		
		public function update(e : Event) :void {
			
			animate();
		}
		
		private function animate():void 
		{
			if(maxSizeReached == false){
				this.scaleX += speed;
				this.scaleY += speed;
			}
				
			else {
				this.scaleX -= speed;
				this.scaleY -= speed;
			}
			if(this.scaleX >= maxSize) { // <-- max grote van de explosie
				this.maxSizeReached = true;
			}
			if (this.scaleX < 0) {
				stage.removeChild(this);
			}
		}
		
	}

}