//
//  FISPlayingCardDeck.m
//  BlackJack
//
//  Created by Kevin Lin on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCardDeck.h"

@implementation FISPlayingCardDeck

-(instancetype)init{
    
    self = [super init];
    NSMutableArray *generatedDeck = [[NSMutableArray alloc] init];
    for (NSString *suit in [self getAllSuits]) {
        for (NSUInteger i=1; i<=13; i++) {
            FISPlayingCard *card = [[FISPlayingCard alloc] initWithSuit:suit rank:@(i)];
            [generatedDeck addObject:card];
        }
    }
    if (self) {
        _cards = [NSMutableArray arrayWithArray:generatedDeck];
    }
    return self;
}

-(FISPlayingCard *)drawRandomCard{
    
    if (self.cards == nil || self.cards.count == 0) {
        return nil;
    }
    else{
        NSUInteger cardIdx = arc4random_uniform((int)self.cards.count);
        FISPlayingCard *randomCard = [self.cards objectAtIndex:cardIdx];
        [self.cards removeObjectAtIndex:cardIdx];
        return randomCard;
    }
}

-(NSArray *)getAllSuits{
    return @[@"♥", @"♠", @"♣", @"♦"];
}
@end
