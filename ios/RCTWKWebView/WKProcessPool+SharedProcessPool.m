#import <WebKit/WebKit.h>
#import <Foundation/Foundation.h>
#import "WeakScriptMessageDelegate.h"
#import "WKProcessPool+SharedProcessPool.h"

@implementation WKProcessPool (SharedProcessPool)

+ (WKProcessPool*)sharedProcessPool {
    static WKProcessPool* _sharedProcessPool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedProcessPool = [[WKProcessPool alloc] init];
    });
    return _sharedProcessPool;
}

@end

@implementation WKWebViewConfiguration (SharedWebViewConfiguration)

+ (WKWebViewConfiguration*)sharedConfiguration {
    static WKWebViewConfiguration* config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[WKWebViewConfiguration alloc] init];
        WKUserContentController* userController = [[WKUserContentController alloc]init];
        [userController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"reactNative"];
        config.userContentController = userController;
    });
    return config;
}

@end
