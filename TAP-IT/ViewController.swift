//
//  ViewController.swift
//  TAP-IT
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var time = 30
    
    var score = 0
    
    var name : String = " "
    
    private var timer = Timer()
    
    // create 9 by 9 view
    
    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 50, y: view.safeAreaInsets.top + 80, width: 80, height: 80)
        return view
    }()
    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 150, y: view.safeAreaInsets.top + 80, width: 80, height: 80)
        return view
    }()
    private let view3 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 250, y: view.safeAreaInsets.top + 80, width: 80, height: 80)
        return view
    }()
    private let view4 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 50, y:180, width: 80, height: 80)
        return view
    }()
    private let view5 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 150, y: 180, width: 80, height: 80)
        return view
    }()
    private let view6 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 250, y: 180, width: 80, height: 80)
        return view
    }()
    private let view7 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 50, y: 280, width: 80, height: 80)
        return view
    }()
    private let view8 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 150, y: 280, width: 80, height: 80)
        return view
    }()
    private let view9 : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.frame = CGRect(x: 250, y: 280, width: 80, height: 80)
        return view
    }()
    
    private let timelbl: UILabel = {
        let label = UILabel()
        label.text = "30"
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 25)
        label.frame = CGRect(x: 100, y: 370, width: 70, height: 50)
        return label
    }()
    
    private let seclbl: UILabel = {
        let label = UILabel()
        label.text = "Seconds"
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 20)
        label.frame = CGRect(x: 170, y: 370, width: 100, height: 50)
        return label
    }()
    
    
    private let Scorelabel : UILabel = {
        let label = UILabel()
        label.text = "Score : "
        label.isHidden = true
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 100, y: 450, width: 80, height: 50)
        return label
    }()
    
    private let Score : UILabel = {
        let label = UILabel()
        label.text = "0"
        label.isHidden = true
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 25)
        label.frame = CGRect(x: 175, y: 450, width: 80, height: 50)
        return label
    }()
    
    private let Title : UILabel = {
        let label = UILabel()
        label.text = "Tap It"
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 30)
        label.frame = CGRect(x: 140, y: 100 , width: 120, height: 50)
        return label
    }()
    
    
    private let btn : UIButton = {
        let btn = UIButton()
        btn.setTitle(" START ", for:.normal)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(starttimer), for: .touchUpInside)
        btn.frame = CGRect(x: 130, y: 420, width: 120, height: 60)
        return btn
        
    }()
    
    @objc private func starttimer()
    {
        
        
        btn.isHidden = true
        //myTextView.isHidden = true
        Scorelabel.isHidden = false
        Score.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Timerstart), userInfo: .none, repeats: true)
        
    }
    
    /*  private let myTextView : UITextView = {
     
     let textView = UITextView()
     textView.text = "Tap On The Highlighted Brown Box To Earn 10 Points, Tap Within The Stipulated Time, Click On Start To Begin"
     textView.textAlignment = .center
     textView.backgroundColor = .clear
     textView.textColor = .blue
     textView.frame = CGRect(x: 65, y: 490, width: 250, height: 100)
     textView.font = .boldSystemFont(ofSize: 15)
     textView.isEditable = false
     return textView
     }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .white
        
        
        view.addSubview(Scorelabel)
        view.addSubview(Score)
        view.addSubview(seclbl)
        view.addSubview(timelbl)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        view.addSubview(view6)
        view.addSubview(view7)
        view.addSubview(view8)
        view.addSubview(view9)
        view.addSubview(btn)
        //  view.addSubview(myTextView)
        view.addSubview(Title)
        
        let alert = UIAlertController(title: "Rules", message: "Tap On Highlighted Box To Earn +10 Point, Else loose -5 Point, Tap Within Given Time, Click Start To Begin", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
        let tapgesture1 = UITapGestureRecognizer(target: self, action: #selector(didtapview1))
        tapgesture1.numberOfTapsRequired = 1
        tapgesture1.numberOfTouchesRequired = 1
        
        let tapgesture2 = UITapGestureRecognizer(target: self, action: #selector(didtapview2))
        tapgesture2.numberOfTapsRequired = 1
        tapgesture2.numberOfTouchesRequired = 1
        
        let tapgesture3 = UITapGestureRecognizer(target: self, action: #selector(didtapview3))
        tapgesture3.numberOfTapsRequired = 1
        tapgesture3.numberOfTouchesRequired = 1
        
        let tapgesture4 = UITapGestureRecognizer(target: self, action: #selector(didtapview4))
        tapgesture4.numberOfTapsRequired = 1
        tapgesture4.numberOfTouchesRequired = 1
        
        let tapgesture5 = UITapGestureRecognizer(target: self, action: #selector(didtapview5))
        tapgesture5.numberOfTapsRequired = 1
        tapgesture5.numberOfTouchesRequired = 1
        
        let tapgesture6 = UITapGestureRecognizer(target: self, action: #selector(didtapview6))
        tapgesture6.numberOfTapsRequired = 1
        tapgesture6.numberOfTouchesRequired = 1
        
        let tapgesture7 = UITapGestureRecognizer(target: self, action: #selector(didtapview7))
        tapgesture7.numberOfTapsRequired = 1
        tapgesture7.numberOfTouchesRequired = 1
        
        let tapgesture8 = UITapGestureRecognizer(target: self, action: #selector(didtapview8))
        tapgesture8.numberOfTapsRequired = 1
        tapgesture8.numberOfTouchesRequired = 1
        
        let tapgesture9 = UITapGestureRecognizer(target: self, action: #selector(didtapview9))
        tapgesture9.numberOfTapsRequired = 1
        tapgesture9.numberOfTouchesRequired = 1
        
        
        view1.addGestureRecognizer(tapgesture1)
        view2.addGestureRecognizer(tapgesture2)
        view3.addGestureRecognizer(tapgesture3)
        view4.addGestureRecognizer(tapgesture4)
        view5.addGestureRecognizer(tapgesture5)
        view6.addGestureRecognizer(tapgesture6)
        view7.addGestureRecognizer(tapgesture7)
        view8.addGestureRecognizer(tapgesture8)
        view9.addGestureRecognizer(tapgesture9)
        
        // Do any additional setup after loading the view.
    }
}
    extension ViewController{
        
        @objc private func didtapview1(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view1.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        
        @objc private func didtapview2(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view2.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        @objc private func didtapview3(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view3.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        @objc private func didtapview4(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view4.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        @objc private func didtapview5(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view5.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        @objc private func didtapview6(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view6.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        @objc private func didtapview7(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view7.backgroundColor!.isEqual(UIColor.orange))
            {
                print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        @objc private func didtapview8(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view8.backgroundColor!.isEqual(UIColor.orange))
            {
                //print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                //print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        @objc private func didtapview9(_ gesture:UITapGestureRecognizer, _ sender:UIView){
            print("Tapped at Location : \(gesture.location(in: sender))")
            //print(sender)
            if(self.view9.backgroundColor!.isEqual(UIColor.orange))
            {
                //print("yes")
                self.score += 10
                Score.text = String(score)
            }
            else{
                //print("No")
                self.score -= 5
                Score.text = String(score)
            }
            
        }
        
        
        
        
        @objc private func Timerstart(){
            //print("timer Fired")
            self.time -= 1
            self.timelbl.text = String(self.time)
            //print(self.time)
            
            //calling random number
            let randomInt = Int.random(in: 1..<10)
            //print(randomInt)
            if( randomInt == 1)
            {
                view1.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
                
            }
            else if(randomInt == 2)
            {
                view2.backgroundColor = .orange
                view1.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 3)
            {
                view3.backgroundColor = .orange
                view2.backgroundColor = .red
                view1.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 4)
            {
                view4.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view1.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 5)
            {
                view5.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view1.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 6)
            {
                view6.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view1.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 7)
            {
                view7.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view1.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 8)
            {
                view8.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view1.backgroundColor = .red
                view9.backgroundColor = .red
            }
            else if(randomInt == 9)
            {
                view9.backgroundColor = .orange
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view1.backgroundColor = .red
            }
            
            if(self.time==0){
                timer.invalidate()
                view1.backgroundColor = .red
                view2.backgroundColor = .red
                view3.backgroundColor = .red
                view4.backgroundColor = .red
                view5.backgroundColor = .red
                view6.backgroundColor = .red
                view7.backgroundColor = .red
                view8.backgroundColor = .red
                view9.backgroundColor = .red
                
                let alert = UIAlertController(title: "Congralutions Your Score Is \(score)", message: " ", preferredStyle: .alert)
                alert.addTextField { (tf) in tf.placeholder = "Enter Your Name"}
                
                let action = UIAlertAction(title: "submit", style: .default) { (_) in
                    self.name = (alert.textFields?.first?.text)!
                    UserDefaults.standard.setValue("asdfghjkl", forKey: "Token")
                    UserDefaults.standard.setValue(self.name, forKey: "Name")
                    UserDefaults.standard.setValue(self.score, forKey: "Score")
                    let vc = ScoreVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
                alert.addAction(action)
                present(alert , animated: true , completion: nil)
            }
        }
    }

