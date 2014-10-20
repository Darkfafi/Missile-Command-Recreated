package menu 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class StartButton extends Button 
	{
		
		public function StartButton() 
		{
			super("Start");
		}
		override protected function init(e:Event):void 
		{
			super.init(e);
			onIdle(null);
		}
		override protected function onIdle(e:MouseEvent):void 
		{
			super.onIdle(e);
			idleDraw(0x1250AC, 0xFFFFFF);
		}
		override protected function onHover(e:MouseEvent):void 
		{
			super.onHover(e);
			onHoverDraw(0x111177, 0xFF0000);
		}
	}
}