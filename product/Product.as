package product
{
	public class Product
	{
		public static const NUMPRODUCTS :Number = 3;
		public static const MAXLEVEL	:Number = 2;
		
		static const lvl :Array = [0,0,0];
		static const lvlPrice :Array = [[40,50,60],
										[20,25,30],
										[5,10,15]];
										/*
										 *	$40,50,60 - Premium
										 *	$20,25,30 - Nama
										 *	$5,10,15 - Taliban
										 */
		
		
		static function price(id :Number)
		{
			if(validId(id))	return lvlPrice[id][lvl[id]];
			else			return 0;
		}
		public static function validId(id :Number)
		{
			return (id >= 0 && id < NUMPRODUCTS);
		}
		public static function upgrade(id :Number)
		{
			if(validId(id))
			{
				if(lvl[id] + 1 <= MAXLEVEL) lvl[id]++;
				return lvl[id];
			}else
				return -1;
		}
		public static function downgrade(id :Number)
		{
			if(validId(id))
			{
				if(lvl[id] - 1 >= 0) lvl[id]--;
				return lvl[id];
			}else
				return -1;
		}
	}
}
