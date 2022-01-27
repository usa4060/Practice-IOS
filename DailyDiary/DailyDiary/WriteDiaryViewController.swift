//
//  WriteDiaryViewController.swift
//  DailyDiary
//
//  Created by admin on 2022/01/27.
//

import UIKit

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    private var diaryDate : Date? // dataPicker에서 가져올 Date를 저장하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
    }
    
    private func configureContentsTextView(){   // 처음 TextView에는 border설정이 되어있지 않기 때문에, Custom해서 만들어주었다.
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    private func configureDatePicker(){
        self.datePicker.datePickerMode = .date  // datePicker에서 date관련 정보만 가져온다
        
        self.datePicker.preferredDatePickerStyle = .wheels  // datePicker의 스타일을 wheel 방식으로 설정
        
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        // UIContoller 객체가 이벤트에 응답하는 방식을 설정해준다. 즉, 화면에 어떻게 나타낼것인지 설정해줌
        // 첫번째 파라미터에는 target으로 하는 Controller를 설정한다. (여기서는 본인 ViewController이므로 self로 설정)
        // 두번째 파라미터에는 이벤트가 발생하였을 때 그에 응답하여 호출될 메서드를 넘겨준다. 세번째 파라미터에는 어떠한 이벤트가 발생했을 때, action에 정의한 메서드를 호출할 것인지 설정
        
        self.datePicker.locale = Locale(identifier: "ko_KR")    // dataPicker가 화면에 나타날 때, 한글로 나타나게 설정 (원래는 영어)
        
        self.dateTextField.inputView = self.datePicker // 이렇게 하면, textField를 선택했을 때, text입력이 아닌 datePicker화면이 나타나게 된다.
        
                                                                            
    }
    
    
    @IBAction func confirmButton(_ sender: UIBarButtonItem) {
    }
    
    @objc private func datePickerValueDidChange(_ datePicker : UIDatePicker){
        let formmater = DateFormatter() // DateFormmater객체는 날짜와 텍스트를 변환해주는 역할을 한다.
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"   // date를 나타냇 포맷 형식을 설정해줌.
        formmater.locale = Locale(identifier: "ko_KR")  // 한글로 설정
        self.diaryDate = datePicker.date    // datePicker에서 선택된 date의 값을 diaryDate에 저장해줌
        self.dateTextField.text = formmater.string(from: datePicker.date)   // diaryDate에 저장된 날짜 정보를 화먼의 dateTextField에 표현해줌
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // View상의 빈 곳을 누를 때 마다 keyboard나 datePicker가 사라지게 하는 매서드
        self.view.endEditing(true)
    }
    
    
}
