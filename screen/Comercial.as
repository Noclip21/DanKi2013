package screen
{
	import def.*;
	import gui.*;
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
		var menu 	:MenuTop;
		
		var timer :Timer;
		
		var objGraph	 :Graph;
		var histogram 	 :Array;
		var maxHistogram :Number;
		
		
		public function Comercial()
		{
			clicked =	false;
			menu =		new MenuTop(Danki.stg,0,0);
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,timerLst);
			timer.start();
			
			objGraph = new Graph(Danki.stg,0,Main.height/2,Main.width,Main.height/2);
			maxHistogram = 100;
			histogram = new Array();
			for(var i=0; i<maxHistogram; ++i)
				histogram.push(0);
			
			Product.money = 100;
			
			debug();
			
			BaseMc(this).display = Comercial_display;
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
			trace("Money:",Product.money,"Num:",Product.numProducts);
			histogram.push(Product.money);
			histogram.splice(0,1);
			drawGraph();
		}
		function timerLst(e :TimerEvent)
		{
			Product.money -= Number((Danki.stg["imputGasto"]).text);
			
			if(Math.random()*100 <= Product.appeal(Product.PREMIUM))	Product.sell(Product.PREMIUM,1);
			if(Math.random()*100 <= Product.appeal(Product.NAMA))		Product.sell(Product.NAMA,1);
			if(Math.random()*100 <= Product.appeal(Product.TALIBAN))	Product.sell(Product.TALIBAN,1);
			
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
						Product.stock(Product.PREMIUM,1);
					else if(Main.key.isDown(50))	// 2
						Product.stock(Product.NAMA,1);
					else if(Main.key.isDown(51))	// 3
						Product.stock(Product.TALIBAN,1);
					
					else if(Main.key.isDown(81))	// q
						Product.upgrade(Product.PREMIUM);
					else if(Main.key.isDown(65))	// a
						Product.downgrade(Product.PREMIUM);
					else if(Main.key.isDown(87))	// w
						Product.upgrade(Product.NAMA);
					else if(Main.key.isDown(83))	// s
						Product.downgrade(Product.NAMA);
					else if(Main.key.isDown(69))	// e
						Product.upgrade(Product.TALIBAN);
					else if(Main.key.isDown(68))	// d
						Product.downgrade(Product.TALIBAN);
				}
			}else
				clicked = false;
		}
	}
	
}
