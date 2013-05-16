package screen
{
	import def.*;
	import unit.*;
	import graph.*;
	import product.*;
	import building.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	
	
	public class Comercial extends BaseMc
	{
		var clicked :Boolean;
		var loja	:Loja;
		
		var client1	:ClientNobre;
		var client2	:ClientGuerreiro;
		var client3	:ClientCampones;
		
		var client1Chance :Array = [50,35,20];
		var client2Chance :Array = [50,35,20];
		var client3Chance :Array = [50,35,20];
		
		var money :Number;
		
		var timer :Timer;
		
		var objGraph	 :Graph;
		var histogram 	 :Array;
		var maxHistogram :Number;
		
		
		public function Comercial()
		{
			clicked =	false;
			loja =		new Loja();
			client1 =	new ClientNobre();
			client2 =	new ClientGuerreiro();
			client3 =	new ClientCampones();
			client1.loja = client2.loja = client3.loja = loja;
			money =		100;
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,timerLst);
			timer.start();
			
			objGraph = new Graph(Danki.stg,0,Main.height/2,Main.width,Main.height/2);
			maxHistogram = 100;
			histogram = new Array();
			for(var i=0; i<maxHistogram; ++i)
				histogram.push(0);
			
			
			debug();
			
			BaseMc(this).display = Comercial_display;
		}
		function printProduct()
		{
			(Danki.stg["msgProduct"]).text = "[Premium: "+loja.products[0]+"/$"+Product.price(0)+"][Nama: "+loja.products[1]+"/$"+Product.price(1)+"][Taliban: "+	loja.products[2]+"/$"+Product.price(2)+"]";
		}
		function printClient()
		{
			(Danki.stg["msgClient"]).text = "[Campones: "+client1Chance[Product.level(0)]+"%][Guerreiro: "+client2Chance[Product.level(1)]+"%][Nobre: "+client3Chance[Product.level(2)]+"%]";
		}
		function printMoney()
		{
			(Danki.stg["msgMoney"]).text = "[Money: $"+money+"]";
		}
		function drawGraph()
		{
			for(var i=0; i<maxHistogram; ++i)
			{
				objGraph.point = new Point(i*10,histogram[i]);
			}
			
			objGraph.drawPoints();
		}
		function debug()
		{
			//trace("MONEY: "+money+" PRODUCTS: "+loja.totalProducts()+"\n[Premium: "+loja.products[0]+"][Nama: "+loja.products[1]+"][Taliban: "+loja.products[2]+"]");
			
			printProduct();
			printClient();
			printMoney();
			drawGraph();
		}
		function addMoney(n :Number)
		{
			money += n;
			histogram.push(money);
			histogram.splice(0,1);
		}
		function timerLst(e :TimerEvent)
		{
			addMoney(-Number((Danki.stg["imputGasto"]).text));
			
			if(Math.random()*100 <= client1Chance[Product.level(0)])
				if(client1.buyProduct())
					addMoney(Product.price(0));
			
			if(Math.random()*100 <= client2Chance[Product.level(1)])
				if(client2.buyProduct())
					addMoney(Product.price(1));
					
			if(Math.random()*100 <= client3Chance[Product.level(2)])
				if(client3.buyProduct())
					addMoney(Product.price(2));
					
			debug();
		}
		function Comercial_display()
		{
			
			/*
			[1] = Estoca Premium
			[2] = Estoca Nama
			[3] = Estoca Taliban
			[Q/A] = Aumenta / diminui preço Premium
			[W/S] = Aumenta / diminui preço Nama
			[E/D] = Aumenta / diminui preço Taliban
			*/
			
			
			if(Main.key.isDown(49) ||	// 1
			   Main.key.isDown(50) ||	// 2
			   Main.key.isDown(51) ||	// 3
			   Main.key.isDown(81) ||	// q
			   Main.key.isDown(65) ||	// a
			   Main.key.isDown(87) ||	// w
			   Main.key.isDown(83) ||	// s
			   Main.key.isDown(69) ||	// e 
			   Main.key.isDown(68) )	// d
			{
				if(!clicked)
				{
			  		clicked = true;
					
					if(Main.key.isDown(49))			// 1
						loja.stockProduct(0);
					else if(Main.key.isDown(50))	// 2
						loja.stockProduct(1);
					else if(Main.key.isDown(51))	// 3
						loja.stockProduct(2);
					
					else if(Main.key.isDown(81))	// q
						Product.upgrade(0);
					else if(Main.key.isDown(65))	// a
						Product.downgrade(0);
					else if(Main.key.isDown(87))	// w
						Product.upgrade(1);
					else if(Main.key.isDown(83))	// s
						Product.downgrade(1);
					else if(Main.key.isDown(69))	// e
						Product.upgrade(2);
					else if(Main.key.isDown(68))	// d
						Product.downgrade(2);
						
					debug();
				}
			}else
				clicked = false;
		}
	}
	
}
