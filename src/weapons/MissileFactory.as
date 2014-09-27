package weapons 
{
	import flash.display.Stage;
	import flash.geom.Point;
	import utils.Vector2D;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class MissileFactory 
	{
		public static const BASIC_MISSILE : String = "BasicMissile";
		
		public function addMissile(missileType : String, container : Stage, xPos : int, yPos : int, destination : Point,speed : Number) :Missile {
			
			var missile : Missile = this.createMissile(missileType);
			var direction : Vector2D = new Vector2D(destination.x - xPos, destination.y - yPos);
			
			if(missileType == BASIC_MISSILE){
				missile.drawMissile(0x11ff11);
			}
			
			missile.setPos(xPos, yPos, direction.angle * 180 / Math.PI);
			
			missile.armMissile(speed,missile.rotation,destination);
			
			container.addChildAt(missile,1);
			return missile;
		}
		
		private function createMissile(missileType : String) :Missile {
			
			switch(missileType) {
				
				case BASIC_MISSILE:
				return new BasicMissile();
				break;
				
				default:
				throw new Error("Not a legit tower!");
				return null;
			}
			
		}
		
	}

}