package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import media.SoundManager;
	import towers.Tower;
	import towers.TowerFactory;
	import towers.TowerManager;
	import ui.UISystem;
	import weapons.explosions.ExplosionManager;
	import weapons.MissileManager;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class Game extends Sprite
	{
		public var uiSystem :  UISystem;
		
		private var towerManager : TowerManager;
		private var missileManager : MissileManager;
		private var levelSystem : LevelSystem;
		private var explosionManager : ExplosionManager;
		
		public function Game() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			generateBackground(0x696969, 0x6495ed);
			
			setTimeout(startGame, 10);
			
		}
		private function startGame() : void {
			SoundManager.playSound(SoundManager.GAME_BG_MUSIC);
			towerManager = new TowerManager(stage);
			missileManager = new MissileManager(stage);
			levelSystem = new LevelSystem(stage, towerManager);
			explosionManager = new ExplosionManager(stage,levelSystem);
			towerManager.createTowers(3);
			
			uiSystem = new UISystem(towerManager,explosionManager,levelSystem)
			addChild(uiSystem);
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