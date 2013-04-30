package product
{
	import def.*;
	
	
	public class Premium extends Product
	{
		public static var objects :Array;
		
		
		public function Premium()
		{
			super(0,60);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = Premium_destructor;
		}
		function Premium_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
}
