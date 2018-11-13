//
//  ViewController.swift
//
//  Created by Patzer, Sam on 7/12/18.
//  Copyright © 2018 Patzer, Sam. All rights reserved.
//

import UIKit
import AVKit
//import AWSAppSync

class ViewController: UIViewController {

    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var questionView: QuestionView!
    var gameID : String!
    var gameStarted : Bool!
    var player : AVPlayer!
    
    private var questionYConstraint : NSLayoutConstraint?
    private var totalQuestions : Int!
    private var answeredQuestions : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup total number of questions
        totalQuestions = 12
        answeredQuestions = 0
        
        playVideoEmbedded()
        setupQuestionView()
        registerNotifications()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    /* Step two */
    func playVideoEmbedded() {
        
    }
    
    /* Step three */
    func startSubForQuestions(){
        
    }
    
    /* Step four */
    func startSubForAnswers(){
        
    }
    
    /* Step five */
    func setupUser(username: String){
        
    }
    
    /*
     HELPER FUNCTIONS
     Shouldn't need to be changed during the workshop.
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showWelcomePage()
    }
    
    func showWelcomePage(){
        let welcome = UIAlertController(title: "Welcome to Unicorn Trivia", message: "", preferredStyle: .alert)
        let loginAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            let usernameField = welcome.textFields![0] as UITextField
            self.startSubForQuestions()
            self.setupUser(username: usernameField.text!);
        }
        loginAction.isEnabled = false
        welcome.addTextField { (textField) in
            textField.placeholder = "Username"
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main, using: { (notification) in
                loginAction.isEnabled = textField.text != ""
            })
        }
        welcome.addAction(loginAction)
        self.present(welcome, animated: true, completion: nil)
    }
    
    func registerNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.toBackground(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.toForeground(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func toBackground(_ sender:Any){
        self.player.pause()
        //self.newQuestionSubWatcher?.cancel()
    }
    
    @objc func toForeground(_ sender:Any){
        //self.player.play()
        self.player.playImmediately(atRate: 1.0)
        //self.newQuestionSubWatcher?.cancel()
    }
    
    
    func animateAfterQuestionReturn(){
        UIView.animate(withDuration: 0.5, animations: {
            self.questionYConstraint?.constant = -1*(self.questionView.frame.size.height) - 30
            self.view.layoutIfNeeded()
        }, completion:{ (completed) in
            if (completed == true){
                DispatchQueue.main.asyncAfter(deadline: .now() + 9.1, execute: {
                    let midX = self.questionView.center.x
                    let midY = self.questionView.center.y
                    let animation = CABasicAnimation(keyPath: "position")
                    animation.duration = 0.06
                    animation.repeatCount = 4
                    animation.autoreverses = true
                    animation.fromValue = CGPoint(x: midX - 10, y: midY)
                    animation.toValue = CGPoint(x: midX + 10, y: midY)
                    self.questionView.layer.add(animation, forKey: "position")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                        self.hideQuestion(answer:false)
                        self.answeredQuestions += 1
                    })
                })
            }
        })
    }
    
    func animateAfterAnswerReturn(){
        UIView.animate(withDuration: 0.5, animations: {
            self.questionYConstraint?.constant = -1*(self.questionView.frame.size.height) - 30
            self.view.layoutIfNeeded()
        }, completion:{ (completed) in
            if (completed == true){
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                    self.hideQuestion(answer:true)
                    if (self.answeredQuestions == self.totalQuestions){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                            self.showFinalCard()
                        })
                    }
                })
            }
        })
    }
    
    
    func showFinalCard(){
         self.questionView.showFinalCard(didWin: self.questionView.correctAnswers == self.totalQuestions)
        UIView.animate(withDuration: 0.5, animations: {
            self.questionYConstraint?.constant = -1*(self.questionView.frame.size.height) - 30
            self.view.layoutIfNeeded()
        }, completion:{ (completed) in
            
        })
    }
    
    func hideQuestion(answer: Bool){
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            self.questionYConstraint?.constant = 30
            self.view.layoutIfNeeded()
            if (!answer){
                self.questionView.checkIfNoAnswer()
                self.startSubForAnswers()
            } else {
                self.startSubForQuestions()
            }
        }, completion: {(success) in
            if (self.questionView.timerLayer != nil){
                self.questionView.timerLayer.removeFromSuperlayer()
                self.questionView.timerLayer.removeAllAnimations()
            }
        })
        
    }
    
    func setupQuestionView(){
        questionYConstraint = NSLayoutConstraint(item: questionView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 15)
        self.view.addConstraint(questionYConstraint!)
        questionView.setupView()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /* Embedded player layer */
    func addVideoPlayer(videoUrl: URL, to view: UIView) {
        self.player = AVPlayer(url: videoUrl)
        let layer: AVPlayerLayer = AVPlayerLayer(player: self.player)
        
        layer.backgroundColor = UIColor.white.cgColor
        layer.frame = UIScreen.main.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.sublayers?
            .filter { $0 is AVPlayerLayer }
            .forEach { $0.removeFromSuperlayer() }
        view.layer.addSublayer(layer)
        
        self.player.play()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

