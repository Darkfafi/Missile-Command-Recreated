package towers 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import media.SoundManager;
	import weapons.EnemyMissile;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class TowerManager
	{
		public static const REMOVE_CAR : String = "removeCar";
		private var _allTowers : Array = [];
		private var _stage : Stage;
		
		public function TowerManager(world : Stage) {
			
			_stage = world;
			_stage.addEventListener(MouseEvent.MOUSE_DOWN, shoot);
			_stage.addEventListener(EnemyMissile.REMOVE_TARGET, removeTowerOnHit); 
		}
		
		private function removeTowerOnHit(e:Event):void 
		{
			var enemyHitMissile : EnemyMissile = e.target as EnemyMissile;
			if (enemyHitMissile.target != null && _allTowers[_allTowers.indexOf(enemyHitMissile.target)] != null) {
				if (_stage.contains(enemyHitMissile.target)) {
					var index : int = _allTowers.indexOf(enemyHitMissile.target);
					_stage.removeChild(enemyHitMissile.target);
					_allTowers.splice(index, 1);
				}
			}else {
				_stage.dispatchEvent(new Event(REMOVE_CAR,true));
			}
		}
		
		private function shoot(e:MouseEvent) :void 
		{
			var close : Number = new Number(Number.MAX_VALUE);
			var chosenTower : Tower;
			
			var l : int = _allTowers.length;
			for (var i : int = 0; i < l; i++) {
				if (_allTowers[i].mouseX + _allTowers[i].mouseY < close && _allTowers[i].ammo > 0) {
					close = _allTowers[i].mouseX + _allTowers[i].mouseY;
					chosenTower = _allTowers[i];
				}
			}
			if (chosenTower != null) {
				SoundManager.playSound(SoundManager.SHOOT);
				chosenTower.fire(_stage.mouseX, _stage.mouseY);
			}
		}
		
		public function rebuildTowers() : void {
			var l : int = _allTowers.length;
			for (var i : int = l - 1; i >= 0; i--) {
				_stage.removeChild(_allTowers[i]);
				_allTowers.splice(i, 1);
			}
			createTowers(3);
		}
		
		public function createTowers(amount : int):void {
			
			var towerFactory : TowerFactory = new TowerFactory();
			
			for (var i : int = 0; i < amount; i++) {
				
				var xPos : int = _stage.stageWidth / (amount - 1) * i;
				var yPos : int = _stage.stageHeight;
				
				var newTower : Tower = towerFactory.addTower(TowerFactory.BASIC, _stage, xPos, yPos);
				
				_allTowers.push(newTower);
			}
		}
		
		public function giveTowers() : Array {
			
			return _allTowers;
		}
		
	}

}