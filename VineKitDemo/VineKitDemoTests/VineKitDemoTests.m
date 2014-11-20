//
//  VineKitDemoTests.m
//  VineKitDemoTests
//
//  Created by Sapan Bhuta on 11/19/14.
//  Copyright (c) 2014 SapanBhuta. All rights reserved.
//

#define kusername @""
#define kpassword @""
#define kuserid @""
#define kpostid @""
#define kfollowuser @""

#define StartBlock() __block BOOL waitingForBlock = YES
#define EndBlock() waitingForBlock = NO
#define WaitUntilBlockCompletes() WaitWhile(waitingForBlock)
#define WaitWhile(condition) do { while(condition) { [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]]; }} while(0)

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "VineKit.h"

@interface VineKitDemoTests : XCTestCase
@end

@implementation VineKitDemoTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLogin {
    StartBlock();
    [VineKit loginWithUsername:kusername Password:kpassword CompletionHandler:^(NSDictionary *output) {
        EndBlock();
        XCTAssertEqualObjects(output[@"success"], @1);
    }];
    WaitUntilBlockCompletes();
}

- (void)testLogout {
    StartBlock();
    [VineKit loginWithUsername:kusername Password:kpassword CompletionHandler:^(NSDictionary *output) {
        [VineKit logoutWithKey:output[@"data"][@"key"] CompletionHandler:^(NSDictionary *output) {
            EndBlock();
            XCTAssertEqualObjects(output[@"success"], @1);
        }];
    }];
    WaitUntilBlockCompletes();
}

- (void)testPopular {
    StartBlock();
    [VineKit popularWithCompletionHandler:^(NSDictionary *output) {
        EndBlock();
        XCTAssertEqualObjects(output[@"success"], @1);
    }];
    WaitUntilBlockCompletes();
}

- (void)testMe {
    StartBlock();
    [VineKit loginWithUsername:kusername Password:kpassword CompletionHandler:^(NSDictionary *output) {
        [VineKit meWithKey:output[@"data"][@"key"] CompletionHandler:^(NSDictionary *output) {
            EndBlock();
            XCTAssertEqualObjects(output[@"success"], @1);
        }];
    }];
    WaitUntilBlockCompletes();
}

- (void)testUser {
    StartBlock();
    [VineKit user:kuserid CompletionHandler:^(NSDictionary *output) {
        EndBlock();
        XCTAssertEqualObjects(output[@"success"], @1);
    }];
    WaitUntilBlockCompletes();
}

- (void)testTimelineOfUser {
    StartBlock();
    [VineKit timelineOfUser:kuserid CompletionHandler:^(NSDictionary *output) {
        EndBlock();
        XCTAssertEqualObjects(output[@"success"], @1);
    }];
    WaitUntilBlockCompletes();
}

- (void)testTimelineOfTag {
    StartBlock();
    [VineKit timelineOfTag:@"food" page:@"1" CompletionHandler:^(NSDictionary *output) {
        EndBlock();
        XCTAssertEqualObjects(output[@"success"], @1);
    }];
    WaitUntilBlockCompletes();
}

- (void)testPostWithID {
    StartBlock();
    [VineKit postWithID:kpostid CompletionHandler:^(NSDictionary *output) {
        XCTAssertEqualObjects(output[@"success"], @1);
        EndBlock();
    }];
    WaitUntilBlockCompletes();
}

- (void)testNotificationForUser {
    StartBlock();
    [VineKit loginWithUsername:kusername Password:kpassword CompletionHandler:^(NSDictionary *output) {
        [VineKit notificationsForUser:kuserid Key:output[@"data"][@"key"] CompletionHandler:^(NSDictionary *output) {
            EndBlock();
            XCTAssertEqualObjects(output[@"success"], @1);
        }];
    }];
    WaitUntilBlockCompletes();
}

- (void)testLikePost {
    StartBlock();
    [VineKit loginWithUsername:kusername Password:kpassword CompletionHandler:^(NSDictionary *output) {
        [VineKit likePost:kpostid Key:output[@"data"][@"key"] CompletionHandler:^(NSDictionary *output) {
            EndBlock();
            XCTAssertEqualObjects(output[@"success"], @1);
        }];
    }];
    WaitUntilBlockCompletes();
}

- (void)testFollowUser {
    StartBlock();

    [VineKit loginWithUsername:kusername Password:kpassword CompletionHandler:^(NSDictionary *output) {
        [VineKit followUser:kfollowuser Key:output[@"data"][@"key"] CompletionHandler:^(NSDictionary *output) {
            EndBlock();
            XCTAssertEqualObjects(output[@"success"], @1);
        }];
    }];
    WaitUntilBlockCompletes();
}

@end