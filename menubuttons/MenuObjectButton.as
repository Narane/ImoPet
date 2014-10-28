package menubuttons{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import assets.Assets;

	//Individual buttons created in every menu tab
	// i.e. a hair item in the Head tab
	public class MenuObjectButton extends Entity{
		private var callback:Function;
		private var _rownum:int;
		private var _passedobject:MenuObject;
		private var hoverText:Array;
		private var hoverTextIndex:int;
		public var _active:Boolean = false;
		private var pricetag:Text;
		private var graphicsholder:Graphiclist;
		
		public function MenuObjectButton(x:Number, y:Number, passedobject:MenuObject, hoverText:Array, hoverTextIndex:int, callback:Function = null){
			super(x,y);
			this.callback = callback;
			this._passedobject = passedobject;
			this._rownum = _passedobject._rownum;
			this.hoverText = hoverText;
			this.hoverTextIndex = hoverTextIndex;
			layer = 996;
			this.pricetag = new Text(_passedobject._price + " IP", 0, Assets._menubox.height/4, {width:Assets._menubox.width, align:"right", color:"0x000000"});
			graphicsholder = new Graphiclist(Assets._menubox, this.pricetag);
			graphic = graphicsholder;
			this.updateGraphic();
			setHitboxTo(Assets._menubox);
			trace("MenuObjectButton made; item: " + passedobject._labeltext);
		}
		
		public function updateGraphic():void{
			if(_passedobject._bought){
				if(_active){
					graphicsholder.removeAll()
					if(this._passedobject._itemtype == Assets.eyesString){
						graphicsholder.add(Assets._eyesbox);
					} else{
						graphicsholder.add(Assets._menubox);
					}
					//graphicsholder.add(this.pricetag);
				} else {
					graphicsholder.removeAll()
					if(this._passedobject._itemtype == Assets.eyesString){
						graphicsholder.add(Assets._eyesboxoff);
					} else{
						graphicsholder.add(Assets._menuboxdisabled);
					}
					//graphicsholder.add(this.pricetag);
				}
				hoverText[hoverTextIndex].changeText(_passedobject._labeltext);
			} else {
				graphicsholder.removeAll()
				if(this._passedobject._itemtype == Assets.eyesString){
						graphicsholder.add(Assets._eyesboxoff);
				} else{
						graphicsholder.add(Assets._menuboxdisabled);
				}
				graphicsholder.add(this.pricetag);
				hoverText[hoverTextIndex].changeText(_passedobject._labeltext);
			}
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
				callback(_passedobject._itemtype, _passedobject._price, _passedobject._bought, _passedobject._rownum);
			}
		}
	}
}