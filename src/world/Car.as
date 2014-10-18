package world 
{
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Car extends MovingGroundObject
	{
		
		public function Car() 
		{
			_speed = 5;
		}
		override internal function drawObject():void 
		{
			graphics.beginFill(0xFF0000);
			graphics.drawRect(0, 2, 25, 8);
			graphics.drawRect(5, -4, 15, 6);
			graphics.endFill();
			
			graphics.beginFill(0x000000);
			graphics.drawCircle(5, 9, 4);
			graphics.drawCircle(20, 9, 4);
			graphics.endFill();
		}
	}

}