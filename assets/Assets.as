package assets{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Stamp;
	import menubuttons.MenuObject;
	import menubuttons.UpgradeButton;

	public class Assets{
		//all the UI stuff and misc
		public static const
			headString:String = "Head",
			eyesString:String = "Eyes",
			bodyString:String = "Body",
			colourString:String = "Colours", //I no speak Americano
			upgradeString:String = "Upgrades";
		[Embed(source = "../menubuttons/menubg.png")] public static const MENUBG:Class;
		public static const _menubg:Stamp = new Stamp(MENUBG);
		[Embed(source = "../assets/background.png")] public static const BACKGROUND:Class;
		[Embed(source = "../assets/orange kid.ttf", embedAsCFF="false", fontFamily = 'PixelFont')] private const PIXELFONT:Class;
		[Embed(source = "../menubuttons/menubox.png")] public static const MENUBOX:Class;
		public static const _menubox:Stamp = new Stamp(MENUBOX);
		[Embed(source = "../menubuttons/menuboxdisabled.png")] public static const MENUBOXOFF:Class;
		public static const _menuboxdisabled:Stamp = new Stamp(MENUBOXOFF);
	
		[Embed(source = "../menubuttons/menubutton.png")] public static const MENUBUTTON:Class;
		[Embed(source = "../menubuttons/menubutton_disabled.png")] public static const MENUBUTTONOFF:Class;
		public static const _menubutton:Stamp = new Stamp(MENUBUTTON);
		public static const _menubuttonoff:Stamp = new Stamp(MENUBUTTONOFF);
		[Embed(source = "../menubuttons/eyesbox.png")] public static const EYESBOX:Class;
		[Embed(source = "../menubuttons/eyesbox_disabled.png")] public static const EYESBOXOFF:Class;
		public static const _eyesbox:Stamp = new Stamp(EYESBOX);
		public static const _eyesboxoff:Stamp = new Stamp(EYESBOXOFF);
		
		[Embed(source = "../menubuttons/pagechanger.png")] public static const PAGECHANGER:Class;
		public static const _pagechanger:Stamp = new Stamp(PAGECHANGER);
		public static const _pagespacing:int = 4;
		
		[Embed(source = "../assets/clicker.png")] public static const CLICKER:Class;
		public static const _clicker:Stamp = new Stamp(CLICKER);
		[Embed(source = "../assets/smallclick.png")] public static const SMALLCLICKER:Class;
		public static const _smallclicker:Stamp = new Stamp(SMALLCLICKER);
		[Embed(source = "../assets/hired.png")] public static const HIREDCLICKER:Class;
		public static const _hiredclicker:Stamp = new Stamp(HIREDCLICKER);
		
		[Embed(source = "../assets/outputlog.png")] public static const OUTPUTLOG:Class;
		public static const _outputpanel:Stamp = new Stamp(OUTPUTLOG);
		
		[Embed(source = "../menubuttons/releasebutton.png")] public static const RELEASEBUTTON:Class;
		public static const _releasebutton:Stamp = new Stamp(RELEASEBUTTON);
		
		[Embed(source = "../menubuttons/savebutton.png")] public static const SAVEBUTTON:Class;
		public static const _savebutton:Stamp = new Stamp(SAVEBUTTON);
		
		[Embed(source = "../menubuttons/webbutton.png")] public static const WEBBUTTON:Class;
		public static const _webbutton:Stamp = new Stamp(WEBBUTTON);
		
		//character template related
		public static const CharStartingCoord:int = 16;
		public static const charx:int = 199;
		public static const chary:int = 446;
		[Embed(source = "../assets/charhitbox.png")] public static const HITBOX:Class;
		public static const hitboxx:int = 40;
		public static const hitboxy:int = 130;
		public static const maxheads:int = 25; //GET THIS COUNT RIGHT, INDEXING EYES DEPEND ON IT
		
		//eyes
		[Embed(source = "../assets/eyes_default.png")] public static const EYES_DEFAULT:Class;
		[Embed(source = "../assets/eyes_tsurime.png")] public static const EYES_TSURIME:Class;
		[Embed(source = "../assets/eyes_sleepy.png")] public static const EYES_SLEEPY:Class;
		[Embed(source = "../assets/eyes_unimpressed.png")] public static const EYES_UNIMPRESSED:Class;
		[Embed(source = "../assets/eyes_happy.png")] public static const EYES_HAPPY:Class;
		[Embed(source = "../assets/eyes_ahegao.png")] public static const EYES_AHEGAO:Class;
		[Embed(source = "../assets/eyes_yandere.png")] public static const EYES_YANDERE:Class;
		[Embed(source = "../assets/eyes_glasses.png")] public static const EYES_GLASSES:Class;
		[Embed(source = "../assets/eyes_glasses_neetmode.png")] public static const EYES_GLASSES_NEETMODE:Class;
		[Embed(source = "../assets/eyes_shinobu.png")] public static const EYES_SHINOBU:Class;
		[Embed(source = "../assets/eyes_grandma.png")] public static const EYES_GRANDMA:Class;
		[Embed(source = "../assets/eyes_grandma_off.png")] public static const EYES_GRANDMA_OFF:Class;
		[Embed(source = "../assets/eyes_raibuhonk.png")] public static const EYES_RAIBU_HONK:Class;
		[Embed(source = "../assets/eyes_raibunontan.png")] public static const EYES_RAIBU_NONTAN:Class;
		[Embed(source = "../assets/eyes_raibumake.png")] public static const EYES_RAIBU_MAKE:Class;
		[Embed(source = "../assets/eyes_raibuburd.png")] public static const EYES_RAIBU_BURD:Class;
		[Embed(source = "../assets/eyes_raiburin.png")] public static const EYES_RAIBU_RIN:Class;
		[Embed(source = "../assets/eyes_kiki.png")] public static const EYES_KIKI:Class;
		
		//hairs
		[Embed(source = "../assets/hair_default_BLUE_BACK.png")] public static const HAIR_DEFAULT_BLUE_BACK:Class;
		[Embed(source = "../assets/hair_default_BLUE_FRONT.png")] public static const HAIR_DEFAULT_BLUE_FRONT:Class;
		[Embed(source = "../assets/hair_default_YELLOW_BACK.png")] public static const HAIR_DEFAULT_YELLOW_BACK:Class;
		[Embed(source = "../assets/hair_default_YELLOW_FRONT.png")] public static const HAIR_DEFAULT_YELLOW_FRONT:Class;
		[Embed(source = "../assets/hair_twintails_BROWN_BACK.png")] public static const HAIR_TWINTAILS_BROWN_BACK:Class;
		[Embed(source = "../assets/hair_twintails_BROWN_FRONT.png")] public static const HAIR_TWINTAILS_BROWN_FRONT:Class;
		[Embed(source = "../assets/hair_twintails_YELLOW_BACK.png")] public static const HAIR_TWINTAILS_YELLOW_BACK:Class;
		[Embed(source = "../assets/hair_twintails_YELLOW_FRONT.png")] public static const HAIR_TWINTAILS_YELLOW_FRONT:Class;
		[Embed(source = "../assets/hair_hime_BLACK_BACK.png")] public static const HAIR_HIME_BLACK_BACK:Class;
		[Embed(source = "../assets/hair_hime_BLACK_FRONT.png")] public static const HAIR_HIME_BLACK_FRONT:Class;
		[Embed(source = "../assets/hair_hime_PINK_BACK.png")] public static const HAIR_HIME_PINK_BACK:Class;
		[Embed(source = "../assets/hair_hime_PINK_FRONT.png")] public static const HAIR_HIME_PINK_FRONT:Class;
		[Embed(source = "../assets/hair_tanpo.png")] public static const KAWAII:Class;
		[Embed(source = "../assets/hair_ponytail_GREEN_BACK.png")] public static const HAIR_PONYTAIL_GREEN_BACK:Class;
		[Embed(source = "../assets/hair_ponytail_GREEN_FRONT.png")] public static const HAIR_PONYTAIL_GREEN_FRONT:Class;
		[Embed(source = "../assets/hair_ponytail_YELLOW_BACK.png")] public static const HAIR_PONYTAIL_YELLOW_BACK:Class;
		[Embed(source = "../assets/hair_ponytail_YELLOW_FRONT.png")] public static const HAIR_PONYTAIL_YELLOW_FRONT:Class;
		[Embed(source = "../assets/hair_trouble_BROWN_BACK.png")] public static const HAIR_TROUBLE_BROWN_BACK:Class;
		[Embed(source = "../assets/hair_trouble_BROWN_FRONT.png")] public static const HAIR_TROUBLE_BROWN_FRONT:Class;
		[Embed(source = "../assets/hair_short_BROWN.png")] public static const HAIR_BOYISH_BROWN:Class;
		[Embed(source = "../assets/hair_short_PURPLE.png")] public static const HAIR_BOYISH_PURPLE:Class;
		[Embed(source = "../assets/hair_agdg_BACK.png")] public static const HAIR_AGDG_BACK:Class;
		[Embed(source = "../assets/hair_agdg_FRONT.png")] public static const HAIR_AGDG_FRONT:Class;
		[Embed(source = "../assets/hair_kirino_BACK.png")] public static const HAIR_KIRINO_BACK:Class;
		[Embed(source = "../assets/hair_kirino_FRONT.png")] public static const HAIR_KIRINO_FRONT:Class;
		[Embed(source = "../assets/hair_agdgtan_BACK.png")] public static const HAIR_AGDGTAN_BACK:Class;
		[Embed(source = "../assets/hair_agdgtan_FRONT.png")] public static const HAIR_AGDGTAN_FRONT:Class;
		[Embed(source = "../assets/hair_bangs_BACK.png")] public static const HAIR_BANGS_BACK:Class;
		[Embed(source = "../assets/hair_bangs_FRONT.png")] public static const HAIR_BANGS_FRONT:Class;
		[Embed(source = "../assets/hair_leto_BACK.png")] public static const HAIR_LETO_BACK:Class;
		[Embed(source = "../assets/hair_leto_FRONT.png")] public static const HAIR_LETO_FRONT:Class;
		[Embed(source = "../assets/hair_shinobu_BACK.png")] public static const HAIR_SHINOBU_BACK:Class;
		[Embed(source = "../assets/hair_shinobu_FRONT.png")] public static const HAIR_SHINOBU_FRONT:Class;
		[Embed(source = "../assets/hair_grandma.png")] public static const HAIR_GRANDMA:Class;
		[Embed(source = "../assets/hair_raibuhonk_BACK.png")] public static const HAIR_RAIBU_HONK_BACK:Class;
		[Embed(source = "../assets/hair_raibuhonk_FRONT.png")] public static const HAIR_RAIBU_HONK_FRONT:Class;
		[Embed(source = "../assets/hair_raibunontan_BACK.png")] public static const HAIR_RAIBU_NONTAN_BACK:Class;
		[Embed(source = "../assets/hair_raibunontan_FRONT.png")] public static const HAIR_RAIBU_NONTAN_FRONT:Class;
		[Embed(source = "../assets/hair_raibumake_BACK.png")] public static const HAIR_RAIBU_MAKE_BACK:Class;
		[Embed(source = "../assets/hair_raibumake_FRONT.png")] public static const HAIR_RAIBU_MAKE_FRONT:Class;
		[Embed(source = "../assets/hair_raibuburd_BACK.png")] public static const HAIR_RAIBU_BURD_BACK:Class;
		[Embed(source = "../assets/hair_raibuburd_FRONT.png")] public static const HAIR_RAIBU_BURD_FRONT:Class;
		[Embed(source = "../assets/hair_raiburin_BACK.png")] public static const HAIR_RAIBU_RIN_BACK:Class;
		[Embed(source = "../assets/hair_raiburin_FRONT.png")] public static const HAIR_RAIBU_RIN_FRONT:Class;
		[Embed(source = "../assets/hair_kiki_BACK.png")] public static const HAIR_KIKI_BACK:Class;
		[Embed(source = "../assets/hair_kiki_FRONT.png")] public static const HAIR_KIKI_FRONT:Class;
		
		//body
		[Embed(source = "../assets/charbase.png")] public static const CHARBASE:Class;
		public static var _charbase:Stamp = new Stamp(CHARBASE, CharStartingCoord, CharStartingCoord);
		[Embed(source = "../assets/kinder.png")] public static const KINDER:Class;
		[Embed(source = "../assets/sweater.png")] public static const SWEATER:Class;
		[Embed(source = "../assets/schoolgirl.png")] public static const SCHOOL:Class;
		[Embed(source = "../assets/sukumizu.png")] public static const SUKUMIZU:Class;
		[Embed(source = "../assets/hoodie.png")] public static const HOODIE:Class;
		[Embed(source = "../assets/buruma.png")] public static const BURUMA:Class;
		[Embed(source = "../assets/miko.png")] public static const MIKO:Class;
		[Embed(source = "../assets/maid.png")] public static const MAID:Class;
		[Embed(source = "../assets/bunnygirl.png")] public static const BUNNYGIRL:Class;
		[Embed(source = "../assets/shimakaze.png")] public static const SHIMAKAZE:Class;
		[Embed(source = "../assets/tanktop.png")] public static const TANKTOP:Class;
		[Embed(source = "../assets/kimono.png")] public static const KIMONO:Class;
		[Embed(source = "../assets/blacksister.png")] public static const BLACKSISTER:Class;
		[Embed(source = "../assets/igg.png")] public static const IGG:Class;
		[Embed(source = "../assets/tie.png")] public static const TIE:Class;
		[Embed(source = "../assets/wonderfulrush.png")] public static const RAIBU_WONDERFULRUSH:Class;
		[Embed(source = "../assets/kiki.png")] public static const KIKI:Class;
				
		
		//Return an array of graphics in the form of MenuObjects.
		
		public static function MapHead():Array{
			var returnarray:Array = new Array();
			//what if the colours were spritemapped per-type?
			returnarray.push(new MenuObject(headString, "Default Blue", HAIR_DEFAULT_BLUE_FRONT, HAIR_DEFAULT_BLUE_BACK, 0, true, 0));
			returnarray.push(new MenuObject(headString, "Ribbon Default Yellow", HAIR_DEFAULT_YELLOW_FRONT, HAIR_DEFAULT_YELLOW_BACK, 20, false, 1));
			returnarray.push(new MenuObject(headString, "Twintails Brown", HAIR_TWINTAILS_BROWN_FRONT, HAIR_TWINTAILS_BROWN_BACK, 100, false, 2));
			returnarray.push(new MenuObject(headString, "Twintails Yellow", HAIR_TWINTAILS_YELLOW_FRONT, HAIR_TWINTAILS_YELLOW_BACK, 120, false, 3));
			returnarray.push(new MenuObject(headString, "Hime Black", HAIR_HIME_BLACK_FRONT, HAIR_HIME_BLACK_BACK, 1000, false, 4));
			returnarray.push(new MenuObject(headString, "Hime Pink", HAIR_HIME_PINK_FRONT, HAIR_HIME_PINK_BACK, 1200, false, 5));
			returnarray.push(new MenuObject(headString, "Cat", KAWAII, HITBOX, 2400, false, 6));
			returnarray.push(new MenuObject(headString, "Ponytail Green", HAIR_PONYTAIL_GREEN_FRONT, HAIR_PONYTAIL_GREEN_BACK, 5000, false, 7));
			returnarray.push(new MenuObject(headString, "Ponytail Yellow", HAIR_PONYTAIL_YELLOW_FRONT, HAIR_PONYTAIL_YELLOW_BACK, 5400, false, 8));
			returnarray.push(new MenuObject(headString, "Boyish Brown", HAIR_BOYISH_BROWN, HITBOX, 12600, false, 9));
			returnarray.push(new MenuObject(headString, "Boyish Purple", HAIR_BOYISH_PURPLE, HITBOX, 13800, false, 10));
			returnarray.push(new MenuObject(headString, "Ribbon Ponytail", HAIR_AGDG_FRONT, HAIR_AGDG_BACK, 25000, false, 11));
			returnarray.push(new MenuObject(headString, "Imouto Prime", HAIR_KIRINO_FRONT, HAIR_KIRINO_BACK, 52000, false, 12));
			returnarray.push(new MenuObject(headString, "Messy", HAIR_AGDGTAN_FRONT, HAIR_AGDGTAN_BACK, 92600, false, 13));
			returnarray.push(new MenuObject(headString, "Bangs Silver", HAIR_BANGS_FRONT, HAIR_BANGS_BACK, 93200, false, 14));
			returnarray.push(new MenuObject(headString, "Bangs Goggles Cyan", HAIR_LETO_FRONT, HAIR_LETO_BACK, 145000, false, 15));
			returnarray.push(new MenuObject(headString, "Vampiric Yellow", HAIR_SHINOBU_FRONT, HAIR_SHINOBU_BACK, 225000, false, 16));
			returnarray.push(new MenuObject(headString, "Trouble Brown", HAIR_TROUBLE_BROWN_FRONT, HAIR_TROUBLE_BROWN_BACK, 320000, false, 17));
			returnarray.push(new MenuObject(headString, "Cookie... Petter?", HAIR_GRANDMA, HITBOX, 640000, false, 18));
			returnarray.push(new MenuObject(headString, "Sidetail Orange", HAIR_RAIBU_HONK_FRONT, HAIR_RAIBU_HONK_BACK, 900000, false, 19));
			returnarray.push(new MenuObject(headString, "Scrunchie Twintail", HAIR_RAIBU_NONTAN_FRONT, HAIR_RAIBU_NONTAN_BACK, 900000, false, 20));
			returnarray.push(new MenuObject(headString, "Short Red", HAIR_RAIBU_MAKE_FRONT, HAIR_RAIBU_MAKE_BACK, 900000, false, 21));
			returnarray.push(new MenuObject(headString, "Long Tail Brown", HAIR_RAIBU_BURD_FRONT, HAIR_RAIBU_BURD_BACK, 900000, false, 22));
			returnarray.push(new MenuObject(headString, "Boyish V2 Orange", HAIR_RAIBU_RIN_FRONT, HAIR_RAIBU_RIN_BACK, 900000, false, 23));
			returnarray.push(new MenuObject(headString, "Twintails V2", HAIR_KIKI_FRONT, HAIR_KIKI_BACK, 1200000, false, 24));
			
			return returnarray;
		}
		
		public static function MapEyes():Array{
			var returnarray:Array = new Array();
			
			returnarray.push(new MenuObject(eyesString, "Tareme", EYES_DEFAULT, null, 0, true, 0));
			returnarray.push(new MenuObject(eyesString, "Tsurime", EYES_TSURIME, null, 1200, false, 1));
			returnarray.push(new MenuObject(eyesString, "Sleepy", EYES_SLEEPY, null, 4500, false, 2));
			returnarray.push(new MenuObject(eyesString, "-_-", EYES_UNIMPRESSED, null, 8000, false, 3));
			returnarray.push(new MenuObject(eyesString, "^_^", EYES_HAPPY, null, 22000, false, 4));
			returnarray.push(new MenuObject(eyesString, "Yandere", EYES_YANDERE, null, 52000, false, 5));
			returnarray.push(new MenuObject(eyesString, "Glasses", EYES_GLASSES, null, 85000, false, 6));
			returnarray.push(new MenuObject(eyesString, "Glasses (NEET mode)", EYES_GLASSES_NEETMODE, null, 85500, false, 7));
			returnarray.push(new MenuObject(eyesString, "Supernatural", EYES_SHINOBU, null, 180000, false, 8));
			returnarray.push(new MenuObject(eyesString, "Idling Glasses", EYES_GRANDMA, null, 326000, false, 9));
			returnarray.push(new MenuObject(eyesString, "Idling", EYES_GRANDMA_OFF, null, 330000, false, 10));
			returnarray.push(new MenuObject(eyesString, ":D", EYES_RAIBU_HONK, null, 900000, false, 11));
			returnarray.push(new MenuObject(eyesString, ":)", EYES_RAIBU_NONTAN, null, 900000, false, 12));
			returnarray.push(new MenuObject(eyesString, ":/", EYES_RAIBU_MAKE, null, 900000, false, 13));
			returnarray.push(new MenuObject(eyesString, ":o", EYES_RAIBU_BURD, null, 900000, false, 14));
			returnarray.push(new MenuObject(eyesString, ";3", EYES_RAIBU_RIN, null, 900000, false, 15));
			returnarray.push(new MenuObject(eyesString, ">;3", EYES_KIKI, null, 1400000, false, 16));
			returnarray.push(new MenuObject(eyesString, "???", EYES_AHEGAO, null, 9999999, false, 17));
			
			return returnarray;
		}
		
		
		public static function MapBody():Array{
			var returnarray:Array = new Array();
			
			returnarray.push(new MenuObject(bodyString, "Schoolgirl", SCHOOL, null, 0, true, 0));
			returnarray.push(new MenuObject(bodyString, "Kindergartener", KINDER, null, 3200, false, 1));
			returnarray.push(new MenuObject(bodyString, "Beige Ribbed Sweater", SWEATER, null, 4500, false, 2));
			returnarray.push(new MenuObject(bodyString, "Sukumizu", SUKUMIZU, null, 9001, false, 3));
			returnarray.push(new MenuObject(bodyString, "Hoodie", HOODIE, null, 12000, false, 4));
			returnarray.push(new MenuObject(bodyString, "Buruma", BURUMA, null, 24000, false, 5));
			returnarray.push(new MenuObject(bodyString, "Miko", MIKO, null, 36000, false, 6));
			returnarray.push(new MenuObject(bodyString, "Maid", MAID, null, 60000, false, 7));
			returnarray.push(new MenuObject(bodyString, "Bunnygirl", BUNNYGIRL, null, 150000, false, 8));
			returnarray.push(new MenuObject(bodyString, "Destroyer", SHIMAKAZE, null, 310000, false, 9));
			returnarray.push(new MenuObject(bodyString, "Tank Top", TANKTOP, null, 640000, false, 10));
			returnarray.push(new MenuObject(bodyString, "Traditional", KIMONO, null, 1800000, false, 11));
			returnarray.push(new MenuObject(bodyString, "Logo Shirt", IGG, null, 3200000, false, 12));
			returnarray.push(new MenuObject(bodyString, "Black Sister", BLACKSISTER, null, 5200000, false, 13));
			returnarray.push(new MenuObject(bodyString, "Cool Idol", RAIBU_WONDERFULRUSH, null, 9000000, false, 14));
			returnarray.push(new MenuObject(bodyString, "Kitty", KIKI, null, 11000000, false, 15));
			returnarray.push(new MenuObject(bodyString, "Not-Quite-None", TIE, null, 9999999, false, 16));
			returnarray.push(new MenuObject(bodyString, "None", CHARBASE, null, 99999999, false, 17));
			
			return returnarray;
		}
		
		public static function MapUpgrades():Array{
			var returnarray:Array = new Array();
			
			returnarray.push(new UpgradeButton("Auto Clicker", 18, 0.2, 0));
			returnarray.push(new UpgradeButton("Hired Petters", 150, 1.2, 1));
			returnarray.push(new UpgradeButton("Siscon Sergeant", 600, 8, 2));
			returnarray.push(new UpgradeButton("Sister Bank", 4100, 24, 3));
			returnarray.push(new UpgradeButton("Imouto Paradise", 10000, 110, 4));
			returnarray.push(new UpgradeButton("Imoutolicious", 32000, 160, 5));
			
			return returnarray;
		}
	}
}