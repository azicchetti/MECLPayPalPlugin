var MECLPayPal=function(){};
MECLPayPal.prototype.fetchDeviceReferenceTokenWithAppID=function(callback){
	MECLPayPal._callback=callback;
	PhoneGap.exec(null,null,"MECLPayPalPlugin","fetchDeviceReferenceTokenWithAppID",[]);
}
PhoneGap.addConstructor(function(){
	if (!window.plugins) window.plugins={};
	window.plugins.meclPayPal=new MECLPayPal();
});
