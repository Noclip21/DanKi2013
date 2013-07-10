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
		var menu 	:MenuTop;
		
		var clientStartPoints	:Array;
		var clientEndPoints		:Array;
		
		
		public function Comercial()
		{
			menu = new MenuTop(Danki.stg,0,0);
			
			clientStartPoints = [new Point(0,2*Main.height/5),
								 new Point(0,3*Main.height/5),
								 new Point(0,4*Main.height/5)];
								 
			clientEndPoints =	[new Point(Main.width,2*Main.height/5),
								 new Point(Main.width,3*Main.height/5),
								 new Point(Main.width,4*Main.height/5)];
			
			Product.money = 9999;
			
			BaseMc(this).display = Comercial_display;
		}
		
		function Comercial_display()
		{
			var lanes :Array =	[Math.floor(Math.random()*3),
							   	Math.floor(Math.random()*3),
							   	Math.floor(Math.random()*3)];
			
			
			var multiNama = ((ClientGuerreiro.objects)?ClientGuerreiro.objects.length:0);
			var multiPremium = ((ClientNobre.objects)?ClientNobre.objects.length:0) + Product.appeal(Product.PREMIUM)*Promotion.multiplier(Product.PREMIUM);
			
			if(Math.random()*multiPremium <= Product.appeal(Product.PREMIUM)*Promotion.multiplier(Product.PREMIUM))	new ClientNobre(	clientStartPoints[lanes[0]],clientEndPoints[lanes[0]]);
			if(Math.random()*multiNama <= Product.appeal(Product.NAMA)*Promotion.multiplier(Product.NAMA))		new ClientGuerreiro(clientStartPoints[lanes[1]],clientEndPoints[lanes[1]]);
			if(Math.random()*100 <= Product.appeal(Product.TALIBAN)*Promotion.multiplier(Product.TALIBAN))	new ClientCampones(	clientStartPoints[lanes[2]],clientEndPoints[lanes[2]]);
			
			
			if(Main.key.isDown(49)) 		Promotion.activate(1); // 1
			else if(Main.key.isDown(50))	Promotion.activate(2); // 2
			else if(Main.key.isDown(51))	Promotion.activate(3); // 3
		}
	}
	
}
