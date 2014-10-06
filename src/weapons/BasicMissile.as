package weapons 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class BasicMissile extends Missile
	{
		//bij enemy is het enemyBasicMissile
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
			
			if (this.y <= destination.y) {
				explode();
			}
		}
	}

}