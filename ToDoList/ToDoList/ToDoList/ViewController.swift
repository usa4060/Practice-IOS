//
//  ViewController.swift
//  ToDoList
//
//  Created by admin on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var editBtn: UIBarButtonItem!
    var doneBtn: UIBarButtonItem?
    
    
    var tasks = [Task]() {
        didSet{
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTap))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 이렇게 선언을 함으로써, ViewController가 tableViewDataSource protocol을 채택하게 된다.
        // 물론 따로 선언도 해줘야함
        self.loadTasks()
    }
    
    @objc func doneBtnTap(){
        self.navigationItem.leftBarButtonItem = self.editBtn
        self.tableView.setEditing(false, animated: true)
    }
    
    
        
    
    @IBAction func tapEditBtn(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else {return}
        self.navigationItem.leftBarButtonItem = self.doneBtn
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddBtn(_ sender: UIBarButtonItem) {
        
        // alert은 UIAlertController를 호출해서 표시되게 한다.
        // IOS에서 alert(알럿)은 기기의 상태나 중요한 정보를 전달하며, 종종 사용자에게 피드백을 요청하기 위해 사용이 된다
        //  => 우리가 어떤 파일을 지우기 위해 "삭제하기"를 눌렀을 때, 화면상에 팝업창 처럼 나타나서 "삭제하시겠습니까? 삭제하기 / 취소" 와 같은 창을 말한다.
        // alert창은 제목 / 메세지 / 하나이상의 버튼 및 입력을 수집하기 위한 text필드로 구성된다.

        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        // preferredStyle에는 [액션시트 / 알럿] 이렇게 두 종류가 있는데, 액션시트는 화면의 하단에서 표시되는 녀석 (ex. sns에서 공유하기를 눌렀을 떄, 공유하기 관련 설정이 하단에서 등장하는 것 마냥)
        // 알럿은 화면의 중단에서 표시되는 녀석 (ex. 앨범에서 사진 삭제를 눌렀을 때, 화면의 중앙에서 [삭제하기 / 취소] 와 같이 표시되는 것)
        
        let registerBtn = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else {return}
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData() // tasks배열에 data가 추가될 때 마다, tableView를 갱신해서 데이터를 Load해온다.
        })
        // handler내부에는 사용자가 alert버튼을 눌렀을때 어떤 행동을 할 것인지에 대한 클로저를 정의해주면 된다!!
        let cancleBtn = UIAlertAction(title: "취소", style: .cancel, handler: nil)
         
        
        alert.addAction(cancleBtn)
        alert.addAction(registerBtn)
        alert.addTextField(configurationHandler: {
            textField in textField.placeholder = "할 일을 입력해주세요!"
        })
        // 이렇게 위의 2개의 버튼 및 1개의 텍스트 필드로 알터를 구성하게 된다.
        
        self.present(alert, animated: true, completion: nil)
        // present를 통해 alert라는 viewController 호출
        
       
    }
    
    func saveTasks(){
        let data = self.tasks.map{
            [
                "title":$0.title,
                "done":$0.done
            ]
        }
        // map이라는 고차함수를 이용하여, task배열에 있는 요소를 dictionary로 매핑 시켜준다.
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks(){
        let userDefauls = UserDefaults.standard
        guard let data = userDefauls.object(forKey: "tasks") as? [[String:Any]] else {return}
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else {return nil}
            guard let done = $0["done"] as? Bool else {return nil}
            return Task(title: title, done: done)
        }
    }
        
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
   
}



extension ViewController : UITableViewDataSource{
    
    // UITableViewDataSource 프로토콜을 채택하게 되면, 옵셔널로 선언되지않은 내부 매서드를 반드시 구현 해줘야 한다!!
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty{
            self.doneBtnTap()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
        // numberOfRowsInSection 매서드는, 각 Section에 표시할 행의 갯수를 return해준다.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 이렇게 하면, StoryBoard에 정의한 Cell을 'dequeReusableCell'이라는 매서드를 통해서 가져오게 된다.
        // 이렇게 가져온 Cell을 return 하게 되면, StoryBoard에서 구현된 Cell이 tableView에 나타나게 된다.
        
        
        // dequeReusableCell은 withIdentifier에 ID값을 넘겨주면, 해당 값을 통해 재사용할 Cell을 찾게 된다.
        // 그리고 for 파라미터에는 indexPath를 넘겨주는데 그 이유는, indexPath위치의 Cell을 재사용하기 위해서이다.
        // 쉽게 말해서 이 매서드를 이용하여 Queue자료구조를 통해 Cell을 재사용 하는 것이다.
        
        // Cell을 재사용 한다는 의미는 쉽게 말해서 우리가 화면에서 5개의 Cell만을 가지고 구성을 하였는데, Scroll을 내리면서 새로운 데이터들이 늘어나도
        // Queue구조의 특징인 FIFO를 통해 5개의 Cell을 재사용해서 데이터를 넣고 빼고 해준다.
        // 이를 통해 다량의 데이터가 들어와도, 그 때마다 새로 Cell을 만드는게 아니라 Cell을 재사용 함으로서 메모리의 낭비를 줄여준다
        
        let task = self.tasks[indexPath.row]    // indexPath는 TableView에서 Cell의 위치를 나타내는 index이다. (section과 row속성으로 정의됨)
                                                // ex) section과 row가 0이라면 가장 위에 있는 Cell의 위치를 의미한다.
                                                // NumberOfRowsInSection 함수에서 row의 갯수를 우리가 만드는 task수와 일치하도록 구성했기 때문에,
                                                // indexPath.row는 0부터 tasks.count까지의 값을 가진다.
        cell.textLabel?.text = task.title
        if task.done{
            cell.accessoryType = .checkmark
        } else{
            cell.accessoryType = .none
        }
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
