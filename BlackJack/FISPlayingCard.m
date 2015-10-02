//
//  FISPlayingCard.m
//  BlackJack
//
//  Created by Kevin Lin on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCard.h"

@implementation FISPlayingCard

-(instancetype)init{
    
    self = [self initWithSuit:@"" rank:@0];
    return self;
}

-(instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank{
    self = [super init];
    
    if (![self isValidRank:rank])
        rank = @0;
    if (![self isValidSuit:suit])
        suit = @"";
    
    if (self) {
        _suit = suit;
        _rank = rank;
    }
    
    return self;
}

-(void)setSuit:(NSString *)suit{
    if ([self isValidSuit:suit])
        _suit = suit;
    else
        _suit = @"";
}

-(void)setRank:(NSNumber *)rank{
    if ([self isValidRank:rank])
        _rank = rank;
    else
        _rank = @0;
}

-(BOOL)isValidSuit:(NSString *)suit{
    NSArray *suits = @[@"♥", @"♠", @"♣", @"♦"];
    return [suits containsObject:suit];
}

-(BOOL)isValidRank:(NSNumber *)rank{
    return [rank integerValue] <= 13 || [rank integerValue] <= 1;
}

-(NSString *)description{
    
    NSString *card = [NSString stringWithFormat:@"%@%@", self.rank, self.suit];
    
    return card;
}

@end
