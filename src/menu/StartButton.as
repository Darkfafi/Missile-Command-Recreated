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
			idleDraw(0xff7700, 0x000000);
		}
		override protected function onIdle(e:MouseEvent):void 
		{
			super.onIdle(e);
			idleDraw(0xff7700, 0x000000);
		}
		override protected function onHover(e:MouseEvent):void 
		{
			super.onHover(e);
			onHoverDraw(0x111177, 0xFFFFFF);
		}
		
		override protected function onClick(e:MouseEvent):void 
		{
			super.onClick(e);
			onClickDraw();
		}
		
	}

}