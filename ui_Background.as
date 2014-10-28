package{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import assets.Assets
	
	public class ui_Background extends Entity{
		private var _background:Stamp = new Stamp(Assets.BACKGROUND);
		
		public function ui_Background(){
			layer = 1000;
			graphic = _background;
		}
	}
}