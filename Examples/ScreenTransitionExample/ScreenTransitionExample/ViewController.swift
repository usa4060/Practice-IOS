//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by admin on 2022/01/19.
//

import UIKit

class ViewController: UIViewController , SendDataDelegate{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapCodePushBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController
        else {return}
        // 이렇게 intrantiateViewController라는 함수가 StoryBoard에서 ViewController에 정의해 준 id로, 해당하는 ViewController를 찾아서 인스턴스화 해준다!!
        
        // 또한, viewController 변수를 CodePushViewController로 다운캐스팅 해줘서 CodePushViewController의 프로퍼티인 name에 접근할 수 있게 해준다.
 
        viewController.name = "Yongin"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresentBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else {return}
        viewController.modalPresentationStyle = .fullScreen
        
        viewController.name = "Yongin"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController{
            // 이 'segue.deftination'프로퍼티를 통해 전환하려는 ViewController의 인스턴스를 가져올 수 있다.
            viewController.name = "yongin"
        }
        
    }
    
    
    func SendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

