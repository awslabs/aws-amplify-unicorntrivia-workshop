//
//  QuestionView.swift
//
//  Created by Patzer, Sam on 7/20/18.
//  Copyright © 2018 Patzer, Sam. All rights reserved.
//

import UIKit
import QuartzCore

class QuestionView: UIView, UIGestureRecognizerDelegate {
    
    //Public
    var timerLayer : CAShapeLayer!
    var correctAnswers: Int!
    
    //Private - IBOutlets
    @IBOutlet private var questionLabel: UILabel!
    @IBOutlet private var answerViews: Array <AnswerView>!
    
    //Private Vars
    private var yourAnswer : Int!
    private var showTimer : Bool!
    
    /* Step five */
    func sendAnswer(){
        
    }
    
    func setupView(){
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
        correctAnswers = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (showTimer != nil && showTimer){
            let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 20.0)
            path.append(path)
            timerLayer = CAShapeLayer.init()
            timerLayer.frame = self.bounds
            timerLayer.path = path.cgPath
            timerLayer.strokeColor = UIColor.red.cgColor
            timerLayer.fillColor = nil
            timerLayer.lineJoin = CAShapeLayerLineJoin.bevel
            timerLayer.lineWidth = 15.0
            timerLayer.strokeStart = 0.05
            self.layer.addSublayer(timerLayer)
            
            let animationAround = CABasicAnimation(keyPath: "strokeEnd")
            animationAround.duration = 10.0
            animationAround.fromValue = 0
            animationAround.toValue = 0.55
            timerLayer.add(animationAround, forKey: "strokeEnd")
            
            let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "strokeColor")
            
            colorKeyframeAnimation.values = [
                UIColor.green.cgColor,
                UIColor(red:1.00, green:0.76, blue:0.07, alpha:1.0).cgColor,
                UIColor(red:0.92, green:0.13, blue:0.15, alpha:1.0).cgColor,
                UIColor.clear.cgColor]
            colorKeyframeAnimation.keyTimes = [0, 0.5, 1.0]
            colorKeyframeAnimation.duration = 10
            timerLayer.add(colorKeyframeAnimation,forKey: "strokeColor")
            showTimer = false
            
        }
    }
    
    func updateView(question: String!, answers: [String]!){
        questionLabel.text = question
        //questionLabel.sizeToFit()
        yourAnswer = -1
        showTimer = true
        for i in 0 ... answerViews.count-1 {
            updateAnswerView(answerID: i, answer: answers[i])
        }
        setNeedsLayout()
    }
    
    func updateAnswerView(answerID: Int!, answer:String!){
        let answerView = answerViews[answerID];
        answerView.assignNumber(number: answerID)
        answerView.isSelected = false
        answerView.updateView(answer: answer)
    }
    
    func handleAnswer(answerID: Int!){
        yourAnswer = answerID
        answerViews.forEach { (answerView) in
            answerView.removeTarget(nil, action: nil, for: .allEvents)
        }
        sendAnswer()
    }
    
    func checkIfNoAnswer(){
        if (yourAnswer < 0){
            sendAnswer()
        }
 
    }
    
    func showAnswer(correctAnswer: Int){
        if (yourAnswer > -1){
            answerViews[yourAnswer].backgroundColor = .red;
        }
        answerViews[correctAnswer].backgroundColor = .green;
        if (yourAnswer == correctAnswer){
            correctAnswers += 1
        }
    }
    
    func showFinalCard(didWin: Bool){
        questionLabel.removeFromSuperview()
        for i in 0 ... answerViews.count-1 {
            answerViews[i].removeFromSuperview()
        }
        let image = UIImageView(image: UIImage(named: (didWin ? "Winner" : "Loser")))
        image.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        image.contentMode = .scaleAspectFit
        self.addSubview(image)
    }

}
