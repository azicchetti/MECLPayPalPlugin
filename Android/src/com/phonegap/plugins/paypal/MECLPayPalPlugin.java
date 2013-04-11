package com.phonegap.plugins.paypal;

import org.json.JSONArray;
import android.util.Log;

import org.apache.cordova.api.CallbackContext;
import org.apache.cordova.api.CordovaPlugin;

/**
 * @author Andrea Zicchetti 
 *
 */
public class MECLPayPalPlugin extends CordovaPlugin {
	private static MECLBridge mecl;
	private static MECLPayPalPlugin _instance;
	private static CallbackContext _callbackContext;

	@Override
	public boolean execute(String action, JSONArray data, CallbackContext callbackContext) {
		_instance=this;
		_callbackContext=callbackContext;
		
		try{
			if (action.equals("fetchDeviceReferenceTokenWithAppID")){
				mecl = new MECLBridge(cordova.getActivity().getApplicationContext());
				mecl.initialize();
				return true;
			}
		} catch (Exception e){
		    Log.d("MECLPayPalPlugin", "Got JSON Exception "+ e.getMessage());
		}
		return false;
	}
	
	public static CordovaPlugin getInstance(){
		return _instance;
	}

	public static CallbackContext getCallbackContext() {
		return _callbackContext;
	}

}
