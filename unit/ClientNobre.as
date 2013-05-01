package unit
{
	import def.*;
	
	
	public class ClientNobre extends Client
	{
		public static var objects :Array;
		
		
		public function ClientNobre()
		{
			super(0);
			
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
