//
//  ViewController.m
//  CYVadDemo
//
//  Created by Chris Yang on 2020/5/22.
//  Copyright © 2020 Chris. All rights reserved.
//

#import "CYVad.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CYVad *cyvad;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _cyvad = [[CYVad alloc] init];
    [self testVad];
}

- (void)testVad {

    NSString *tmpFilePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"wav"];
    NSData *tmpData = [NSData dataWithContentsOfFile:tmpFilePath];
    printf("LENGTH %d\n", (int)tmpData.length);

    int sampleRate = 16000;
    int frgSize = 160 * 2;
    int16_t *tmpP = (int16_t *)tmpData.bytes;

    int loopNum = (int)(tmpData.length / frgSize / sizeof(int16_t));
    for (int i = 0; i < loopNum; i++) {
        int result = [_cyvad vadVoiceFrame:tmpP sampleRate:sampleRate length:frgSize];
        tmpP += frgSize;
        printf("Result %d: %d\n", i, result);
    }
}

@end
