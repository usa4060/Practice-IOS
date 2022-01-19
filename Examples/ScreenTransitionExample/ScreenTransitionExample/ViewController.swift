//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by admin on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapCodePushBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController")
        else {return}
        // 이렇게 intrantiateViewController라는 함수가 StoryBoard에서 ViewController에 정의해 준 id로, 해당하는 ViewController를 찾아서 인스턴스화 해준다!!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

