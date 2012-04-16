//
//  XVimLocalMarkEvaluator.h
//  XVim
//
//  Created by Shuichiro Suzuki on 3/4/12.
//  Copyright (c) 2012 JugglerShu.Net. All rights reserved.
//

#import "XVimEvaluator.h"

typedef enum {
	MARKOPERATOR_SET,
	MARKOPERATOR_MOVETO,
	MARKOPERATOR_MOVETOSTARTOFLINE
} XVimMarkOperator;

// This evaluator is collecting a mark name as part of the 'm{mark-name-letter}' command
@interface XVimLocalMarkEvaluator : XVimEvaluator{
@private
    XVimMarkOperator _markOperator;
}

- (id)initWithContext:(XVimEvaluatorContext*)context
		 markOperator:(XVimMarkOperator)markOperator;

@end
