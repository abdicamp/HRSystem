//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<file_saver/FileSaverPlugin.h>)
#import <file_saver/FileSaverPlugin.h>
#else
@import file_saver;
#endif

#if __has_include(<fluttertoast/FluttertoastPlugin.h>)
#import <fluttertoast/FluttertoastPlugin.h>
#else
@import fluttertoast;
#endif

#if __has_include(<open_file_ios/OpenFilePlugin.h>)
#import <open_file_ios/OpenFilePlugin.h>
#else
@import open_file_ios;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FileSaverPlugin registerWithRegistrar:[registry registrarForPlugin:@"FileSaverPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [OpenFilePlugin registerWithRegistrar:[registry registrarForPlugin:@"OpenFilePlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
}

@end
