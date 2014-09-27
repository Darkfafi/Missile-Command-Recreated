package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import towers.Tower;
	import towers.TowerFactory;
	import towers.TowerManager;
	import weapons.MissileManager;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Game extends Sprite
	{
		private var towerManager : TowerManager;
		private var missileManager : MissileManager;
		public function Game() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);	
			generateBackground(0x696969,0x6495ed);
			towerManager = new TowerManager(stage);
			missileManager = new MissileManager(stage);
			towerManager.createTowers(3);
		}
		
		private function generateBackground(_groundColor : uint,_skyColor : uint) :void{
			
			graphics.beginFill(_skyColor, 1);
			graphics.drawRect(0, 0, 800, 600);
			graphics.endFill();
			
			graphics.beginFill(_groundColor, 1);
			graphics.drawRect(0, 550, 800, 50);
			graphics.endFill();
		}
	}

}