package com.phonegap.plugins.paypal;

import org.json.JSONArray;
import android.util.Log;

import org.apache.cordova.api.Plugin;
import org.apache.cordova.api.PluginResult;
import org.apache.cordova.api.PluginResult.Status;

/**
 * @author Andrea Zicchetti 
 *
 */
public class MECLPayPalPlugin extends Plugin {
	private static MECLBridge mecl;
	private static MECLPayPalPlugin _instance;

	@Override
	public PluginResult execute(String action, JSONArray data, String callbackId) {
		PluginResult result=null;
		_instance=this;
		
		try{
			if (action.equals("fetchDeviceReferenceTokenWithAppID")){
				mecl = new MECLBridge(cordova.getActivity().getApplicationContext());
				mecl.initialize();
				result = new PluginResult(Status.OK);
			}
		} catch (Exception e){
		    Log.d("MECLPayPalPlugin", "Got JSON Exception "+ e.getMessage());
		    result = new PluginResult(Status.JSON_EXCEPTION);
		}
		return result;
	}
	
	public static Plugin getInstance(){ return _instance; }

}
