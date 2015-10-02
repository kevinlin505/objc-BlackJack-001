//
//  FISAppDelegate.m
//  BlackJack
//
//  Created by Al Tyus on 6/9/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    for (NSUInteger i=0; i<10; i++) {
        FISBlackjackGame *game = [[FISBlackjackGame alloc] init];
        NSLog(@"Game starts!");
        [game deal];
        NSMutableArray *hand = game.hand;
        NSString *cards = @"Your hand is:";
        for (FISPlayingCard *card in hand) {
            cards = [cards stringByAppendingFormat:@" %@%@", card.rank, card.suit];
        }
        
        NSString *finalHand = @"Your hand is:";
        while (game.handScore.integerValue <= 16) {
            [game hit];
            for (FISPlayingCard *card in hand) {
                finalHand = [finalHand stringByAppendingFormat:@" %@%@", card.rank, card.suit];
            }
        }
        
        NSLog(@"%@, and your score is: %@ \n\n\n", cards, game.handScore);
    }
        
    self.window.rootViewController = [[UIViewController alloc] init];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
