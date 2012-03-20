#import <Foundation/Foundation.h>
#ifdef PHONEGAP_FRAMEWORK
#import <PhoneGap/PGPlugin.h>
#else
#import "PGPlugin.h"
#endif
#import "PayPal.h"


@interface MECLPayPalPlugin : PGPlugin <DeviceReferenceTokenDelegate> {
	NSString* callbackID;
	NSString *drt;
	BOOL tokenFetchAttempted;
}

@property (nonatomic, copy) NSString* callbackID;
@property (nonatomic, retain) NSString *drt;
@property (nonatomic, assign) BOOL tokenFetchAttempted;

//Instance Method  
-(void)fetchDeviceReferenceTokenWithAppID:(NSMutableArray*)arguments withDict:(NSMutableArray*)options;
 
@end
