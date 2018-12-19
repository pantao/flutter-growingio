#import "GrowingioPlugin.h"

@implementation GrowingioPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"growingio"
            binaryMessenger:[registrar messenger]];
  GrowingioPlugin* instance = [[GrowingioPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  // Track event
  if ([@"track" isEqualToString:call.method]) {
    NSString *eventId = arguments[@"eventId"];
    NSDictionary *variable = arguments[@"variable"];
    NSNumber *number = arguments[@"number"];

    if (number && eventId && variable) {
      [Growing track:eventId withNumber:number andVariable:variable];
    }
    else if (number && eventId) {
      [Growing track:eventId withNumber:number];
    }
    else if (eventId && variable) {
      [Growing track:eventId withVariable:variable];
    }
    else if (eventId) {
      [Growing track:eventId]
    }
    result(nil);
  }
  else if ([@"setEvar" isEqualToString:call.method]) {
    [Growing setEvar:arguments];
    result(nil);
  }
  else if ([@"setPeopleVariable" isEqualToString:call.method]) {
    [Growing setPeopleVariable:arguments];
    result(nil);
  }
  else if ([@"setUserId" isEqualToString:call.method]) {
    [Growing setUserId:arguments];
    result(nil);
  }
  else if ([@"clearUserId" isEqualToString:call.method]) {
    [Growing clearUserId:arguments];
    result(nil);
  }
  else if ([@"setVisitor" isEqualToString:call.method]) {
    [Growing setVisitor:arguments];
    result(nil);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
