//
//  VineKit.m
//  VineKitDemo
//
//  Created by Sapan Bhuta on 11/18/14.
//  Copyright (c) 2014 SapanBhuta. All rights reserved.
//

#import "VineKit.h"
#import "AFHTTPRequestOperationManager.h"

@implementation VineKit

+ (void)loginWithUsername:(NSString *)username
                 Password:(NSString *)password
        CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = @"https://api.vineapp.com/users/authenticate";

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"username":username, @"password":password};
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)logoutWithKey:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = @"https://api.vineapp.com/users/authenticate";

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:key forHTTPHeaderField:@"vine-session-id"];
    [manager DELETE:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)popularWithCompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = @"https://api.vineapp.com/timelines/popular";

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)meWithKey:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = @"https://api.vineapp.com/users/me";

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:key forHTTPHeaderField:@"vine-session-id"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)user:(NSString *)userid CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [@"https://api.vineapp.com/users/profiles/" stringByAppendingString:userid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)timelineOfUser:(NSString *)userid CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [@"https://api.vineapp.com/timelines/users/" stringByAppendingString:userid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)timelineOfTag:(NSString *)tag page:(NSString *)pageid CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [NSString stringWithFormat:@"https://api.vineapp.com/timelines/tags/%@?page=%@", tag, pageid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)postWithID:(NSString *)postid CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [@"https://api.vineapp.com/timelines/posts/" stringByAppendingString:postid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)notificationsForUser:(NSString *)userid Key:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [NSString stringWithFormat:@"https://api.vineapp.com/users/%@/pendingNotificationsCount", userid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:key forHTTPHeaderField:@"vine-session-id"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)likePost:(NSString *)postid Key:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [NSString stringWithFormat:@"https://api.vineapp.com/posts/%@/likes", postid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:key forHTTPHeaderField:@"vine-session-id"];
    [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

+ (void)followUser:(NSString *)userid Key:(NSString *)key CompletionHandler:(void (^)(NSDictionary *output))handler {
    NSString *urlString = [NSString stringWithFormat:@"https://api.vineapp.com/users/%@/followers", userid];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:key forHTTPHeaderField:@"vine-session-id"];
    [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        handler(@{@"error":error});
    }];
}

@end