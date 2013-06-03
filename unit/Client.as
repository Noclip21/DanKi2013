package unit
{
	import def.*;
	import product.*;
	import building.*;
	
	public class Client extends BaseMc
	{
		public static var objects :Array;
		
		
		//public var loja :Loja;
		
		
		var preference	:Number;
		
		
		public function Client(defPreference :Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			preference = defPreference;
			
			BaseMc(this).destructor = Client_destructor;
		}
		function Client_destructor()
		{
			Utils.removeObject(this,objects);
		}
		
		public function buyProduct()
		{
			/*if(loja)*/	return Product.sell(preference,1);
			//else		return false;
		}
	}
}
