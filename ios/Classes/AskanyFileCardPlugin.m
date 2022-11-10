#import "AskanyFileCardPlugin.h"
#if __has_include(<askany_file_card/askany_file_card-Swift.h>)
#import <askany_file_card/askany_file_card-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "askany_file_card-Swift.h"
#endif

@implementation AskanyFileCardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAskanyFileCardPlugin registerWithRegistrar:registrar];
}
@end
