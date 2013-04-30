package building
{
	import def.*;
	import product.*;
	
	
	public class Loja extends BaseMc
	{
		public static var objects :Array;
		
		
		public var maxProducts	:Number = 50;
		public var products		:Array;
		public var premium		:Array;
		public var nama			:Array;
		public var taliban		:Array;
		
		
		public function Loja()
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			products =	new Array();
			premium =	new Array();
			nama =		new Array();
			taliban =	new Array();
			
			BaseMc(this).destructor = Loja_destructor;
		}
		function Loja_destructor()
		{
			for(var i=0; i<products.length; ++i)
				BaseMc(products[i]).kill();
			Utils.removeObject(this,objects);
		}
		
		public function stockPremium()
		{
			if(products.length < maxProducts)
			{
				var p :Product = new Premium();
					products.push(p);
					premium.push(p);
			}
		}
		public function stockNama()
		{
			if(products.length < maxProducts)
			{
				var p :Product = new Nama();
					products.push(p);
					nama.push(p);
			}
		}
		public function stockTaliban()
		{
			if(products.length < maxProducts)
			{
				var p :Product = new Taliban();
					products.push(p);
					taliban.push(p);
			}
		}
		
		public function sellPremium()
		{
			if(products.length > 0)
			{
				BaseMc(products[0]).kill();
				products.shift();
				if(premium.length > 0)
					premium.shift();
			}
		}
		public function sellNama()
		{
			if(products.length > 0)
			{
				BaseMc(products[0]).kill();
				products.shift();
				if(nama.length > 0)
					nama.shift();
			}
		}
		public function sellTaliban()
		{
			if(products.length > 0)
			{
				BaseMc(products[0]).kill();
				products.shift();
				if(taliban.length > 0)
					taliban.shift();
			}
		}
	}
}
