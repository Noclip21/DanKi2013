package screen
{
	import def.*;
	import building.*;
	
	
	public class Comercial extends BaseMc
	{
		var clicked :Boolean;
		var loja	:Loja;
		var money	:Number;
		
		
		public function Comercial()
		{
			clicked =	false;
			loja =		new Loja();
			money =		0;
			
			debug();
			
			BaseMc(this).display = Comercial_display;
		}
		function debug()
		{
			trace("MONEY: "+money+" PRODUCTS: "+loja.products.length+"\n[Premium: "+loja.premium.length+"][Mana: "+loja.nama.length+"][Taliban: "+loja.taliban.length+"]");
		}
		function Comercial_display()
		{
			if(Main.key.isDown(81) ||	// q
			   Main.key.isDown(65) ||	// a
			   Main.key.isDown(87) ||	// w
			   Main.key.isDown(83) ||	// s
			   Main.key.isDown(69) ||	// e 
			   Main.key.isDown(68) )	// d
			{
				if(!clicked)
				{
			  		clicked = true;
					
					if(Main.key.isDown(81))			// q
						loja.stockPremium();
					else if(Main.key.isDown(65))	// a
						lojaw.sellPremium();
					else if(Main.key.isDown(87))	// w
						loja.stockNama();
					else if(Main.key.isDown(83))	// s
						loja.sellNama();
					else if(Main.key.isDown(69))	// e
						loja.stockTaliban();
					else if(Main.key.isDown(68))	// d
						loja.sellTaliban();
						
					debug();
				}
			}else
				clicked = false;
		}
	}
	
}
