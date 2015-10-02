//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Kevin Lin on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : NSObject

@property(strong, nonatomic)FISPlayingCardDeck *playingCardDeck;
@property(strong, nonatomic)NSNumber *handScore;
@property(strong, nonatomic)NSMutableArray *hand;
@property(nonatomic)BOOL isBusted;
@property(nonatomic)BOOL isBlackJack;

-(instancetype)init;
-(void)deal;
-(void)hit;

@end
