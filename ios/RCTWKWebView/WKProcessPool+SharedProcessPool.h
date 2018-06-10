@interface WKProcessPool (SharedProcessPool)
+ (WKProcessPool*)sharedProcessPool;
@end

@interface WKWebViewConfiguration (SharedWebViewConfiguration)
+ (WKWebViewConfiguration*)sharedConfiguration;
@end
