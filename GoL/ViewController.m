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
#import "GameStateInitializerStrategy.h"
#import "RandomStrategy.h"
#import "AllDeadStrategy.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *gameResult;
@property (strong, nonatomic) IBOutlet UIButton *pauseResumeButton;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) GameLoop *gameLoop;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pauseResumeButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchRandom:(UIButton *)sender {
    [self createRandomGame];
    [self start];
}

- (IBAction)touchBlank:(UIButton *)sender {
    [self createAllDeadGame];
    [self start];
}

- (void)pause {
    [self.gameLoop stop];
    [self.pauseResumeButton setTag:0];
    [self.pauseResumeButton setTitle:@"Resume" forState:UIControlStateNormal];
}

- (void)resume {
    [self.pauseResumeButton setTag:1];
    [self.pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
    [self.gameLoop start];
}

- (IBAction)touchPauseResume:(UIButton *)sender {
    if (sender.tag == 1) {
        [self pause];
    }
    else if (sender.tag == 0) {
        [self resume];
    }
}

- (void)start {
    ViewController *controller = self;

    self.gameLoop = [[GameLoop alloc] initWithGame:self.game andTimeInterval:0.1 andAfterTick: ^(void) {
        [controller updateGameResult];
    }];

    [self.pauseResumeButton setEnabled:YES];
    [self resume];
}

- (void)updateGameResult {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.gameResult setText:self.game.description];
    });
}

- (void)createRandomGame {
    id gameStateInitializerStrategy = [[RandomStrategy alloc] init];

    self.game = [self createGame:gameStateInitializerStrategy];
}

- (void)createAllDeadGame {
    id gameStateInitializerStrategy = [[AllDeadStrategy alloc] init];

    self.game = [self createGame:gameStateInitializerStrategy];
}

- (Game *)createGame:(id <GameStateInitializerStrategy> )gameStateInitializerStrategy {
    GameDimensions *gameDimensions = [[GameDimensions alloc] initWithHeight:36 andWidth:44];

    GameStateInitializer *gameStateInitializer = [[GameStateInitializer alloc] initWithGameDimensions:gameDimensions andGameStateInitializerStrategy:gameStateInitializerStrategy];

    Game *game = [[Game alloc] initWithGameDimensions:gameDimensions andGameStateInitializer:gameStateInitializer];

    return game;
}

@end
