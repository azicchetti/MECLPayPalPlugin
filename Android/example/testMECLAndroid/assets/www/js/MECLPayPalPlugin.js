var MECLPayPal=function(){};
MECLPayPal.prototype.fetchDeviceReferenceTokenWithAppID=function(callback){
	MECLPayPal._callback=callback;
	PhoneGap.exec(null, null, "MECLPayPalPlugin",
		"fetchDeviceReferenceTokenWithAppID",[]
	);
}
PhoneGap.addConstructor(function() {
    PhoneGap.addPlugin('meclPayPal', new MECLPayPal());
});