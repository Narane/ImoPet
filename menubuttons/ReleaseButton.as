package menubuttons{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import assets.Assets;
	
	public class ReleaseButton extends Entity{
		private var texts:Text = new Text("Buy translation releases:\n\n\9,999,999,999 IP", 0, 
										  Assets._releasebutton.height/4,
										  {width:Assets._releasebutton.width,
										  align:"center", color:"0x000000"});
		private var graphicsholder = new Graphiclist(Assets._releasebutton, texts);
		private var callback:Function;
		
		public function ReleaseButton(x:int, y:int, callback:Function = null){
			super(x,y);
			this.callback = callback;
			layer = 0;
			graphic = graphicsholder;
			setHitboxTo(Assets._releasebutton);
		}
		
		override public function update():void{
			super.update();
			
			if(collidePoint(this.x, this.y, world.mouseX, world.mouseY)){
				//FP.log(this.x + ", " + this.y + ", " + world.mouseX + ", " + world.mouseY);
				Input.mouseCursor = MouseCursor.BUTTON;
				if(Input.mouseReleased){
					click();
				}
			}
		}
		
		protected function click():void{
            if (callback != null)
			{
				callback();
			}
		}
	}
}