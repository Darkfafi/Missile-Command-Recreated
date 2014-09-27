package towers 
{
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class TowerFactory 
	{
		public static const BASIC : String = "basic";
		
		public function addTower(towerType : String, container : Stage, xPos : int, yPos : int) :Tower {
			
			var tower : Tower = this.createTower(towerType); 
			
			tower.drawTower();
			tower.setPos(xPos, (yPos - tower.height - 25));
			
			container.addChild(tower);
			tower.initTower();
			return tower;
		}
		
		
		private function createTower(towerType : String) :Tower {
			
			switch(towerType) {
					
				case BASIC:
				return new BasicTower();
				break;
				
				default:
				throw new Error("Not a legit tower!");
				return null;
				
			}
		}
	}

}