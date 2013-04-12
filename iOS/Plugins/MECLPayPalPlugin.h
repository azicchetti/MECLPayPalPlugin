#import <Cordova/CDV.h>
#import "PayPal.h"


@interface MECLPayPalPlugin : CDVPlugin <DeviceReferenceTokenDelegate> {
	CDVInvokedUrlCommand *commandReference;
	BOOL tokenFetchAttempted;
}

@property (nonatomic, retain) CDVInvokedUrlCommand *commandReference;
@property (nonatomic, assign) BOOL tokenFetchAttempted;

//Instance Method  
-(void)fetchDeviceReferenceTokenWithAppID:(CDVInvokedUrlCommand*)command;
 
@end
