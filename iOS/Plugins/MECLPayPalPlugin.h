#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import "PayPal.h"


@interface MECLPayPalPlugin : CDVPlugin <DeviceReferenceTokenDelegate> {
	NSMutableDictionary* callbackIds;
	NSString *drt;
	BOOL tokenFetchAttempted;
}

@property (nonatomic, retain) NSMutableDictionary* callbackIds;
@property (nonatomic, retain) NSString *drt;
@property (nonatomic, assign) BOOL tokenFetchAttempted;

//Instance Method  
-(void)fetchDeviceReferenceTokenWithAppID:(NSMutableArray*)arguments withDict:(NSMutableArray*)options;
 
@end
