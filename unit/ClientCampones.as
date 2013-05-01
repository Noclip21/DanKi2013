package unit
{
	import def.*;
	
	
	public class ClientCampones extends Client
	{
		public static var Clientobjects :Array;
		
		
		public function ClientCampones()
		{
			super(2);
			
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
