package menubuttons{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;
	import assets.Assets;
	
	//Objects that hold data for a particular item, later to be displayed by MenuObjectsButton
	//Assets.as has a function that creates a MenuObject out of every graphic object and returns an array of these
	public class MenuObject extends Entity{
		public var _itemtype:String;
		public var _labeltext:String;
		public var _embedimage:Class;
		public var _embedImageStamp:Stamp;
		public var _secondaryimage:Class; //this is necessary for items that occupy two layers, i.e. hair
		public var _secondaryImageStamp:Stamp;
		public var _price:Number;
		public var _bought:Boolean = false;
		public var _rownum:int;
		protected var xy:int = Assets.CharStartingCoord;
		
		public function MenuObject(itemtype:String, labeltext:String, embedimage:Class, secondaryimage:Class, price:Number, bought:Boolean, rownum:int){
			_itemtype = itemtype;
			_labeltext = labeltext;
			_embedimage = embedimage;
			_secondaryimage = secondaryimage;
			_price = price;
			_bought = bought;
			_rownum = rownum;
			
			
			_embedImageStamp = new Stamp(_embedimage, xy, xy);
			_secondaryImageStamp = new Stamp(_secondaryimage, xy, xy);
		}
		
		public function img():Stamp{
			return _embedImageStamp
		}
		
		public function back():Stamp{
			return _secondaryImageStamp
		}
	}
} 