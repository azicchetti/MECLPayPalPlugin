#import "MECLPayPalPlugin.h"

@implementation MECLPayPalPlugin
@synthesize callbackID, drt, tokenFetchAttempted;

/* get the app id from developer.paypal.com */
#define PP_APP_ID @"APP-80W284485P519543T"
/* ENV_NONE (offline), ENV_SANDBOX or ENV_LIVE */
#define PP_APP_ENV ENV_SANDBOX

-(void)fetchDeviceReferenceTokenWithAppID:(NSMutableArray*)arguments withDict:(NSMutableArray*)options {
	if (!tokenFetchAttempted) {
		tokenFetchAttempted = TRUE;
		[[PayPal getPayPalInst] fetchDeviceReferenceTokenWithAppID:PP_APP_ID forEnvironment:PP_APP_ENV withDelegate:self];
		return;
	}
}

- (void)dealloc {
	self.callbackID = nil;
	self.drt = nil;
    [super dealloc];
}


#pragma mark -
#pragma mark DeviceReferenceTokenDelegate methods

- (void)receivedDeviceReferenceToken:(NSString *)token {
	//NSLog(@"DEVICE REFERENCE TOKEN: %@", token);
	self.drt = token;
	tokenFetchAttempted = FALSE;
	NSString* jsCallback = [NSString stringWithFormat:@"MECLPayPal._callback('%@');",self.drt]; 
	[self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}

//This method is called when a device reference token could not be fetched.
- (void)couldNotFetchDeviceReferenceToken {
	//optionally check the errorMessage property to see what the problem was
	NSLog(@"DEVICE REFERENCE TOKEN ERROR: %@", [PayPal getPayPalInst].errorMessage);

	//clear any previously-stored token
	self.drt = nil;
	tokenFetchAttempted = FALSE;
	NSString* jsCallback = [NSString stringWithFormat:@"MECLPayPal._callback(%@);",@"null"]; 
	[self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}

@end
