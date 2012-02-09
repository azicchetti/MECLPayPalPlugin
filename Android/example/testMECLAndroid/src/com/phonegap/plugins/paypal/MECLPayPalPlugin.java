/**
 * 
 */
package com.phonegap.plugins.paypal;

import org.json.JSONArray;
import android.util.Log;

import com.phonegap.api.Plugin;
import com.phonegap.api.PluginResult;
import com.phonegap.api.PluginResult.Status;

/**
 * @author asus
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
				mecl = new MECLBridge(this.ctx);
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
