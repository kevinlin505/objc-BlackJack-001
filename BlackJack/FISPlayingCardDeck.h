//
//  FISPlayingCardDeck.h
//  BlackJack
//
//  Created by Kevin Lin on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCard.h"

@interface FISPlayingCardDeck : NSObject

@property(strong, nonatomic)NSMutableArray *cards;

-(instancetype)init;
-(FISPlayingCard *)drawRandomCard;

@end
