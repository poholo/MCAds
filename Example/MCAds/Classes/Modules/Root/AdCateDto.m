//
// Created by majiancheng on 2018/12/20.
// Copyright (c) 2018 majiancheng. All rights reserved.
//

#import "AdCateDto.h"


@implementation AdCateDto

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [super setValue:value forUndefinedKey:key];
    if([key isEqualToString:@"data"]) {
        for(NSDictionary *dict in value) {
            AdCateDto *cateDto = [AdCateDto createDto:dict];
            [self.cateDtos addObject:cateDto];
        }
    }
}

- (NSMutableArray<AdCateDto *> *)cateDtos {
    if(!_cateDtos) {
        _cateDtos = [NSMutableArray new];
    }
    return _cateDtos;
}

@end
