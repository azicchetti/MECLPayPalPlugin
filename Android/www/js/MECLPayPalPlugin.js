;(function(cordova){

	function MECLPayPal() {};

	MECLPayPal.prototype.fetchDeviceReferenceTokenWithAppID=function(callback){
		cordova.exec(function(message){
			callback(message); // the token
		},function(error){
			callback(null); // fail
		}, "MECLPayPalPlugin", "fetchDeviceReferenceTokenWithAppID", []);
	}

	if (!window.plugins) window.plugins={};
	window.plugins.meclPayPal=new MECLPayPal();

})(window.cordova || window.Cordova || window.PhoneGap);
