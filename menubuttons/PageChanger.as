package menubuttons{
	import flash.ui.MouseCursor;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import assets.Assets;
	
	public class PageChanger extends Entity{
		private var associatedPage:int;
		private var callback:Function;
		private var graphicsholder:Graphiclist;
		private var pagetext:Text;
		
		//thisPage: the page changer button that is currently being made (i.e. 1 = button to go to 1)
		//	Confusingly, the return value needs to be decremented by 1 if used for currentPage because it starts at 0 (SORRY)
		//totalPage: The total number of pages that will be created
		//startx, starty: the leftmost part of the area where page buttons will be made
		//areawidth: startx + areawidth = the rightmost part
		public function PageChanger(thisPage:int, callback:Function = null){
			associatedPage = thisPage;
			pagetext = new Text(thisPage.toString(), 0, 10, {width:34, align:"center", color:"0x000000"});
			graphicsholder = new Graphiclist(Assets._pagechanger, pagetext);
			this.callback = callback;
			super(x,y);
			graphic = graphicsholder;
			setHitboxTo(Assets._pagechanger);
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
		
		public function changeLocation(totalPage:int, startx:int, starty:int, areawidth:int){
			this.y = starty;
			this.x = startx + ((areawidth - (Assets._pagechanger.width * totalPage) 
							   - (Assets._pagespacing * (totalPage - 1))) / 2 
							   + (Assets._pagechanger.width + Assets._pagespacing) * (associatedPage - 1));
		}
		
		public function debugit(){
			trace("This is page: " + associatedPage);
		}
		
		protected function click():void{ 
            if (callback != null)
			{
				callback(associatedPage);
			}
		}
	}
}