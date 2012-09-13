;(function(cordova){
	
	function MECLPayPal() {};

	MECLPayPal.prototype.fetchDeviceReferenceTokenWithAppID=function(callback){
		window.plugins.meclPayPal._callback=callback;
		cordova.exec(null,null,"MECLPayPalPlugin","fetchDeviceReferenceTokenWithAppID",[]);
	}

	if (!window.plugins) window.plugins={};
	window.plugins.meclPayPal=new MECLPayPal();

})(window.cordova || window.Cordova || window.PhoneGap);
