//
//  GameViewController.swift
//  GoL
//
//  Created by Georg Meyer on 09.06.14.
//  Copyright (c) 2014 SchoMa Entertainment. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    @IBOutlet var gameResult : UITextView = nil
    @IBOutlet var pauseResumeButton : UIButton = nil
    
    var gameLoop : Model.GameLoop!
    var game : Model.Game!
    
    @IBAction func touchRandom(sender : UIButton) {
        NSLog("touch random")
        self.createRandomGame()
        NSLog("created random")
        self.start()
        NSLog("started")
    }
    
    @IBAction func touchPauseResume(sender : UIButton){
        if(sender.tag == 1){
            self.pause()
        } else if(sender.tag == 0){
            self.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func pause() {
        self.gameLoop.stop()
        self.pauseResumeButton.tag = 0
        self.pauseResumeButton.setTitle("Resume", forState: UIControlState.Normal)
    }
    
    func resume() {
        self.gameLoop.start()
        self.pauseResumeButton.tag = 1
        self.pauseResumeButton.setTitle("Pause", forState: UIControlState.Normal)
    }
    
    func createRandomGame() {
        let gameStateInitializerStrategy = GameStateInitializerStrategies.RandomStrategy()
        
        self.game = createGame(gameStateInitializerStrategy)
    }
    
    func createAllDeadGame() {
        let gameStateInitializerStrategy = GameStateInitializerStrategies.AllDeadStrategy()
        
        self.game = createGame(gameStateInitializerStrategy)
    }
    
    func start() {
        let controller = self
        self.gameLoop = Model.GameLoop(game: self.game, timeInterval: 0.1, afterTick: {
            controller.updateGameResult()
            })
        self.pauseResumeButton.enabled = true
        self.resume()
    }
    
    func updateGameResult() {
        dispatch_async(dispatch_get_main_queue(), {
            self.gameResult.text = self.game.description
        })
    }
    
    func createGame(gameStateInitializerStrategy : GameStateInitializerStrategy) -> Model.Game {
        let dimensions = Model.Dimensions(width: 44, height: 25)
        let gameStateInitializer = Model.GameStateInitializer(dimensions: dimensions, gameStateInitializerStrategy: gameStateInitializerStrategy)
        
        return Model.Game(dimensions: dimensions, gameStateInitializer: gameStateInitializer)
    }

}
