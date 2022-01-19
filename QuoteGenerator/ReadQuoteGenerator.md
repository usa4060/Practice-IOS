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
## **사용 기술 관련**
### 1. UIKit
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


### 2. ViewController
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

### 3. AutoLayout
 - 두 view사이의 관계에 제약(Constrain)을 이용하 View의크기와 위치를 지정하는 것
 - AutoLayout은 아이폰의 다양한 해상도비율에 대응하기 위해 나온 개념
    - IPhone이 다양해지면서 기기에 맞는 해상도도 다양해졌는데, 모든 기기에 맞는 해상도를 대응하기위해 나온 개념이다!!!
- IOS개발에서 AutoLayout을 이용한 화면 구성은 <span style="color:yellow">StoryBoard</span> 에서 진행하게 된다.
    - StoryBoard는 사용자의 인터페이스(UI)를 시각적으로 표현하여 Contents화면간의 연결을 보여주는 도구
    - <span style="color:yellow">StoryBoard</span>는 Scene으로 구성되며, 각 Scene은 View & ViewController를 나타낸다.
        1. Add New Constraint
            - View간의 제약 조건을 설정할 수 있는 메뉴
            - Top / Trailing(right) / Bottom / Leading(left) / 너비&높이 를 설정가능
        2. Align
            - View간의 정렬을 설정 가능하다.
        3. Resolve Auto Layout Issues
            - AutoLayout관련 이슈들을 해결하는 옵션 제공
            - 현재의 제약조건을 기준으로 View를 Update하거나, 제약을 업데이트 가능
            - 딱히 이 메뉴는 많이 사용하지 않는다.

### 4. IBOulet & IBAction
- StoryBoard뿐 아니라 Code에서 UI를 접근 가능하게 해준다.

    1. <span style="color:yellow">IBOulet</span> : StoryBoard에 등록된 UI오브젝트에 접근하여 control 하기 위해, 변수에 Binding한 UI-Object변수를 의미한다.
        - 쉽게 말해서 UI를 Code로 다루기 위해 사용하는 변수!!
    1. <span style="color:yellow">IBAction</span> : 동작을 정의하는 함수로, 어떠한 동작을 할 것인지를 정하고 그것을 연결시켜주는 역할을 한다
- IBOulet은 변수이고 / IBAction은 함수이다!!


---
## 개발하면서 생겼던 error & 알아야 할 기능

### 1. **Content Priority Ambiguity (Error)**
- UI Framework에서 제공하는 일뷰 View에는 Content의 고유 사이즈가 있다. 
    - ex) UI Label & UI Button과 같이 View의 속성, Text, Image에 따라 크기가 변동되고 결정되는 View가 있다. 
    - 이러한 View들은 다른 View들간 걸려있는 제약에 의해서 본래의 Content의 고유사이즈보다 늘어나거나 줄어들거나 하게 된다.
- size가 더 늘어나는것에 대한 제약을 : Content Hugging (priority가 낮은게 더 늘어남)
- size가 더 줄어드는것에 대한 제약을 : Content Compression Resistance (priority가 낮은게 더 압축(compression)됨)
- 이러한 제약들에도 Priority가 있어서, Priority 따라 Content의 크기가 고유 사이즈보다 늘어나게 되었을 때, size를 늘릴건지 줄일건지를 결정 하게됨
    - Priority값은 0 ~ 1000사이의 값을 가진다.