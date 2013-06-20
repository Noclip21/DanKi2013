package unit
{
	import def.*;
	import product.*;
	import flash.geom.Point;
	
	
	public class ClientNobre extends Client
	{
		public static var objects :Array;
		
		
		public function ClientNobre(defStartPoint :Point,defEndPoint :Point)
		{
			super(Product.PREMIUM,defStartPoint,defEndPoint);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = ClientNobre_destructor;
		}
		function ClientNobre_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
}
