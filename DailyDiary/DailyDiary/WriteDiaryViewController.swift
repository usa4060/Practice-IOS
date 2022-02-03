//
//  WriteDiaryViewController.swift
//  DailyDiary
//
//  Created by admin on 2022/01/27.
//

import UIKit

protocol WriteDiaryViewDelegate: AnyObject{
    func didSelectRegister(diary : DailyDiary)
}

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    private let datePicker = UIDatePicker()
    private var diaryDate : Date? // dataPicker에서 가져올 Date를 저장하는 프로퍼티
    weak var delegate: WriteDiaryViewDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.confirmButton.isEnabled = false
        self.configureInputField()
        
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
        // 즉 addTarget함수를 사용하여, target으로 하는 Controller가 for에 해당하는 Event가 방생하면, selector에 지정된 objc함수를 실행한다.
        
        self.datePicker.locale = Locale(identifier: "ko_KR")    // dataPicker가 화면에 나타날 때, 한글로 나타나게 설정 (원래는 영어)
        
        self.dateTextField.inputView = self.datePicker // 이렇게 하면, textField를 선택했을 때, text입력이 아닌 datePicker화면이 나타나게 된다.
        
                                                                            
    }
    
    private func configureInputField(){
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        
        guard let title = self.titleTextField.text else {return}
        guard let contents = self.contentsTextView.text else {return}
        guard let date = self.diaryDate else {return}
        let diary  = DailyDiary(title: title, contents: contents, date: date, isStar: false)
        self.delegate?.didSelectRegister(diary: diary)
        self.navigationController?.popViewController(animated: true)
        
    }
    @objc private func datePickerValueDidChange(_ datePicker : UIDatePicker){
        let formmater = DateFormatter() // DateFormmater객체는 날짜와 텍스트를 변환해주는 역할을 한다.
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"   // date를 나타냇 포맷 형식을 설정해줌.
        formmater.locale = Locale(identifier: "ko_KR")  // 한글로 설정
        self.diaryDate = datePicker.date    // datePicker에서 선택된 date의 값을 diaryDate에 저장해줌
        self.dateTextField.text = formmater.string(from: datePicker.date)   // diaryDate에 저장된 날짜 정보를 화먼의 dateTextField에 표현해줌
        self.dateTextField.sendActions(for: .editingChanged)    // dateTextfield는 현재, datePicker의 형태로 되어있기 때문에, 실제 Text를 입력할 수 없다.
                                                                // 그렇기에, datePicker의 값이 변경될 때 마다, editingChanged액션을 발생시켜서 dateTextFieldDidChange를 호출한다
    }
    
    @objc private func  titleTextFieldDidChange(_ textFiled: UITextField){
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField){
        self.validateInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // View상의 빈 곳을 누를 때 마다 keyboard나 datePicker가 사라지게 하는 매서드
        self.view.endEditing(true)
    }
    
    private func validateInputField(){  // 제목, 내용, 날짜 모두가 입력되었을 때, 등록버튼이 활성화 되게 하는 매서드
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
    
}

extension WriteDiaryViewController:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) { // textView에 text가 입력 될 때마다 실행되는 메서드
        self.validateInputField()
    }
}
