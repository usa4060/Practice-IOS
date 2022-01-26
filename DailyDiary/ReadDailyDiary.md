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