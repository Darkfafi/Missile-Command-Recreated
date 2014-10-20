package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import media.SoundManager;
	import towers.Tower;
	import towers.TowerFactory;
	import towers.TowerManager;
	import ui.UISystem;
	import weapons.explosions.Explosion;
	import weapons.explosions.ExplosionManager;
	import weapons.Missile;
	import weapons.MissileManager;
	import flash.utils.setTimeout;
	import world.WorldManager;
	import world.WorldObjectsFactory;
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
		private var worldManager : WorldManager;
		
		private var lives : int = 10;
		
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
			explosionManager = new ExplosionManager(stage, levelSystem);
			worldManager = new WorldManager(stage);
			uiSystem = new UISystem(lives);
			
			worldManager.createObjects(lives);
			towerManager.createTowers(3);
			
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
		public function destroy() : void {
			var i:int, l:int, cur:DisplayObject;
			
			l = stage.numChildren;
			
			for ( i = l - 1; i >=  0; i-- ) {
				
				cur = stage.getChildAt(i);
				
				if(cur is Sprite){
					stage.removeChild(cur);
				}
			}
			cur = null;
			i = l = NaN;
			
			towerManager.destroy();
			missileManager.destroy();
			levelSystem.destroy();
			explosionManager.destroy();
			worldManager.destroy();
			uiSystem.destroy();
			removeChild(uiSystem);
			
			towerManager = null;
			missileManager = null;
			levelSystem = null;
			explosionManager = null;
			worldManager = null;
			uiSystem = null;
		}
	}

}