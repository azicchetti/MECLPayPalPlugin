#import "MECLPayPalPlugin.h"
#import <Cordova/CDV.h>

@implementation MECLPayPalPlugin
@synthesize commandReference, tokenFetchAttempted;

/* get the app id from developer.paypal.com */
#define PP_APP_ID @"APP-80W284485P519543T"
/* ENV_NONE (offline), ENV_SANDBOX or ENV_LIVE */
#define PP_APP_ENV ENV_SANDBOX

-(void)fetchDeviceReferenceTokenWithAppID:(CDVInvokedUrlCommand*)command
{
	self.commandReference = command;
	if (!tokenFetchAttempted) {
		tokenFetchAttempted = TRUE;
		[[PayPal getPayPalInst] fetchDeviceReferenceTokenWithAppID:PP_APP_ID forEnvironment:PP_APP_ENV withDelegate:self];
		return;
	}
}

- (void)dealloc {
	self.commandReference = nil;
	[super dealloc];
}


#pragma mark -
#pragma mark DeviceReferenceTokenDelegate methods

- (void)receivedDeviceReferenceToken:(NSString *)token {
	NSLog(@"DEVICE REFERENCE TOKEN: %@", token);
	tokenFetchAttempted = FALSE;
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:token];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.commandReference.callbackId];
}

//This method is called when a device reference token could not be fetched.
- (void)couldNotFetchDeviceReferenceToken {
	//optionally check the errorMessage property to see what the problem was
	NSLog(@"DEVICE REFERENCE TOKEN ERROR: %@", [PayPal getPayPalInst].errorMessage);

	tokenFetchAttempted = FALSE;
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:self.commandReference.callbackId];
}

@end
