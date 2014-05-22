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

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *gameResult;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) GameLoop *gameLoop;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.game = [self createGame];
    self.gameLoop = [[GameLoop alloc] initWithGame:self.game andTimeInterval:0.05];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchStart:(UIButton *)sender {
    ViewController *controller = self;

    self.gameLoop.afterTick = ^(void) {
        [controller updateGameResult];
    };

    [self.gameLoop start];
}

- (IBAction)touchReset:(UIButton *)sender {
    [self.game createField];
}

- (IBAction)touchStop:(UIButton *)sender {
    [self.gameLoop stop];
}

- (void)updateGameResult {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.gameResult setText:self.game.description];
    });
}

- (Game *)createGame {

    Game *game = [[Game alloc] initWithGameDimensions:[[GameDimensions alloc] initWithHeight:36 andWidth:44]];

    return game;
}

@end
