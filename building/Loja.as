package building
{
	import def.*;
	import product.*;
	
	
	public class Loja extends BaseMc
	{
		public static var objects :Array;
		
		
		public var maxProducts	:Number = 50;
		public var products		:Array;
		
		public var maxClients	:Number = 3;
		public var clients		:Array;
		
		
		public function Loja()
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			products =	new Array();
			for(var i=0; i<Product.NUMPRODUCTS; ++i)
				products[i] = new Number(0);
			clients =	new Array();
			
			
			BaseMc(this).destructor = Loja_destructor;
		}
		function Loja_destructor()
		{
			Utils.removeObject(this,objects);
		}
		
		public function totalProducts()
		{
			var len :Number = 0;
			for(var i=0; i<Product.NUMPRODUCTS; ++i)
				len += products[i];
			return len;
		}
		public function stockProduct(id :Number)
		{
			if(totalProducts() < maxProducts)
				products[id]++;
		}
		public function sellProduct(id :Number)
		{
			if(Product.validId(id))
				if(products[id] > 0)
					products[id]--;
		}
	}
}
