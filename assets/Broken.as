package assets{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Stamp;

	public class Broken extends Entity{
		[Embed(source = "../assets/broken.png")] public static const BROKEN:Class;
		public function Broken(){
			graphic = new Stamp(BROKEN, 0, 0);
		}
	}
}