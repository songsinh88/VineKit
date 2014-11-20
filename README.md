VineKit
=======

VineKit is Unit-tested Objective-C Wrapper for the (private) [Vine](https://vine.co/) API  

## Documentation
Unofficial Documentation is available [here](https://github.com/starlock/vino/wiki/API-Reference).

###Notes
1. The Vine API is private; therefore, endpoints can change at anytime and render parts or all of this library non-functional. 
1. [AFNetworking](http://afnetworking.com/) is required for this library to work.

## Install
There are two ways to add Plaid to your project:

### Copy manually

1. Install [AFNetworking](https://github.com/AFNetworking/AFNetworking)
1. Drag the VineKit.h and VineKit.m files into your project
1. Make sure "Copy items into destination group's folder (if needed)" is checked
1. Click "Add"

### CocoaPods (forthcoming)

[CocoaPods](http://cocoapods.org/) is a common library dependency management tool for Objective-C.  To use the Plaid iOS bindings with CocoaPods, simply add the following to your `Podfile` and run `pod install`:

    pod 'VineKit'

Note: be sure to use the `.xcworkspace` to open your project in Xcode instead of the `.xcproject`.

## Usage

In AppDelegate.m import VineKit.h. Use the loginWithUsername... method in order to retrieve userid and password as well as session key to call on endpoints requiring authentication. For example:

```objc
#import "VineKit.h"

- (void)viewDidLoad
{
    [super viewDidLoad];

    //login
    [VineKit loginWithUsername:@"xxx@example.com" Password:@"xxx" CompletionHandler:^(NSDictionary *output) {
    	NSLog(@"Login: %@", output);

    	//save the key
        NSString *sessionKey = output[@"data"][@"key"];

        //use key to access my user data
        [VineKit meWithKey:sessionKey CompletionHandler:^(NSDictionary *output) {
            NSLog(@"Me: %@", output);
        }];
    }];
}
```

## Test

Unit Tests are included in the VineKitDemo app.

## License
[MIT](https://github.com/sapanbhuta/plaid-ios/blob/master/LICENSE)