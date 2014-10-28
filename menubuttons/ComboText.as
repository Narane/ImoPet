package menubuttons{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	
	public class ComboText extends Entity{
		private var comboName:String;
		private var comboDesc:String;
		private var textholder:Text;
		
		public function ComboText(x:Number, y:Number, comboName:String = "None", comboDesc:String = "N/A"){
			super(x,y);
			textholder = new Text("Current Active Combo: " + comboName
								  + "\n\n Description : " + comboDesc,
								  8, 4,
								  {width:353, wordWrap: true, align:"center", color:"0x000000"});
			graphic = textholder;
		}
		
		public function changeCombo(comboName:String = "None", comboDesc:String = "N/A"){
			textholder.text = ("Current Active Combo: " + comboName
								+ "\n\n" + comboDesc);
		}
	}
}