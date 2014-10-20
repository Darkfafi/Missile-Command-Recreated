package towers 
{
	import flash.events.MouseEvent;
	import utils.Vector2D;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class BasicTower extends Tower 
	{
		private var mousePosition : Vector2D = new Vector2D();
		
		override internal function drawTower() :void {
			
			super.drawTower();
			
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, -5, 30, 10);
			graphics.endFill();
		}
		
		override internal function initTower() :void {
			super.initTower();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, movement);
			ammo = 15;
		}
		
		protected function movement(e : MouseEvent) :void	{
			
			this.rotation = 0;
			mousePosition.x = this.mouseX;
			mousePosition.y = this.mouseY;
			this.rotation = mousePosition.angle * 180 / Math.PI;
		}
		
		override internal function fire(xDes : int, yDes : int):void {
			super.fire(xDes, yDes);
		}
		
	}

}