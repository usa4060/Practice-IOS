# To-Do List

## 기능 상세
- TableView에 할 일을 추가할 수 있습니다.
- TableView에서 할 일을 삭제할 수 있습니다.
- TableView에서 할 일을 재정렬 할 수 있습니다.
- 할 일들은 데이터 저장소에 저장하여 앱을 재실행 해도 데이터가 유지되게 합니다

## 활용 기술
- UITableView
- UIAlertController
- UserDefault

---

## 1. **UITableView**
- 데이터를 목록 형태로 보여줄 수 있는 가장 기본적인 UI 컴포넌트
    - 또한, UIScrollView를 상속받아서 자유롭게 스크롤 기능을 추가 가능
- 여러개의 Cell을 가지고 있고 하나의 열과 여러줄 의 행을 가지고 있으며, 수직으로만 스크롤이 가능하다.
- Section을 활용하여 행을 그룹화하여 콘텐츠를 좀 더 쉽게 탐색할 수 있다.
- Section의 헤더와 푸터에 View를 구성하여 추가적인 정보를 표시할 수 있다.
- TableView를 이용하기 위해서는, UITableViewDataSource 와 UITableViewDelegate 프로토콜을 채택해야 한다. 
     - Datasource : Data를 받아서 View를 그려주는 역할을 한다.
        - 총 Section이 몇 개인지, Section의 행은 몇개인지, 행에 어떤 정보를 표시 할 것인지를 정의
     - Delegate : TableView의 동작과, 외관을 담당한다.
        - View가 변경되는 사항을 담당하여, View는 Delegate에 의존하여 Updata된다. 
        - 행의 높이, 행을 선택하면 취할 행위를 정의 할 수 있다.
        <br/><br/><br/>
    ### - UITableViewDataSource
    - UITavleViewDataSource는 TableView를 생성하고 수정하는데 필요한 정보를 TableView객체에 전달해준다.
    - UITableViewDataSource Protocol을 채택하여, 내부함수를 재정의 해서 사용한다.
    <br/><br/>

    ### - UITableViewDelegate
    - UITableViewDelegete는 TableView의 시각적인 부분을 설정하고, 행의 액션관리 , 엑세서리 뷰 지원 , 그리고 테이블뷰의 개별 행 편집을 도와줌

 ## 2. **UIAlertController**
```swift

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
 ```
 ## 3. **UserDefault**
 - UserDefault는 런타임 환경에 동작하면서 App이 실행되는 동안 기본저장소에 Data를 기록하고 가져오는 역할을 하는 인터페이스이다.
 - Key : Value 의 한쌍으로 저장이 되고, App 전체에 _**단 하나의 인스턴스만**_ 존재하게 된다.

---
## 코드 리뷰 (예정)
