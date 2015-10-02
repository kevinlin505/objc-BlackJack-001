//
//  FISPlayingCard.h
//  BlackJack
//
//  Created by Kevin Lin on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISPlayingCard : NSObject

@property(strong, nonatomic)NSString *suit;
@property(strong, nonatomic)NSNumber *rank;

-(instancetype)init;
-(instancetype)initWithSuit:(NSString *)suit rank:(NSNumber *)rank;
-(NSString *)description;

-(void)setSuit:(NSString *)suit;
-(void)setRank:(NSNumber *)rank;

@end
