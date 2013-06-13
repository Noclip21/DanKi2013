package unit
{
	import def.*;
	import product.*;
	import building.*;
	import flash.geom.Point;
	
	public class Client extends Unit
	{
		public static var objects :Array;
		
		
		var _preference	:Number;
		
		var _startPoint	:Point;
		var _endPoint	:Point;
		
		var _purchased :Boolean;
		
		
		public function Client(defPreference	:Number,
							   defStartPoint	:Point,
							   defEndPoint		:Point)
		{
			super(defStartPoint);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			_preference =	defPreference;
			_startPoint =	defStartPoint;
			_endPoint = 	defEndPoint;
			_purchased = false;
			_speed = 6;
			
			BaseMc(this).display = Client_display;
			BaseMc(this).destructor = Client_destructor;
		}
		function Client_destructor()
		{
			Utils.removeObject(this,objects);
		}
		
		function buyProduct()
		{
			_purchased = true;
			return Product.sell(_preference,1);
		}
		
		function Client_display()
		{
			if(!_purchased)
			{
				if(movePoint(_endPoint))	buyProduct();
			}else
				if(movePoint(_startPoint))	kill();
		}
	}
}
