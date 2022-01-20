//
//  RoundButton.swift
//  Calculator
//
//  Created by admin on 2022/01/20.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    // UIButton을 상속받은 class이기 때문에, 기존에 있는 UIButton의 속성들을 그대로 Custom해서 사용 가능하다!!
      @IBInspectable var isRound : Bool = false {
        didSet {
            if isRound{
                self.layer.cornerRadius = self.frame.height/2
            }
        }
    }
   

}
