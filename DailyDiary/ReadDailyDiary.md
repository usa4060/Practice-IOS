# DailyDiary

## 기능 상세
- 일기장 탭을 누르면 일기 리스트를 표시할 수 있다.
- 즐겨찾기 탭을 누르면 즐겨찾기한 일기의 리스트를 확인할 수 있다.
- 일기를 등록, 수정, 삭제, 즐겨찾기 할 수 있습니다.

## 활용 기술
- UITapBarController
- UICollectionView
- NotificationCenter
---

## 1. UITapBarController  
- UITapBar
    - 앱에서 서로다른 하위작업, 뷰, 모드 사이의 선택을 할 수 있도록 탭바에 하나이상의 버튼을 보여주는 컨트롤러
    - 탭바에 있는 버튼 하나하나를 UITapBarItem이라고 한다.
    - 탭바는 항상 스크린의 하단에 나타난다.
- UITapBarController
    - 다중선택 인터페이스를 관리하는 컨테이너 뷰 컨트롤러로, 선택에 따라 어떤 Child-ViewController를 보여줄 것인지 결정한다.  
        - ( flutter에서 바텀네비게이션과 동일한 역할 )

    - TapBar에 있는 Item을 선택함에 따라, 해당 Item에 연결되어 있는 ViewContoller를 호출하여 Custom-View를 화면상에 나타낸다.
## 2. UICollectionView
- 데이터 항목의 정렬된 Collection을 관리하고 커스텀한 layout을 사용해 표시하는 객체
- TableView와 마찬가지로 ScrollView를 상속받는으며, 다양한 layout을 보여줄 때 많이 사용한다.
                <br/><br/>
     ### UICollectionView의 구성요소
    - Cell : CollectionView의 주요 데이터를 표시한다. 
    - Supplementary View : 해당 Section에 대한 정보를 나타낸다. (필수 x)
    - Decoration View : CollectionView에 대한 배경을 꾸밀 때 사용.
                <br/><br/>
    ### CollectionView Layouts
    - UICollectionViewLayout : Layout객체를 통해서 CollectionView내의 Item배치 및 시각적인 스타일을 결정한다.  
                <br/>
    - <span style="color:yellow">**UICollectionViewFlowLayout**</span>: Layout객체를 사용해서 각 항목을 정렬할 수 있는데, 해당 Class를 사용하게 되면 Cell을 원하는 형태로 정렬할 수 있다.
        - FlowLayout은 Cell의 선형경로를 배치하는데, 최대한 행을 따라 많은 Cell을 배치하고 현재의 행에 더이상 Cell이 들어가지 않는다면 새로운 행을 만들어 채워나간다.
        - FlowLayout을 통해 수평 스크롤 / 수직 스크롤이 가능하다.  
                <br/>
        - **FlowLayout의 구성단계**
            1. FlowLayout객체를 작성하고, 이를 CollectionView에 할당한다.
            2. Cell의 width/height를 결정한다.
            3. 필요할 경우, Cell간의 상하좌우 최소간격을 설정한다.
                - 이 때, Cell들의 크기가 다를경우에는 Cell간의 간격이 서로 다르게 나타날 수 있다. 
                - 뿐만 아니라, Cell들과 Section자체의 간격을 부여할 수 있다.
                    ```swift
                    inset = UIEdgeInsetsMake(top, left, bottom, right)
                    ```
            4. Section에 header/footer가 존재한다면 이것들의 크기를 정한다.
            5. Layout의 스크롤 방향을 설정한다.  
                         <br/>
    - **<span style="color:yellow">UICollectionViewDataSource</span>**
        - CollectionView로 보여지는 Contents들을 관리하는 객체
        - DataSource를 관리하기 위해서는 UICollectionViewDataSource Protocol을 준수해야한다.
            - 해당 protocol에서 optional로 선언되지 않은 func들은 필수적으로 구현해야 함.
        - DataSource의 역할은, 
            1. CollectionView에 몇 개의 Section이 있는지 
            2. 특정 Section에 몇 개의 Cell이 있는지
            3. 특정 Section이나 Cell에 Contents를 보여주기 위해, 어떤 View를 사용할 것인지에 대한 정보를 CollectionView에 제공한다.  
                         <br/>
    - **<span style="color:yellow">UICollectionViewDelegate</span>**
        - Contents의 표현, 사용자와의 상호작용과 관련된 것들을 관리하는 객체
        - DataSource와는 다르게, Delegate는 필수로 구현하지 않아도 괜찮다.  
                            <br/>
    - CollectionView와 관련된 핵심 객체들의 관계  
    **_( blog에 관련 내용 작성 할 예정 )_**

---
## 개발하면서 생겼던 errors & 알아야 할 기능  <br/>

## 1. TextView와 ScrollView와의 관계
- TextView는 ScrollView를 상속받기 때문에, TextView 내부의 내용이 아무리 길어져도 자동으로 Scroll이 생성되어 제약없이 읽어나가기 가능

(추가적인 코드리뷰 진행...)