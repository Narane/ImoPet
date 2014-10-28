package menubuttons{
	import net.flashpunk.graphics.Text;
	import assets.Assets;
	import net.flashpunk.Entity;
	
	public class HoverText extends Entity{
		private var textholder:Text;
		
		public function HoverText(x:Number, y:Number, curtext:String){
			super(x,y);
			textholder = new Text(curtext, 0, Assets._menubox.height/4, {width:Assets._menubox.width, wordWrap: true, align:"center", color:"0x000000"});
			graphic = textholder;
		}
		
		public function changeText(giventext:String){
			textholder.text = giventext;
		}
	}
}