//
//  ViewController.swift
//  LEDBillboard
//
//  Created by admin on 2022/01/19.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettiongDelegate {

    @IBOutlet weak var ContentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ContentsLabel.textColor = .yellow
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController{
            settingViewController.delegate = self
            // delegate = self로 해줘야 일을 위임 받는 것이다!!!
            // 지금 다시 보니까, 맞는거긴 하지만 뭔가 Logic이 편법 쓰는 것 처럼 보임,,,,
            settingViewController.ledText = self.ContentsLabel.text
            settingViewController.textColor = self.ContentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text{
            self.ContentsLabel.text = text
        }
        self.ContentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}

