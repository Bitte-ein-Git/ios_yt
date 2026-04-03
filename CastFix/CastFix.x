#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Hook YouTube local network permission
%hook YTLocalNetworkPermissionController

// Force permission true
- (BOOL)hasLocalNetworkPermission {
    return YES;
}

// Force granted true
- (BOOL)isLocalNetworkPermissionGranted {
    return YES;
}

// Intercept prompt
- (void)requestLocalNetworkPermissionWithCompletionBlock:(void (^)(BOOL granted))completion {
    if (completion) {
        completion(YES);
    }
}

%end

// Hook MDX app state
%hook MDXAppStateMonitor

// Force MDX permission true
- (BOOL)hasLocalNetworkPermission {
    return YES;
}

%end
