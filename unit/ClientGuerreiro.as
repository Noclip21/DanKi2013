package unit
{
	import def.*;
	import product.*;
	import flash.geom.Point;
	
	
	public class ClientGuerreiro extends Client
	{
		public static var objects :Array;
		
		
		public function ClientGuerreiro(defStartPoint :Point,defEndPoint :Point)
		{
			super(Product.NAMA,defStartPoint,defEndPoint);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = ClientGuerreiro_destructor;
		}
		function ClientGuerreiro_destructor()
		{
			Utils.removeObject(this,objects);
		}

	}
	
}
