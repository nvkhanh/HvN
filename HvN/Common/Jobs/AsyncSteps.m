//
//  AsyncSteps.m
//  HvN
//
//  Created by admin on 07/05/16.
//  Copyright (c) 2016 admin. All rights reserved.
//

#import "AsyncSteps.h"

@interface AsyncSteps()
{
    void(^_completedBlock)();
}

@property (nonatomic, strong) NSMutableDictionary *steps;
@property (nonatomic, assign) BOOL isRunning;

@end

@implementation AsyncSteps

- (NSMutableDictionary *)steps {
    if (!_steps) {
        _steps = [NSMutableDictionary new];
    }
    return _steps;
}

-(void)setCompletedBlock:(void (^)())block
{
    _completedBlock=nil;
    
    if(block)
        _completedBlock=[block copy];
}

-(void) stepCompleted:(NSString*) stepID
{
    [self.steps removeObjectForKey:stepID];
    
    if(self.steps.count==0)
    {
        _isRunning=false;
        
        if(_completedBlock)
            _completedBlock();
        
        _completedBlock=nil;
    }
}

- (void)run
{
    if(_isRunning)
        return;
    
    if(self.steps.count==0)
        return;
    
    _isRunning=true;
    
    NSArray *allKey=self.steps.allKeys;
    
    for(NSInteger i=(NSInteger)allKey.count-1;i>=0;i--)
    {
        NSString *key=allKey[i];
        AsyncStepsStep step=[self.steps objectForKey:key];
        
        if(step)
        {
            step(^()
            {
                [self stepCompleted:key];
            });
        }
    }
}

-(void)enqueueStep:(AsyncStepsStep)step
{
    NSString *stepID=[NSProcessInfo processInfo].globallyUniqueString;
    [self.steps setObject:[step copy] forKey:stepID];
}

- (void)dealloc
{
    NSLog(@"dealloc AsyncSteps");
}

@end
