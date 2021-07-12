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
        
        return myImageView
        
    }()
    
    private let LeaderBoard : UILabel = {
        let label = UILabel()
        label.text = "ScoreBoard"
        label.textColor = .yellow
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    
    
    private let Name : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    private let Score : UILabel = {
        let label = UILabel()
        label.text = "Score"
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    private let Nametxt : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    private let Scoretxt : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        Nametxt.text = name
        Scoretxt.text = score
        view.addSubview(MyImageView)
        view.addSubview(LeaderBoard)
        view.addSubview(Name)
        view.addSubview(Score)
        view.addSubview(Nametxt)
        view.addSubview(Scoretxt)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        MyImageView.frame = CGRect(x: 100, y: view.safeAreaInsets.top + 10, width: view.width/2, height: 150)
        LeaderBoard.frame = CGRect(x: 120, y: MyImageView.bottom + 5, width: view.width, height: 50)
        Name.frame = CGRect(x: 10, y: LeaderBoard.bottom + 20, width: 100, height: 50)
        Nametxt.frame = CGRect(x: 200, y: LeaderBoard.bottom + 20, width: 150, height: 50)
        Score.frame = CGRect(x: 10, y: Nametxt.bottom + 20, width: 100, height: 50)
        Scoretxt.frame = CGRect(x: 200, y: Nametxt.bottom + 20, width: 150, height: 50)
        
    }

}
