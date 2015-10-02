//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Kevin Lin on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _playingCardDeck = [[FISPlayingCardDeck alloc] init];
        _handScore = @0;
        _hand = [[NSMutableArray alloc] init];
        _isBusted = NO;
        _isBlackJack = NO;
    }
    
    return self;
}
-(void)deal{
    for (NSUInteger i=0; i<2; i++) {
        FISPlayingCard *card = [self.playingCardDeck drawRandomCard];
        NSLog(@"Card %lu: %@%@",i+1, card.rank, card.suit);
        [self.hand addObject:card];
    }
    [self handScoreUpdate:self.hand];
}
-(void)hit{
    NSLog(@"Hand score: %@", self.handScore);
    if (!(self.isBusted || self.isBlackJack || self.hand.count < 2)) {
        FISPlayingCard *card = [self.playingCardDeck drawRandomCard];
        NSLog(@"Card hit: %@%@", card.rank,card.suit);
        [self.hand addObject:card];
        NSLog(@"Hand score: %@", self.handScore);
    }
}
-(void)handScoreUpdate:(NSArray *)hand{
    NSUInteger score = 0;
    BOOL ace = NO;
    for (FISPlayingCard *card in hand) {
        if (!ace && card.rank.integerValue == 1)
            ace = YES;
        
        if (card.rank.integerValue > 10)
            score += 10;
        else
            score += card.rank.integerValue;
    }
    
    if (ace && score+10 <= 21)
        score = score+10;
    
    if (score > 21) {
        self.isBusted = YES;
        self.handScore = @(score);
        self.isBlackJack = NO;
    }
    else if (score == 21 && hand.count == 2){
        self.isBlackJack = YES;
        self.handScore = @(score);
        self.isBusted = NO;
    }
    else{
        self.handScore = @(score);
        self.isBusted = NO;
        self.isBlackJack = NO;
    }
}

-(NSNumber *)handScore{
    [self handScoreUpdate:self.hand];
    return _handScore;
}

-(BOOL)isBusted{
    [self handScoreUpdate:self.hand];
    return _isBusted;
}

@end
