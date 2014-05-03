//
//  ViewController.m
//  GoL
//
//  Created by chico on 27.04.14.
//
//

#import "ViewController.h"
#import "Game.h"
#import "GameDimensions.h"
#import "GameLoop.h"
#import "GameRandomizer.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *gameResult;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) GameLoop *gameLoop;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.game = [self createGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchStart:(UIButton *)sender {
    self.gameLoop = [[GameLoop alloc] initWithGame:self.game andTimeInterval:0.2];

    ViewController *controller = self;

    [controller updateGameResult];

    self.gameLoop.afterTick = ^(void) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [controller updateGameResult];
        });
    };

    [self.gameLoop start];
}

- (void)updateGameResult {
    NSString *result = @"";
    NSArray *rows = [self.game descriptionArray];
    for (NSString *row in rows) {
        result = [result stringByAppendingString:row];
        result = [result stringByAppendingString:@"\n"];
    }

    [self.gameResult setText:result];
}

- (Game *)createGame {
    GameDimensions *gameDimensions = [[GameDimensions alloc] initWithHeight:36 andWidth:44];

    GameRandomizer *gameRandomizer = [[GameRandomizer alloc] initWithGameDimensions:gameDimensions];

    Game *game = [[Game alloc] initWithInitialState:[gameRandomizer randomize] andGameDimensions:gameDimensions];

    return game;
}

@end
