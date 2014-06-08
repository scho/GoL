//
//  ViewController.swift
//  GoL
//
//  Created by Georg Meyer on 08.06.14.
//
//

import Foundation
import UIKit

class NewViewController : UIViewController {
    
    @IBOutlet var gameResult : UITextView
    @IBOutlet var pauseResumeButton : UIButton
    
    var game : Game!
    var gameLoop : GameLoop!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pauseResumeButton.enabled = false
        
    }
    
    @IBAction func touchRandom(sender : UIButton) {
        self.createRandomGame()
        self.start()
    }

    @IBAction func touchCross(sender : UIButton) {
        
    }
    
    @IBAction func touchShip(sender : UIButton) {
        
    }
    
    @IBAction func touchBlank(sender : UIButton) {
        self.createAllDeadGame()
        self.start()
    }
    
    @IBAction func touchPauseResume(sender : UIButton){
        if(sender.tag == 1){
            self.pause()
        } else if(sender.tag == 0){
            self.resume()
        }
    }
    
    func pause() {
        self.gameLoop?.stop()
        self.pauseResumeButton.tag = 0
        self.pauseResumeButton.setTitle("Resume", forState: UIControlState.Normal)
    }
    
    func resume() {
        self.gameLoop?.start()
        self.pauseResumeButton.tag = 1
        self.pauseResumeButton.setTitle("Pause", forState: UIControlState.Normal)
    }
    
    func createRandomGame() {
        let gameStateInitializerStrategy = RandomStrategy()
        
        self.game = createGame(gameStateInitializerStrategy)
    }
    
    func createAllDeadGame() {
        let gameStateInitializerStrategy = AllDeadStrategy()
        
        self.game = createGame(gameStateInitializerStrategy)
    }
    
    func start() {
        let controller = self
        self.gameLoop = GameLoop(game: self.game!, timeInterval: 0.1, afterTick: {
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
    
    func createGame(gameStateInitializerStrategy : GameStateInitializerStrategy) -> Game {
        let dimensions = Dimensions(width: 44, height: 30)
        let gameStateInitializer = GameStateInitializer(dimensions: dimensions, gameStateInitializerStrategy: gameStateInitializerStrategy)
        
        return Game(dimensions: dimensions, gameStateInitializer: gameStateInitializer)
    }
}