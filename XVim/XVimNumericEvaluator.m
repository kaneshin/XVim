//
//  XVimNumericEvaluator.m
//  XVim
//
//  Created by Tomas Lundell on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimNumericEvaluator.h"
#import "XVimKeyStroke.h"

@implementation XVimNumericEvaluator

- (BOOL)numericMode
{
	return [[self context] numericArgHead] != nil;
}

- (XVimEvaluator*)eval:(XVimKeyStroke*)keyStroke inWindow:(XVimWindow*)window{
    NSString* keyStr = [keyStroke toSelectorString];
	XVimEvaluatorContext *context = [self context];
	
    if (keyStroke.isNumeric) {
		
		NSNumber *numericArgHead = [context numericArgHead];
		
        if (numericArgHead) {
            NSString* numStr = [keyStr substringFromIndex:3];
            NSInteger n = [numStr integerValue]; 
			NSUInteger newHead = [numericArgHead unsignedIntegerValue];
            newHead*=10; //FIXME: consider integer overflow
            newHead+=n;
			[context setNumericArgHead:newHead];
			[context appendArgument:numStr];
			
            return self;
        }
        else{
            if( [keyStr isEqualToString:@"NUM0"] ){
                // Nothing to do
                // Maybe handled by XVimNormalEvaluator
            }else{
                NSString* numStr = [keyStr substringFromIndex:3];
                NSInteger n = [numStr integerValue]; 
				[context setNumericArgHead:n];
				[context appendArgument:numStr];
                return self;
            }
        }
    }
    
    XVimEvaluator *nextEvaluator = [super eval:keyStroke inWindow:window];
    return nextEvaluator;
}
@end
