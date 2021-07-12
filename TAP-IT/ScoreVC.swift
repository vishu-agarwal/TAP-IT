//
//  ScoreVC.swift
//  TAP-IT
//
//  Created by DCS on 12/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    let token = UserDefaults.standard.string(forKey: "Token")
    let name = UserDefaults.standard.string(forKey: "Name")
    let score = UserDefaults.standard.string(forKey: "Score")
    
    private let MyImageView: UIImageView = {
        
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        myImageView.image = UIImage(named: "lead")
        myImageView.layer.cornerRadius = 50
        return myImageView
        
    }()
    
    
    
    private let Name : UILabel = {
        let label = UILabel()
        label.text = "Name : "
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    private let Score : UILabel = {
        let label = UILabel()
        label.text = "Score : "
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let Nametxt : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    private let Scoretxt : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let btn : UIButton = {
        let btn = UIButton()
        btn.setTitle(" Play Again ! ", for:.normal)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(again), for: .touchUpInside)
        btn.frame = CGRect(x: 65, y: 500, width: 250, height: 60)
        return btn
        
    }()
    
    @objc private func again(){
    
    let vc = ViewController()
    self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        Nametxt.text = name
        Scoretxt.text = score
        
        title  = "SCOREBOARD"
        
        view.addSubview(MyImageView)
       
        view.addSubview(Name)
        view.addSubview(Score)
        view.addSubview(Nametxt)
        view.addSubview(Scoretxt)
        view.addSubview(btn)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        MyImageView.frame = CGRect(x: 50, y: view.safeAreaInsets.top + 30, width: 300, height: 200)
       
        Name.frame = CGRect(x: 5, y: MyImageView.bottom + 30, width: 100, height: 50)
        Nametxt.frame = CGRect(x: 100, y: MyImageView.bottom + 23, width: 200, height: 50)
        Score.frame = CGRect(x: 5, y: Nametxt.bottom + 20, width: 100, height: 50)
        Scoretxt.frame = CGRect(x: 100, y: Nametxt.bottom + 20, width: 150, height: 50)
        btn.frame = CGRect(x: 100, y: Scoretxt.bottom + 30, width: 150, height: 50)
        
    }

}
