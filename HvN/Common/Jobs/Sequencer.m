//
//  Sequencer.m
//  HvN
//
//  Created by admin on 07/05/16.
//  Copyright (c) 2016 admin. All rights reserved.
//

#import "Sequencer.h"
@interface Sequencer()
{
}
@property (nonatomic, strong) NSMutableArray *steps;
@end

@implementation Sequencer

- (NSMutableArray *)steps {
    if (!_steps) {
        _steps = [NSMutableArray new];
    }
    return _steps;
}

- (void)run
{
    [self runNextStepWithResult:nil];
}

- (void)enqueueStep:(SequencerStep)step
{
    [self.steps addObject:[step copy]];
}

- (SequencerStep)dequeueNextStep
{
    SequencerStep step = [self.steps objectAtIndex:0];
    [self.steps removeObjectAtIndex:0];
    return step;
}

- (void)runNextStepWithResult:(id)result
{
    if ([self.steps count] <= 0) {
        if(_completedBlock)
            _completedBlock(result);
        
        self.completedBlock=nil;
        return;
    }
    
    SequencerStep step = [self dequeueNextStep];
    
    step(result, ^(id nextRresult){
        [self runNextStepWithResult:nextRresult];
    });
}

- (void)dealloc
{
    
}

@end
