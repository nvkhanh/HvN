//
//  Sequencer.h
//  HvN
//
//  Created by admin on 07/05/16.
//  Copyright (c) 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SequencerCompletion)(id result);
typedef void(^SequencerStep)(id result, SequencerCompletion completion);


@interface Sequencer : NSObject {}

- (void)run;
- (void)enqueueStep:(SequencerStep)step;

@property (nonatomic, strong) void(^completedBlock)(id result);

@end
