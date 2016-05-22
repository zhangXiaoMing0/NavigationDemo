//
//  FNHeaderView.m
//  FNNavigationBar
//
//  Created by zmx on 16/1/24.
//  Copyright © 2016年 zmx. All rights reserved.
//

#import "FNHeaderView.h"

@implementation FNHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentView = [[UIView alloc] initWithFrame:frame];
        self.contentView.backgroundColor = [UIColor grayColor];
        [self addSubview:self.contentView];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
