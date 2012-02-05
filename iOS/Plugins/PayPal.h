//
//  PayPal.h
//
//
//
//

#import <UIKit/UIKit.h>


typedef enum PayPalEnvironment {
	ENV_LIVE,
	ENV_SANDBOX,
	ENV_NONE,
} PayPalEnvironment;

typedef enum PayPalButtonType {
	BUTTON_118x24,
	BUTTON_152x33,
	BUTTON_194x37,
	BUTTON_278x43,
	BUTTON_294x43,
	BUTTON_TYPE_COUNT,
}PayPalButtonType;

@protocol DeviceReferenceTokenDelegate <NSObject>

@required
- (void)receivedDeviceReferenceToken:(NSString *)token;
- (void)couldNotFetchDeviceReferenceToken; //check the errorMessage property to see what the problem was

@end


@interface PayPal : NSObject <UIWebViewDelegate> {
	@private
	BOOL initialized;//determines if the initialization call has finished and the PayPal object is initialized.
	BOOL paymentsEnabled;
	NSString *appID;
	NSString *lang;
	PayPalEnvironment environment;
	
	NSString *errorMessage;
	NSMutableArray *payButtons;
	
	id<DeviceReferenceTokenDelegate> delegate;
}

@property (nonatomic, retain) NSString *lang;
@property (nonatomic, retain) NSString *errorMessage;
@property (nonatomic, retain) NSMutableArray *payButtons;

@property (nonatomic, readonly) NSString *appID;
@property (nonatomic, readonly) BOOL initialized;
@property (nonatomic, readonly) BOOL paymentsEnabled;
@property (nonatomic, readonly) PayPalEnvironment environment;

+ (PayPal*)getPayPalInst;

- (void)fetchDeviceReferenceTokenWithAppID:(NSString const *)inAppID forEnvironment:(PayPalEnvironment)env withDelegate:(id<DeviceReferenceTokenDelegate>)del;
- (void)fetchDeviceReferenceTokenWithAppID:(NSString const *)inAppID withDelegate:(id<DeviceReferenceTokenDelegate>)del;

- (UIButton *)getPayButtonWithTarget:(NSObject const *)target andAction:(SEL)action andButtonType:(PayPalButtonType)inButtonType;

@end

