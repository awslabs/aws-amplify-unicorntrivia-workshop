//
//  AnswerView.swift
//
//  Created by Patzer, Sam on 7/20/18.
//  Copyright © 2018 Patzer, Sam. All rights reserved.
//

import UIKit

class AnswerView: UIButton {
    //Public
    
    //Private - IBOutlets
    
    //Private - Vars
    private var answerLabel : UILabel!
    private var answerValue : Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Setup View Looks
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        
        //Clear labels and set fonts and bounds
        answerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: self.bounds.width-20, height: self.bounds.height))
        answerLabel.text = ""
        answerLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        //Add label
        self.addSubview(answerLabel)
        
    }
    
    func updateView(answer:String!){
        //AnswerLabel reset
        answerLabel.text = answer
        answerLabel.textColor = .black
        
        //Background reset
        backgroundColor = .white
        
        //Readd selectors
        self.addTarget(self, action: #selector(self.buttonTouchDown(_:)), for: .touchDown)
        self.addTarget(self, action: #selector(self.buttonUpInside(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(self.buttonUpOutside(_:)), for: .touchUpOutside)
    }
    
    //Get-Setter for which answer this is
    func assignNumber(number: Int!){
        answerValue = number
    }
    func getNumber() -> Int{
        return answerValue
    }
    
    //OBJ-C FUNCTIONS: #SELECTORS
    @objc func buttonTouchDown(_ sender: AnswerView){
        backgroundColor = .blue
        answerLabel.textColor = .white
    }
    
    @objc func buttonUpInside(_ sender: AnswerView){
        backgroundColor = .darkGray
        answerLabel.textColor = .white
        (self.superview as! QuestionView).handleAnswer(answerID: answerValue)
    }
    
    @objc func buttonUpOutside(_ sender: AnswerView){
        backgroundColor = .white
        answerLabel.textColor = .black
    }

}
