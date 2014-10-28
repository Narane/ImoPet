package menubuttons{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.utils.Input;
	import assets.Assets;
	
	public class SmallButton extends Entity{
		private var callback:Function;
		
		public function SmallButton(x:int = 0, y:int = 0, graphicToUse:Stamp = null, callback:Function = null){
			super(x,y);
			this.callback = callback;
			layer = 995;
			graphic = graphicToUse;
			setHitboxTo(graphic);
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