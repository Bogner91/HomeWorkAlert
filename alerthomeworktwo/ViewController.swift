//
//  ViewController.swift
//  alerthomeworktwo
//
//  Created by Denis Mashkov on 16.05.2020.
//  Copyright © 2020 Denis Mashkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var playLable: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet var gameButtons: [UIButton]!
    
    @IBAction func helpButton(_ sender: Any) {
        self.helpAlert(title: "Как играть?", message: "Нажмите кнопку Start и введите свое имя. Нажмите сохранить и затем нужо выберать за кого вы хотите играть - 🔥 или 💧. Нажимайте на кнопки и соберите три символа. У вас есть 5 попыток!!!", style: .alert)
    }
     
    @IBAction func startButton(_ sender: Any) {
        self.startOneAlert(title: "Начнем игру!", message: "Введите ваше имя!", style: .alert)
    }
    
    @IBAction func gameButtons(_ sender: UIButton) {
        
        var setPlay = ["🔥", "💧", "🔥", "💧", "🔥", "💧", "🔥", "💧", "💧"]
        setPlay.shuffle()
        
        for index in setPlay {
        sender.setTitle(index, for: UIControl.State.normal)
//            setGameButtons(button: sender, play: index)
        }
        
//        if let numberPlayButtons = gameButtons.index(of: sender) {
//            setGameButtons(button: sender, play: setPlay[numberPlayButtons])
//        } else {
//            print("choosen card was not in cardButtons")
//        }
        
        
    }
    
    //Первый alert на кнопку Start (ввод имени - nameLable)
    func startOneAlert(title: String, message: String, style: UIAlertController.Style) {
        
        // Configure the alert controller.
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        // Create the action buttons 'Save' and 'Exit' for the alert.
        let actionSave = UIAlertAction(title: "Save", style: .default) { (actionSave) in
            
            let text = alertController.textFields?.first
            
            if (text?.text!)!.isEmpty == false {
            self.nameLable.backgroundColor = UIColor.black
            self.nameLable.textColor = UIColor.systemGreen
            self.nameLable.text! = (text?.text!)!
                
            self.startTwoAlert(title: "Начнем игру!", message: "Выберите кем вы хотите играть", style: .alert)
            }
        }
        
        let actionExit = UIAlertAction(title: "Exit", style: .default ) {(actionExit) in
            exit(0)
        }
        
        // Create alert controller.
        alertController.addAction(actionSave)
        alertController.addAction(actionExit)
        alertController.addTextField {(textField) in }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Второй alert на кнопку Start (выбор "🔥" или "💧" - playLable)
    func startTwoAlert (title: String, message: String, style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let actionWater = UIAlertAction(title: "💧", style: .default) {
            (actionCross) in
            self.playLable.text! = "💧"
            self.startButton.removeFromSuperview()
        }
        
        let actionFire = UIAlertAction(title: "🔥", style: .default) {
            (actionToe) in
            self.playLable.text! = "🔥"
            self.startButton.removeFromSuperview()
        }
        
        alertController.addAction(actionWater)
        alertController.addAction(actionFire)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //alert на кнопку helpButton
    func helpAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let actionOk = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(actionOk)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //lable-иконки на 9ть кнопок, при нажатие
    func setGameButtons (button: UIButton, play: String ) {
        
        if button.currentTitle != "" {
            button.setTitle(play, for: UIControl.State.normal)
        } else if button.currentTitle == play {
            button.setTitle("", for: UIControl.State.normal)
        }
    }
}

    
