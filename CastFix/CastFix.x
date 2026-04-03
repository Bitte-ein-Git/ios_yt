#import <Foundation/Foundation.h>

// Hook main network reachability controller
%hook YTNetworkReachabilityController

// Fake no Wi-Fi for MDX stack
- (BOOL)isWifi {
    if ([[NSThread callStackSymbols].description containsString:@"MDX"]) return NO;
    return %orig;
}

// Fake no Wi-Fi for MDX stack alternative
- (BOOL)isWiFi {
    if ([[NSThread callStackSymbols].description containsString:@"MDX"]) return NO;
    return %orig;
}

// Fake cellular connection type for MDX stack
- (int)connectionType {
    if ([[NSThread callStackSymbols].description containsString:@"MDX"]) return 2;
    return %orig;
}

%end

// Hook secondary reachability controller
%hook YTReachabilityController

// Fake no Wi-Fi for MDX stack
- (BOOL)isWifi {
    if ([[NSThread callStackSymbols].description containsString:@"MDX"]) return NO;
    return %orig;
}

// Fake no Wi-Fi for MDX stack alternative
- (BOOL)isWiFi {
    if ([[NSThread callStackSymbols].description containsString:@"MDX"]) return NO;
    return %orig;
}

// Fake cellular connection type for MDX stack
- (int)connectionType {
    if ([[NSThread callStackSymbols].description containsString:@"MDX"]) return 2;
    return %orig;
}

%end