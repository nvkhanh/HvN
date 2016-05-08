//
//  AsyncSteps.h
//  HvN
//
//  Created by admin on 07/05/16.
//  Copyright (c) 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AsyncStepsStepCompletion)();
typedef void(^AsyncStepsStep)(AsyncStepsStepCompletion stepCompletion);


@interface AsyncSteps : NSObject

- (void)run;
- (void)enqueueStep:(AsyncStepsStep) step;
- (void) setCompletedBlock:(void(^)()) block;

@end
