package{
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.Entity;
	import assets.Assets;
	
	public class clicker extends Entity{
		public var originalx:int;
		public var originaly:int;
		
		public function clicker(x:int, y:int, clickerType:String){
			super(x,y);
			layer = 0;
			originalx = x;
			originaly = y;
			if(clickerType == "mainclicker"){
			   graphic = Assets._clicker;
			} else if (clickerType == "upgradeone"){
				graphic = Assets._smallclicker;
			} else if (clickerType == "upgradetwo"){
				graphic = Assets._hiredclicker;
			}
		}
		
		public function moveUp(){
			this.y = originaly - 20;
		}
		
		public function moveDown(){
			this.y = originaly;
		}
		
		public function moveLeft(){
			this.x = originalx - 20;
		}
		
		public function moveRight(){
			this.x = originalx;
		}
		
		public function makeVisible(bool:Boolean)/**/{
			visible = bool;
		}
	}
}