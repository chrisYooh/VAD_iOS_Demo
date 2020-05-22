//
//  CYVad.h
//  CYVadDemo
//
//  Created by Chris Yang on 2020/5/22.
//  Copyright © 2020 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CYVad : NSObject

/**
 * 通过SampleRate 计算 FrameLength
 */
- (int)defaultFrameLengthFromSampleRate:(int)sampleRate;

/** 检验一片声音数据是否有有效声音
 * pVoice：声音片段起始指针，
 * sampleRate：采样率，如8000、16000
 * frameLength：声音片大小，和采样率有依赖关系，比如采样率为16000，frameLength只能为：160，320，480
 * 返回：
 * -1 - 发声错误
 * 0  - 无声音
 * 1  - 有声音
 */
- (int)vadVoiceFrame:(const int16_t *)pVoice
          sampleRate:(int)sampleRate
              length:(int)frameLength;

@end

NS_ASSUME_NONNULL_END
