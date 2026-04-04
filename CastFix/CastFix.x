#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Bypass YouTube's custom local network permission blocker
%hook YTLocalNetworkAccessChecker

- (BOOL)hasLocalNetworkAccess {
    return YES;
}

- (void)checkLocalNetworkAccessWithCompletion:(void(^)(BOOL))completion {
    if (completion) {
        completion(YES);
    }
}

%end

// Fallback for alternate MDX permission checker classes
%hook MDXLocalNetworkPermission

- (BOOL)isGranted { 
    return YES; 
}

- (BOOL)hasPrompted { 
    return YES; 
}

%end

// Cleanly fake cellular connection exclusively for the Google Cast SDK
%hook GCKNNetworkReachability

- (NSInteger)currentNetworkStatus {
    return 2; 
}

- (BOOL)isReachableViaWiFi {
    return NO;
}

%end