package product
{
	import def.*;
	
	
	public class Product extends BaseMc
	{
		static var objects	:Array;
		
		
		public var price	:Number;
						/*
						 *	$60 - Premium
						 *	$30 - Nama
						 *	$15 - Taliban
						 */
		public var id		:Number;
						/*
						 *	0 - Premium
						 *	1 - Nama
						 *	2 - Taliban
						 */
		
		
		public function Product(defId		:Number,
								defPrice	:Number)
		{
			if(!objects) objects = new Array();
			objects.push(this);
			
			id =	defId;
			price = defPrice;
			
			BaseMc(this).destructor = Product_destructor;
		}
		function Product_destructor()
		{
			Utils.removeObject(this,objects);
		}
	}
}
