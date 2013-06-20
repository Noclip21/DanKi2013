package product
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Promotion
	{
		public static const DURATION :Number = 15000; // seconds
		public static const MAXLEVEL :Number = 3;
		
		static const _timer :Timer = new Timer(10000,1);
		
		static var _currentId :Number = 0;
		
				
		static const _lvlPromotion		:Array =	[[1,1,1], // base
													 [5,1,1],
													 [1,5,1],
													 [1,1,5]];
													 /*
													  * x = level
													  * y = product multiplier, premium, nama, taliban
													  */
		
		public static function validId(id :Number)
		{
			return (id >=0 && id <= MAXLEVEL);
		}
		
		public static function multiplier(productId :Number)
		{
			if(Product.validId(productId)) return _lvlPromotion[_currentId][productId];
			else							return 1;
		}
		
		public static function activate(id :Number)
		{
			if(validId(id) && !_timer.running)
			{
				_currentId = id;
				_timer.addEventListener(TimerEvent.TIMER_COMPLETE,countdownLst);
				_timer.start();
			}
		}
		
		static function countdownLst(e :TimerEvent)
		{
			_currentId = 0;
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER_COMPLETE,countdownLst);
		}

	}
	
}
