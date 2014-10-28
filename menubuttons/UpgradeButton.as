package menubuttons{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import assets.Assets;
	
	public class UpgradeButton extends Entity{
		private var callback:Function;
		private var numbought:int = 0;
		private var upgradename:String;
		private var hoverText:Array;
		private var hoverTextIndex:int;
		private var price:Number;
		private var imoutopersecond:Number;
		private var rownum:int;
		private var menubox:Stamp = Assets._menubox;
		private var graphicsholder:Graphiclist;
		private var pricetag:Text;
		private var numboughttag:Text = new Text(numbought + " IP", 0, menubox.height/4, {width:menubox.width, align:"left", color:"0x000000"});
		
		public function UpgradeButton(upgradename:String, price:Number, imoutopersecond:Number, rownum:int){
			super(x,y);
			this.upgradename = upgradename;
			this.price = price;
			this.imoutopersecond = imoutopersecond;
			this.rownum = rownum;
			this.pricetag = new Text(this.price.toFixed(0) + " IP", 0, Assets._menubox.height/4, {width:Assets._menubox.width, align:"right", color:"0x000000"});
			layer = 996;
			graphicsholder = new Graphiclist(menubox, this.pricetag);
			graphic = graphicsholder;
			this.updateNumbersBought();
			setHitboxTo(Assets._menubox);
			trace("UpgradeButton made; item: " + upgradename);
		}
		
		public function updateButton(x:Number, y:Number, hoverText:Array, hoverTextIndex:int, callback:Function = null){
			//Set whatever couldn't be set on initialization because I made a mistake and now the button is in assets list
			this.x = x;
			this.y = y;
			this.hoverText = hoverText;
			this.hoverTextIndex = hoverTextIndex;
			this.callback = callback;
		}
		
		public function updateNumbersBought(){
			//numboughttag.text = " " + numbought + " (" + (this.imoutopersecond * numbought).toFixed(1) + " IPpS)";
			//numboughttag.text = " " + numbought + "*" + (this.imoutopersecond * numbought).toFixed(1) + "/s";
			numboughttag.text = " " + (this.imoutopersecond * numbought).toFixed(1) + "/s";
			graphicsholder.removeAll();
			graphicsholder.add(menubox);
			graphicsholder.add(pricetag);
			trace(this.pricetag.text);
			graphicsholder.add(numboughttag);
		}
		
		public function updateGraphic(){
			hoverText[hoverTextIndex].changeText(upgradename);
			updateNumbersBought();
		}
		
		public function updateAvailability(ip:Number){
			//if there's not enough IP to buy this, grey it out; otherwise, light it up
			if(ip >= this.price){
				menubox = Assets._menubox;
			} else {
				menubox = Assets._menuboxdisabled;
			}
			graphicsholder.removeAll();
			graphicsholder.add(menubox);
			graphicsholder.add(pricetag);
			graphicsholder.add(numboughttag);
		}
		
		public function buyOne(){
			numbought = numbought + 1;
			price = price * 1.2;
			pricetag.text = Math.floor(price) + " IP";
			this.updateNumbersBought();
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
            if (callback != null)
			{
				callback(this.price, this.rownum, this.imoutopersecond);
			}
		}
	}
}