var	paymentUrl="http://paydemo.sms4me.com/ECDemo-server/cart.jsp?",
	cancelUrl="paydemo.sms4me.com/ECDemo-server/cancel.html",
	successUrl="paydemo.sms4me.com/ECDemo-server/confirm.jsp"
;

function checkPlugins(){
	if (!window.plugins.meclPayPal || !window.plugins.childBrowser){
		alert("Error: your application is not properly built (missing meclPaypal or childBrowser)");
		return false;
	}
	return true;
}

function startPaymentHandler(){
	if (!checkPlugins()) return;
	window.plugins.meclPayPal.fetchDeviceReferenceTokenWithAppID( function(token){
		if (!token){
			alert("Error. Can't contact PayPal servers. Please check your internet connection");
			window.plugins.childBrowser.close();
			return;
		}
		$(".pptoken").html("Paypal MECL token: "+token);
		window.plugins.childBrowser.showWebPage(paymentUrl+"drt="+token);
	} );
}

function checkPaymentStatus(loc){
	var args=null;
	if (loc.indexOf(cancelUrl)!=-1){
		alert("Payment was canceled");
	} else if (loc.indexOf(successUrl)!=-1){
		args=loc.replace(/.*?[?]/,"");
		alert("Payment ok!");
	} else {
		return;
	}
	if (args){
		$(".status").html("Payment success arguments: "+args);
	}
	window.plugins.childBrowser.close();
}

$(function(){
	$(".startPayment").bind("click",startPaymentHandler);
});

document.addEventListener("deviceready",function(){
	if (typeof(ChildBrowser)!="undefined" && ChildBrowser.install){
		ChildBrowser.install();
	}
	if (!checkPlugins()) return;
	window.plugins.childBrowser.onLocationChange=checkPaymentStatus;
},false);
