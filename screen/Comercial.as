package screen
{
	import def.*;
	import building.*;
	import unit.*;
	
	
	public class Comercial extends BaseMc
	{
		var clicked :Boolean;
		var loja	:Loja;
		var client1	:ClientNobre;
		var client2	:ClientGuerreiro;
		var client3	:ClientCampones;
		var money	:Number;
		
		
		public function Comercial()
		{
			clicked =	false;
			loja =		new Loja();
			client1 =	new ClientNobre();
			client2 =	new ClientGuerreiro();
			client3 =	new ClientCampones();
			client1.loja = client2.loja = client3.loja = loja;
			money =		0;
			
			debug();
			
			BaseMc(this).display = Comercial_display;
		}
		function debug()
		{
			trace("MONEY: "+money+" PRODUCTS: "+loja.totalProducts()+"\n[Premium: "+loja.products[0]+"][Mana: "+loja.products[1]+"][Taliban: "+loja.products[2]+"]");
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
						loja.stockProduct(0);
					else if(Main.key.isDown(65))	// a
						client1.buyProduct();
					else if(Main.key.isDown(87))	// w
						loja.stockProduct(1);
					else if(Main.key.isDown(83))	// s
						client2.buyProduct();
					else if(Main.key.isDown(69))	// e
						loja.stockProduct(2);
					else if(Main.key.isDown(68))	// d
						client3.buyProduct();
						
					debug();
				}
			}else
				clicked = false;
		}
	}
	
}
