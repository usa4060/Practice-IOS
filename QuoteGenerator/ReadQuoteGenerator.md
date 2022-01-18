# 명언 생성기

- ## 기능상세 
    - 버튼을 누를 때 마다 랜덤한 명언이 생성됨

- ## 활용기술
    - Storyboard
    - AutoLayout
    - UILabel
    - UIButton

- ## 기능 구현에 앞서 알아야 할 기술들
    - UIKit
    - UIViewController
    - AutoLayout
    - IBOutlet & IBAction


---
## 1. UIKit
- <span style="color:yellow">Cocoa touch Framework</span> 란 IOS개발환경을 구축하기 위한 최상위 프레임워크
    - 이 중, 가장 많이 사용되는 프레임워크가 UIKit & Foundation이다.
        - foundation : 기본적 데이터타입, 자료구조, 각종 구조체, 네트워크 통신 등 기본적인 프로그램의 중심을 담당한다.
        - <span style="color:yellow">**UIKit**</span> : 사용자의 인터페이스를 관리하고, 이벤트를 처리하는것이 주 목적이다.

- UIViewController, UIView와 같은 UI가 붙는 클래스들을 사용하기 위해서는 반드시 UIKit을 import해 줘야 한다.
- UIKit의 구조는 기본적으로 MVC structure를 사용한다.
    - M : Model / V : View / C : Controller
        - Model은 앱의 데이터와 비지니스 로직을 가지고 있다.
        - View는 사용자에게 데이터를 보여주는 UI를 담당한다.
        - Controller는 Model과 View의 중간 다리로서, View로부터 사용자 action을 받아와서 Model에게 어떤 작업을 해야하는지 알려주거나 / Model의 데이터 변화를 View에게 전달하여, View를 어떻게 updata할 지 알려준다.

    - 쉽게 말해서, Model : 무엇을 / Controller : 어떻게 / View : 보여 줄 것인가 의 구조

    - 현실의 UIKit에서의 MVC구조에서는 Model과 Controller가 너무 붙어있다.
        - 즉, View와 Controller가 강하게 연결되어 있어 거의 대부분의 일들을 이 둘이 담당
        - 그렇다고 이 둘을 떨어트리기에는, View의 Life-Cycle을 Controller를 관여하고 있어서 어렵다.

    - 그렇기 때문에, 프로젝트 규모가 커질수록 Controller가 비대해지고 내부구조는 복잡해져서 유지보수가 힘들어지는 상황이 온다.
    - <span style="color:yellow">이러한 MVC의 문제점을 해결하기 위해서 MVVC패턴과 같이 다양한 디자인 패턴들이 사용 된다.</span>


## 2. ViewController
- <span style="color:yellow">**UIView**</span> 란 화면의 직사각형 영역에 대한내용을 관리하는 개체
    - 즉, 화면을 구성하는 요소의 기본 클래스라고 생각하면 됨
    - 위치와 크기를 갖는 사각형으로, 배경색을 가지고있고 문자나 이미지와 같은 contents를 갖는것이 가능하다.
    - 따라서 UIView는 여러 UI 컴포넌트들을 보여주는데 사용된다.
    
- <span style="color:yellow">**ViewController**</span> 란 앱의 근간을 이루는 객체
    - 모든 앱은 적어도 하나의 ViewController를 가지고 있다.
    - 한마디로, 사용자가 화면을 보는것에 대한 관리기능을 제공함
- ViewController의 주요 역할
    - 데이터 변화에 따라서 view 컨텐츠를 업데이트
    - view들과 함께 사용자 상호작용에 반응
    - viewfmf re-sizing하고 전체적인 인터페이스의 레이아웃 관리
    - 다른 ViewController들과 앱을 구성함
- <span style="color:yellow">쉽게 말해서, 화면 하나를 관리하는 단위가 ViewController라고 이해 하면 된다.</span>
