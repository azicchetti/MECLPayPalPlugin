package com.phonegap.plugins.paypal;

import java.io.Serializable;

import com.paypal.android.MECL.PayPalListener;

public class ResultDelegate implements PayPalListener, Serializable {

	@Override
	public void couldNotFetchDeviceReferenceToken() {
		MECLPayPalPlugin.getInstance()
			.sendJavascript("window.plugins.meclPayPal._callback(null);");
	}

	@Override
	public void receivedDeviceReferenceToken(String token) {
		MECLPayPalPlugin.getInstance()
			.sendJavascript("window.plugins.meclPayPal._callback('"+token+"');");

	}

}
