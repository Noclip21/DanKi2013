package product
{
	import def.*;
	
	
	public class Nama extends Product
	{
		public static var objects :Array;
		
		
		public function Nama()
		{
			super(1,30);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = Nama_destructor;
		}
		function Nama_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
}
