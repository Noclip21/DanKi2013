package product
{
	import def.*;
	
	
	public class Taliban extends Product
	{
		public static var objects :Array;
		
		
		public function Taliban()
		{
			super(2,15);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = Taliban_destructor;
		}
		function Taliban_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
}
