package unit
{
	import def.*;
	import product.*;
	import flash.geom.Point;
	
	
	public class ClientCampones extends Client
	{
		public static var objects :Array;
		
		
		public function ClientCampones(defStartPoint :Point,defEndPoint :Point)
		{
			super(Product.TALIBAN,defStartPoint,defEndPoint);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = ClientCampones_destructor;
		}
		function ClientCampones_destructor()
		{
			Utils.removeObject(this,objects);
		}

	}
	
}
