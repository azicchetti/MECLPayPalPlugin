package com.phonegap.plugins.paypal;

import android.content.Context;
import com.paypal.android.MECL.PayPal;

public class MECLBridge {

    Context mecl_context;
    
    // The PayPal server to be used - can also be ENV_NONE and ENV_LIVE
    private static final int server = PayPal.ENV_SANDBOX;
    // The ID of your application that you received from PayPal
    private static final String appID = "APP-80W284485P519543T";
		
	public MECLBridge(Context ctx) {
		mecl_context = ctx;
	}

	public void initialize() {
		Thread libraryInitializationThread = new Thread() {
			public void run() {
			//Initialize the library
				initLibrary();
			}
        	};
	        libraryInitializationThread.start();	
	}
	
	private void initLibrary() {
		// This is the main initialization call that takes in your Context, the Application ID, the server you would like to connect to, and your PayPalListener
		PayPal.fetchDeviceReferenceTokenWithAppID(mecl_context, appID, server, new ResultDelegate());

		// -- These are required settings.
		PayPal.getInstance().setLanguage("en_US"); // Sets the language for the library.
	}

}
