//
//  CYVad.m
//  CYVadDemo
//
//  Created by Chris Yang on 2020/5/22.
//  Copyright © 2020 Chris. All rights reserved.
//

#include "webrtc/common_audio/vad/include/webrtc_vad.h"
#import "CYVad.h"

typedef struct WebRtcVadInst VadInst;

@interface CYVad () {
    VadInst *_vad;
}

@end

@implementation CYVad

- (void)dealloc {
    WebRtcVad_Free(_vad);
}

- (id)init {
    self = [super init];
    if(self) {
        
        WebRtcVad_Create(&_vad);
        WebRtcVad_Init(_vad);
        WebRtcVad_set_mode(_vad, 0);
    }
    return self;
}


- (int)defaultFrameLengthFromSampleRate:(int)sampleRate {
    return sampleRate / 100;
}

- (int)vadVoiceFrame:(const int16_t *)pVoice
          sampleRate:(int)sampleRate
              length:(int)frameLength {
    WebRtcVad_Init(_vad);
    WebRtcVad_set_mode(_vad, 0);
    int result = WebRtcVad_Process(_vad, sampleRate, pVoice, frameLength);
    return result;
}

@end
