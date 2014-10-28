package{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP
	import assets.Assets
	import menubuttons.MenuObject
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Spritemap;
	
	public class char_Imouto extends Entity{
		private var callback:Function;
		private var xy:int = Assets.CharStartingCoord;
		private var graphicsHolder:Graphiclist;
		
		private var
			//holder variables for determining which graphic to show
			hairfront:Stamp,
			hairback:Stamp,
			eyes:Stamp,
			body:Stamp;
			
		public function char_Imouto(hairArray:Array, eyesArray:Array, bodyArray:Array, callback:Function = null){
			this.callback = callback;
			layer = 1;
			hairfront = hairArray[0].img();
			hairback = hairArray[0].back();
			eyes = eyesArray[0].img();
			body = bodyArray[0].img();
			graphicsHolder = new Graphiclist(hairback, Assets._charbase, body, eyes, hairfront);
			graphic = graphicsHolder;
			setHitboxTo(new Stamp(Assets.HITBOX, Assets.hitboxx, Assets.hitboxy));
		}
		
		override public function update():void{
			super.update();
			
			if(collidePoint(this.x, this.y, world.mouseX, world.mouseY)){
				Input.mouseCursor = MouseCursor.BUTTON;
				if(Input.mouseReleased){
					click(true);
				} else if(Input.mouseDown){
					click(false);
				}
			} else {
				Input.mouseCursor = MouseCursor.AUTO;
			}
		}
		
		protected function click(buttonReleased:Boolean):void{
			if (callback != null)
			{
				callback(buttonReleased);
			}
			//changeGraphic(hairfront, hairback, eyes, body);
		}
		
		public function changeGraphic(hairfront:Stamp, hairback:Stamp, eyes:Stamp, body:Stamp){
			if(hairfront != null){
				this.hairfront = hairfront;
			}
			if(hairback != null){
				this.hairback = hairback;
			}
			if(eyes != null){
				this.eyes = eyes;
			}
			if(body != null){
				this.body = body;
			}
			graphicsHolder.removeAll();
			graphicsHolder.add(this.hairback);
			graphicsHolder.add(Assets._charbase);
			graphicsHolder.add(this.body);
			graphicsHolder.add(this.eyes);
			graphicsHolder.add(this.hairfront);
			graphic = graphicsHolder;
		}
	}
}