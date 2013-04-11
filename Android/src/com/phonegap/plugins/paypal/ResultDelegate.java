package com.phonegap.plugins.paypal;

import java.io.Serializable;

import android.util.Log;

import com.paypal.android.MECL.PayPalListener;

public class ResultDelegate implements PayPalListener, Serializable {

	@Override
	public void couldNotFetchDeviceReferenceToken() {
		Log.d("MECLPayPalPlugin", "couldNotFetchDeviceReferenceToken");
		MECLPayPalPlugin.getCallbackContext().error("couldNotFetchDeviceReferenceToken");
	}


	@Override
	public void receivedDeviceReferenceToken(String token) {
		Log.d("MECLPayPalPlugin", "Got token: "+token);
		MECLPayPalPlugin.getCallbackContext().success(token);
	}

}
