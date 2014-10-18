package menu 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Button extends Sprite
	{
		public static const BUTTON_FUNCTION : String = "buttonFunction"; 
		private var _buttonWidth : int = 120;
		private var _buttonHeight : int = 60;
		private var menuFormat : TextFormat = new TextFormat();
		private var buttonTextField : TextField = new TextField();
		
		public function Button(buttonText : String) {
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			menuFormat.size = 25;
			
			buttonTextField.width = buttonWidth / 2;
			buttonTextField.height = buttonHeight / 2;
			
			buttonTextField.defaultTextFormat = menuFormat;
			buttonTextField.text = buttonText;
			buttonTextField.selectable = false;
		}
		
		protected function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			buttonTextField.x = buttonWidth / 3.5;
			buttonTextField.y =	buttonHeight / 5;
			addChild(buttonTextField);
			
			this.addEventListener(MouseEvent.MOUSE_OUT, onIdle);
			this.addEventListener(MouseEvent.MOUSE_OVER, onHover);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}
		
		protected function onIdle(e:MouseEvent):void 
		{
			Mouse.cursor = "arrow";
		}
		
		protected function onHover(e:MouseEvent):void 
		{
			Mouse.cursor = "button";
		}
		protected function onClick(e:MouseEvent):void 
		{
			dispatchEvent(new Event(BUTTON_FUNCTION, true));
		}
		
		protected function idleDraw(buttonColor : uint, buttonTextColor : uint) :void {
			graphics.clear();
			graphics.lineStyle(2, 0x000000);
			graphics.beginFill(buttonColor, 1);
			graphics.drawRect(0, 0, buttonWidth, buttonHeight);
			graphics.endFill();
			
			buttonTextField.textColor = buttonTextColor;
			
		}
		
		protected function onHoverDraw(buttonColor : uint, buttonTextColor : uint):void {
			graphics.clear();
			graphics.lineStyle(2, 0xFF0011);
			graphics.beginFill(buttonColor, 1);
			graphics.drawRect(0, 0, buttonWidth, buttonHeight);
			graphics.endFill();
			
			buttonTextField.textColor = buttonTextColor;
			
		}
		
		public function get buttonWidth():int 
		{
			return _buttonWidth;
		}
		
		public function get buttonHeight():int 
		{
			return _buttonHeight;
		}
	}

}