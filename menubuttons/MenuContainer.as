package menubuttons{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.FP;
	import assets.Assets;
	
	public class MenuContainer extends Entity{	
		public function MenuContainer(x:int = 0, y:int = 0){
			super(x,y);
			layer = 999;
			graphic = Assets._menubg;
		}
	}
}