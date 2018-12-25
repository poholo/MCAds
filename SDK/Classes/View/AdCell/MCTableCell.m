//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "MCTableCell.h"
#import "MCColor.h"


@implementation MCTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [MCColor colorV];
        self.backgroundView.backgroundColor = [MCColor colorV];
    }
    return self;
}


+ (CGFloat)height {
    return 44.0f;
}

+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}


@end