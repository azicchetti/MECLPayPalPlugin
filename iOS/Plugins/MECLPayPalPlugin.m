#import "MECLPayPalPlugin.h"

@implementation MECLPayPalPlugin
@synthesize callbackIds=_callbackIds;
@synthesize drt, tokenFetchAttempted;

/* get the app id from developer.paypal.com */
#define PP_APP_ID @"APP-80W284485P519543T"
/* ENV_NONE (offline), ENV_SANDBOX or ENV_LIVE */
#define PP_APP_ENV ENV_SANDBOX

- (NSMutableDictionary*)callbackIds {
	if(_callbackIds == nil) {
		_callbackIds = [[NSMutableDictionary alloc] init];
	}
	return _callbackIds;
}

-(void)fetchDeviceReferenceTokenWithAppID:(NSMutableArray*)arguments withDict:(NSMutableArray*)options {
	if (!tokenFetchAttempted) {
		tokenFetchAttempted = TRUE;
		[[PayPal getPayPalInst] fetchDeviceReferenceTokenWithAppID:PP_APP_ID forEnvironment:PP_APP_ENV withDelegate:self];
		return;
	}
}

- (void)dealloc {
	[_callbackIds dealloc];
	self.drt = nil;
	[super dealloc];
}


#pragma mark -
#pragma mark DeviceReferenceTokenDelegate methods

- (void)receivedDeviceReferenceToken:(NSString *)token {
	//NSLog(@"DEVICE REFERENCE TOKEN: %@", token);
	self.drt = token;
	tokenFetchAttempted = FALSE;
	NSString* jsCallback = [NSString stringWithFormat:@"window.plugins.meclPayPal._callback('%@');",self.drt]; 
	[self writeJavascript:jsCallback];
}

//This method is called when a device reference token could not be fetched.
- (void)couldNotFetchDeviceReferenceToken {
	//optionally check the errorMessage property to see what the problem was
	NSLog(@"DEVICE REFERENCE TOKEN ERROR: %@", [PayPal getPayPalInst].errorMessage);

	//clear any previously-stored token
	self.drt = nil;
	tokenFetchAttempted = FALSE;
	NSString* jsCallback = [NSString stringWithFormat:@"window.plugins.meclPayPal._callback(%@);",@"null"]; 
	[self writeJavascript:jsCallback];
}

@end
