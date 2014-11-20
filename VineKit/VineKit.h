//
//  VineKit.h
//  VineKitDemo
//
//  Created by Sapan Bhuta on 11/18/14.
//  Copyright (c) 2014 SapanBhuta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VineKit : NSObject
+ (void)loginWithUsername:(NSString *)username Password:(NSString *)password CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)logoutWithKey:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)popularWithCompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)meWithKey:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)user:(NSString *)userid CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)timelineOfUser:(NSString *)userid CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)timelineOfTag:(NSString *)tag page:(NSString *)pageid CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)postWithID:(NSString *)postid CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)notificationsForUser:(NSString *)userid Key:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)likePost:(NSString *)postid Key:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler;

+ (void)followUser:(NSString *)userid Key:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler;

@end
