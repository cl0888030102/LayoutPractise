//
//  ViewController.swift
//  LayoutPractise
//
//  Created by C&J on 6/17/19.
//  Copyright © 2019 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var redLabel = UILabel()
    var greenLabel = UILabel()
    var stackView = UIView()
    var diceBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackViewLayout()
        setupLabelsLayout()
        dataInitForLabels()
        diceBtnSetup()
        diceBtn.addTarget(self, action: #selector(diceBtnPressed), for: .touchUpInside)
    }
    fileprivate func setupStackViewLayout() {
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    fileprivate func setupLabelsLayout() {
        stackView.addSubview(redLabel)
        stackView.addSubview(greenLabel)
        redLabel.backgroundColor = UIColor.red
        greenLabel.backgroundColor = UIColor.green
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        redLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        redLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4).isActive = true
        redLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4).isActive = true
        
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        greenLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        greenLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4).isActive = true
        greenLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    
    fileprivate func dataInitForLabels() {
        //redLabel.text = "\(arc4random_uniform(6))"
        redLabel.textAlignment = .center
        redLabel.font = .systemFont(ofSize: 30, weight: .regular)
        
        //greenLabel.text = "\(arc4random_uniform(6))"
        greenLabel.textAlignment = .center
        greenLabel.font = .systemFont(ofSize: 30, weight: .regular)
    }
    
    fileprivate func diceBtnSetup() {
        stackView.addSubview(diceBtn)
        diceBtn.backgroundColor = UIColor.lightGray
        diceBtn.setTitle("Press", for: .normal)
        diceBtn.titleLabel?.textAlignment = .center
        diceBtn.titleLabel?.textColor = UIColor.white
        diceBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        diceBtn.translatesAutoresizingMaskIntoConstraints = false
        diceBtn.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        diceBtn.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        diceBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        diceBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    //var isRedWin: Bool = true
    var msg: String!
    var winerAlert: UIAlertController!
    @objc func diceBtnPressed(sender: UIButton){
        print("diceBtnPressed")
        redLabel.text = "\(arc4random_uniform(6)+1 )"
        greenLabel.text = "\(arc4random_uniform(6)+1)"
        if Int(redLabel.text!)! > Int(greenLabel.text!)! {
            msg = "Red is win"
        }else if Int(redLabel.text!)! == Int(greenLabel.text!)!{
            msg = "No winer"
        }else{
            msg = "Green is winer"
        }
        winerAlert = UIAlertController(title:"", message: msg, preferredStyle: .alert)
        let alertaction = UIAlertAction(title: "OK", style: .default, handler: nil)
        winerAlert.addAction(alertaction)
        present(winerAlert, animated: true, completion: nil)
        
    }
    


}

