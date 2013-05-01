package unit
{
	import def.*;
	
	
	public class ClientGuerreiro extends Client
	{
		public static var objects :Array;
		
		
		public function ClientGuerreiro()
		{
			super(1);
			
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
