package menubuttons{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import assets.Assets

	public class MenuButton extends Entity{
		private var _menubutton:Stamp = Assets._menubutton;
		private var _menubuttonoff:Stamp = Assets._menubuttonoff;
		private var identity:String;
		private var callback:Function;
		private var textholder:Text;
		
		public function MenuButton(x:int = 0, y:int = 0, identitygiven:String = "Style", disabled:Boolean = false, callback:Function = null){
			super(x,y);
			this.identity = identitygiven;
			this.callback = callback;
			layer = 998;
			
			textholder = new Text(identitygiven, 0, _menubutton.height/4, {width:_menubutton.width, align:"center", color:"0x000000"});
			if(disabled){
				graphic = new Graphiclist(_menubuttonoff, textholder);
			} else {
				graphic = new Graphiclist(_menubutton, textholder);
			}
			setHitboxTo(_menubutton);
			trace("MenuButton made; identity: " + identity);
		}
		
		override public function update():void{
			super.update();
			
			if(collidePoint(this.x, this.y, world.mouseX, world.mouseY)){
				Input.mouseCursor = MouseCursor.BUTTON;
				if(Input.mouseReleased){
					click();
				}
			}
		}
		
		protected function click():void{
			//Return the button label so the handler in MainWorld knows what to do with it
            if (callback != null)
			{
				callback(this.identity);
			}
		}
		
		public function disableGraphic(bool:Boolean){
			if(bool){
				graphic = new Graphiclist(_menubuttonoff, textholder);
			} else {
				graphic = new Graphiclist(_menubutton, textholder);
			}
		}
	}
}