package gui
{
	import def.*;
	import product.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class MenuTop extends BaseMc
	{
		public function set txtTalibanNum(n)	{ GUITaliban.num.text = n; 			}
		public function set txtNamaNum(n)		{ GUINama.num.text =	n;			}
		public function set txtPremiumNum(n)	{ GUIPremium.num.text = n;			}
		
		public function set txtTalibanPrice(n)	{ GUITaliban.price.text =	"$"+n;	}
		public function set txtNamaPrice(n)		{ GUINama.price.text =		"$"+n;	}
		public function set txtPremiumPrice(n)	{ GUIPremium.price.text =	"$"+n;	}
		
		public function set txtPopup(n)			{ popup.msg.text = n;				}
		
		
		public function MenuTop(defParent	:MovieClip,
								posx		:Number = 0,
								posy		:Number = 0)
		{
			super(defParent,posx,posy);
			
			
			txtTalibanNum = txtNamaNum = txtPremiumNum = txtTalibanPrice = txtNamaPrice = txtPremiumPrice = "00";
			
			
			BaseMc(this).display = MenuTop_display;
			
			
				// mouse click
			btStockTaliban.addEventListener(MouseEvent.CLICK,		btStockTalibanClickLst);
			btStockNama.addEventListener(MouseEvent.CLICK,			btStockNamaClickLst);
			btStockPremium.addEventListener(MouseEvent.CLICK,		btStockPremiumClickLst);
			
			btUpTaliban.addEventListener(MouseEvent.CLICK,			btUpTalibanClickLst);
			btUpNama.addEventListener(MouseEvent.CLICK,				btUpNamaClickLst);
			btUpPremium.addEventListener(MouseEvent.CLICK,			btUpPremiumClickLst);
			
			btDownTaliban.addEventListener(MouseEvent.CLICK,		btDownTalibanClickLst);
			btDownNama.addEventListener(MouseEvent.CLICK,			btDownNamaClickLst);
			btDownPremium.addEventListener(MouseEvent.CLICK,		btDownPremiumClickLst);
			
				// mouse move
			btStockTaliban.addEventListener(MouseEvent.MOUSE_MOVE,	mouseMoveLst);
			btStockNama.addEventListener(MouseEvent.MOUSE_MOVE,		mouseMoveLst);
			btStockPremium.addEventListener(MouseEvent.MOUSE_MOVE,	mouseMoveLst);
			
			btUpTaliban.addEventListener(MouseEvent.MOUSE_MOVE,		mouseMoveLst);
			btUpNama.addEventListener(MouseEvent.MOUSE_MOVE,		mouseMoveLst);
			btUpPremium.addEventListener(MouseEvent.MOUSE_MOVE,		mouseMoveLst);
			
			btDownTaliban.addEventListener(MouseEvent.MOUSE_MOVE,	mouseMoveLst);
			btDownNama.addEventListener(MouseEvent.MOUSE_MOVE,		mouseMoveLst);
			btDownPremium.addEventListener(MouseEvent.MOUSE_MOVE,	mouseMoveLst);
			
				// mouse over
			btStockTaliban.addEventListener(MouseEvent.MOUSE_OVER,	btStockTalibanOverLstOverLst);
			btStockNama.addEventListener(MouseEvent.MOUSE_OVER,		btStockNamaOverLst);
			btStockPremium.addEventListener(MouseEvent.MOUSE_OVER,	btStockPremiumOverLst);
			
			btUpTaliban.addEventListener(MouseEvent.MOUSE_OVER,		btUpTalibanOverLst);
			btUpNama.addEventListener(MouseEvent.MOUSE_OVER,		btUpNamaOverLst);
			btUpPremium.addEventListener(MouseEvent.MOUSE_OVER,		btUpPremiumOverLst);
			
			btDownTaliban.addEventListener(MouseEvent.MOUSE_OVER,	btDownTalibanOverLst);
			btDownNama.addEventListener(MouseEvent.MOUSE_OVER,		btDownNamaOverLst);
			btDownPremium.addEventListener(MouseEvent.MOUSE_OVER,	btDownPremiumOverLst);
			
				// mouse out
			btStockTaliban.addEventListener(MouseEvent.MOUSE_OUT,	mouseOutLst);
			btStockNama.addEventListener(MouseEvent.MOUSE_OUT,		mouseOutLst);
			btStockPremium.addEventListener(MouseEvent.MOUSE_OUT,	mouseOutLst);
			
			btUpTaliban.addEventListener(MouseEvent.MOUSE_OUT,		mouseOutLst);
			btUpNama.addEventListener(MouseEvent.MOUSE_OUT,			mouseOutLst);
			btUpPremium.addEventListener(MouseEvent.MOUSE_OUT,		mouseOutLst);
			
			btDownTaliban.addEventListener(MouseEvent.MOUSE_OUT,	mouseOutLst);
			btDownNama.addEventListener(MouseEvent.MOUSE_OUT,		mouseOutLst);
			btDownPremium.addEventListener(MouseEvent.MOUSE_OUT,	mouseOutLst);
		}
		function MenuTop_display()
		{
			txtPremiumNum =		Product.numStock(Product.PREMIUM);
			txtNamaNum =		Product.numStock(Product.NAMA);
			txtTalibanNum =		Product.numStock(Product.TALIBAN);
			
			txtPremiumPrice =	Product.sellPrice(Product.PREMIUM);
			txtNamaPrice =		Product.sellPrice(Product.NAMA);
			txtTalibanPrice =	Product.sellPrice(Product.TALIBAN);
		}
		
		
		function btStockTalibanClickLst(e :MouseEvent)	{ Product.stock(Product.TALIBAN,1);		}
		function btStockNamaClickLst(e :MouseEvent)		{ Product.stock(Product.NAMA,1);		}
		function btStockPremiumClickLst(e :MouseEvent)	{ Product.stock(Product.PREMIUM,1); 	}
		
		function btUpTalibanClickLst(e :MouseEvent)		{ Product.upgrade(Product.TALIBAN); 	}
		function btUpNamaClickLst(e :MouseEvent)			{ Product.upgrade(Product.NAMA);	}
		function btUpPremiumClickLst(e :MouseEvent)		{ Product.upgrade(Product.PREMIUM); 	}
		
		function btDownTalibanClickLst(e :MouseEvent)	{ Product.downgrade(Product.TALIBAN);	}
		function btDownNamaClickLst(e :MouseEvent)		{ Product.downgrade(Product.NAMA);		}
		function btDownPremiumClickLst(e :MouseEvent)	{ Product.downgrade(Product.PREMIUM);	}
		
		
		function mouseMoveLst(e :MouseEvent)
		{
			popup.x = e.target.x + e.target.mouseX + 10;
			popup.y = e.target.y + e.target.mouseY - 10;
		}
		
		
		function btStockTalibanOverLstOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.stockPrice(Product.TALIBAN);
		}
		function btStockNamaOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.stockPrice(Product.NAMA);
		}
		function btStockPremiumOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.stockPrice(Product.PREMIUM);
		}
		
		function btUpTalibanOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.upgradePrice(Product.TALIBAN);
		}
		function btUpNamaOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.upgradePrice(Product.NAMA);
		}
		function btUpPremiumOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.upgradePrice(Product.PREMIUM);
		}
		
		function btDownTalibanOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.upgradePrice(Product.TALIBAN);
		}
		function btDownNamaOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.upgradePrice(Product.NAMA);
		}
		function btDownPremiumOverLst(e :MouseEvent)
		{
			popup.visible = true;
			txtPopup = "$"+Product.upgradePrice(Product.PREMIUM);
		}
		
		
		function mouseOutLst(e :MouseEvent)
		{
			popup.visible = false;
		}
	}
	
}
