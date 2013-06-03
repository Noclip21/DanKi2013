package product
{
	public class Product
	{
		public static const FLAVOURS	:Number = 3;
		public static const MAXLEVEL	:Number = 2;
		public static const MAXSTOCK	:Number = 50;
		
		public static const PREMIUM		:Number = 0;
		public static const NAMA		:Number = 1;
		public static const TALIBAN		:Number = 2;
		
		static const _lvl		:Array =	[0,0,0];
		static const _stock		:Array =	[0,0,0];
		static var _numProducts	:Number =	0;
		static var _money		:Number =	0;
		
		
		static const _lvlStockPrice		:Array =	[[0,0,0],
											 		 [0,0,0],
											 		 [0,0,0]];
											 		/*
											 		 *	Premium
											 		 *	Nama
											 		 *	Taliban
													 */
											  
		static const _lvlUpgradePrice	:Array =	[[0,0,0],
											 		 [0,0,0],
											 		 [0,0,0]];
											 		/*
											 		 *	Premium
											 		 *	Nama
													 *	Taliban
													 */
											  
		static const _lvlSellPrice		:Array = 	[[40,50,60],
													 [20,25,30],
													 [5,10,15]];
													/*
													 *	$40,50,60 - Premium
													 *	$20,25,30 - Nama
												 	 *	$5,10,15 - Taliban
												 	 */
											 
		static const _lvlAppeal			:Array =	[[50,35,20],
													 [50,35,20],
									 				 [50,35,20]];
													/*
													 *	50,35,20 - Premium
													 *	50,35,20 - Nama
													 *	50,35,20 - Taliban
													 */
		
		
		public static function get numProducts()	{ return _numProducts;	}
		public static function get money()			{ return _money;		}
		public static function set money(n :Number)	{ _money = n;			}
		
		
		public static function validId(id :Number)		{ return (id >= 0 && id < FLAVOURS);													}
		
		public static function numStock(id :Number)		{ return (validId(id))?								_stock[id]:						-1; }
		public static function level(id :Number)		{ return (validId(id))?								_lvl[id]:						-1;	}
		public static function stockPrice(id :Number)	{ return (validId(id))?								_lvlStockPrice[id][_lvl[id]]:	-1;	}
		public static function upgradePrice(id :Number)	{ return (validId(id))?								_lvlUpgradePrice[id][_lvl[id]]:	-1;	}
		public static function sellPrice(id :Number)	{ return (validId(id))?								_lvlSellPrice[id][_lvl[id]]:	-1;	}
		public static function appeal(id :Number)		{ return (validId(id))?								_lvlAppeal[id][_lvl[id]]:		-1;	}
		
		
		public static function upgrade(id :Number)
		{
			if(validId(id))
			if(_lvl[id] + 1 <= MAXLEVEL)
			{
				_lvl[id]++;
				if(_money - upgradePrice(id) >= 0)	_money -= upgradePrice(id);
				else								_lvl[id]--;
			}
		}
		public static function downgrade(id :Number)
		{
			if(validId(id))
			if(_lvl[id] - 1 >= 0)
			{
				_lvl[id]--;
				if(_money - upgradePrice(id) >= 0)	_money -= upgradePrice(id);
				else								_lvl[id]++;
			}
		}
		public static function stock(id :Number,n :Number)
		{
			if(validId(id) && n > 0)
			if(_numProducts + n <= MAXSTOCK)
			{
				if(_money - stockPrice(id)*n >= 0)
				{
					_money -= stockPrice(id)*n;
					_numProducts += n;
					_stock[id] += n;
				}else
					stock(id,int(_money/stockPrice(id)));
			}else
				stock(id,MAXSTOCK-_numProducts);
		}
		public static function sell(id :Number,n :Number)
		{
			if(validId(id) && n > 0)
			if(_stock[id] - n >= 0)
			{
				_money += sellPrice(id)*n;
				_numProducts -= n;
				_stock[id] -= n;
			}else
				sell(id,_stock[id]);
		}
	}
}
