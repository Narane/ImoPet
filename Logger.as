package{
	import net.flashpunk.Entity;
	import assets.Assets;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;

	public class Logger extends Entity{
		private var logtext:Text = new Text("", 1, 1);
		private var graphicsholder:Graphiclist;
		
		public function Logger(y:int){
			this.x = 0
			this.y = y;
			layer = 0;
			super(this.x,this.y)
			graphicsholder = new Graphiclist(Assets._outputpanel, logtext);
			graphic = graphicsholder;
		}
		
		public function log(input:String){
			logtext.text = input;
		}
	}
}