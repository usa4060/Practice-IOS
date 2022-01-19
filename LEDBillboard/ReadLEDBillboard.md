# LED 전광판

## 기능 상세
- LED 전광판 화면 표시
- LED 전광판에 표시할 텍스트, 텍스트컬러, 배경 색상을 설정화면에서 선택할 수 있다.
## 활용 기술
- UINavigationController
- 화면 전환 개념
- ViewController Life Cycle
- 화면간 데이터 전달 하는 방법
- 에셋 카탈로그 

---
## 1. UINavigationController
- Content View Controller
    - 화면을 구성하는 view를 직접 구현하고, 관련 이벤트들을 처리하는 View Controller
    - 일반적으로 StoryBoard를 생성하면 기본적으로 만들어지는 View Controller이다. 
- Container View Controller
    - 하나 이상의 Child-View Controller를 가지고 있다.
    - 하나 이상의 Child-View Controller를 관리하고 레이아웃과 화면 전환을 담당한다.
    - 화면 구성과, 이벤트 관리는 Child-View Controller에서 담당한다.    
    - Container View Controller에는 대표적으로 <span style="color:yellow">Navigation Controller</span>와 TabBar Controller가 있다.
    
    _**쉽게 말해서, 여러개의 View Controller들을 한번에 다뤄주는 Controller라고 생각**_
    

 - <span style="color:yellow">Navigation Controller</span>
   - 
    - 계층구조로 이루어진 content들을 순차적으로 보여주는 Container View Controller이다.
        - ex) 어떤 앱의 메뉴 -> 설정 -> 음량 으로 이동하는 것과 같이, 계층 관계를 다루는 것!!
    - 이러한 계층구조를 관리하기 위해, <span style="color:yellow">Navigation Stack 이라는 정렬된 배열</span>을 사용하여, Child View Controller들을 관리한다.
    - Navigation Stack은 기본적으로 Stack자료구조의 형태인 FILO의 구조를 따른다.
        - PUSH : 특정 View에서 또다른 View로 들어가게 되면, 이동한 View의 View Controller가 Navigation Stack최상단에 쌓이게 되는데 이를 "PUSH 했다" 라고 한다.
        - POP : 사용자가 Back 버튼이나 Left-Edge Swipe Gesture를 사용해서 Navigation Stack 최상단에 있는 View Controller를 제거할 수 있는데, 이를 "POP 했다" 라고 한다.
 - Navigation Bar
    - Navigation Controller를 구현할 시, 화면 상단에 항상 보여지는 Bar이다.
    - Root-View Controller를 제외한 모든 View Controller의 Navigation Bar에는 BACK버튼이 존재한다.
    <br><br><br><br>

## 2. 화면 전환
- IOS에서 화면을 전환하는 방식은 크게 2가지가 있다.
    1. 소스코드를 통해 전환하는 방식
    2. StoryBoard를 통해 전환하는 방식
- 전환하는 기술로 구분을 하면 4가지의 방식이 있다.
    
    - View Controller의 View위에 다른 View를 가져와서 바꿔치기
        - _이 방식은 메모리 누수의 위험이 있으므로 권장하지 않는다_
    
    - View Controller에서 다른 View Controller를 호출하여 전환하기
    
    - Navigation Controller를 사용하여 화면 전환하기
    
    - 화면 전환용 객체 세그웨이(Segueway)를 사용하여 화면 전환하기
    <br><br>

    ### **1. View Controller에서 다른 View Controller를 호출하여 전환하기**
    - 직접 호출한다는 의미에서 "presentation 방식" 이라고도 불린다
    
        **Declaration**
        -
        ```swift
        func present(_ viewControllerToPresent : UIViewController,
        animated flag: Bool,
        completion: (()->void)? -> nil)
        ```
        **Parameters**
        - 
        - viewControllerToPresent
            - 새롭게 이동할 화면의 View Controller 인스턴스를 넣어준다.
        - flag
            - 화면 전환시, 애니메이션 효과를 줄 것인지에 대한 Boolean값을 넣어준다.
        - completion
            - 화면 전환이 완료되는 시점에서, completion 클로저가 호출이 된다. 
                - 화면 전환은 비동기로 처리되기 때문에, 화면전환이 완료 된 이후에 코드로 처리해야 할 logic이 있다면 이 클로저 내부에 정의 해준다.
    <br><br><br>

        **Declaration**
        -
        ```swift
        func dismiss(animated : flag = Bool, 
        completion: (()->void)? -> nil))
        ```

        **Parameters**
        -
        _이 함수는 이전 View로 돌아가는 기능이기 때문에, 따로 ViewController의 인스턴스를 인자로 받을 필요가 없다._

        - flag
            - 화면 전환시, 애니메이션 효과를 줄 것인지에 대한 Boolean값을 넣어준다.
        - completion 
            - 이전 화면으로 돌아가는것이 완료되면 completion에 정의된 클로저가 호출되어 logic을 수행한다
        <br><br><br><br>
    ### **2. Navigation Controller를 사용하여 화면 전환하기**
    _Navigation Controller는  View Controller의 전환을 직접 Controll하고, App의 Navigation정보를 표시하는 역할을 함과 동시에, Navigation Stack으로 Child View Controller를 관리한다._

    **Declaration**
    -
    ```swift
    func pushViewController(_ viewController : UIViewController, 
                    animated: Bool)
    ```

    **Parameters**
    -
    - viewController
        - 새로운 화면으로 이동 할 ViewController의 인스턴스를 넣어준다
    - animated
        - 화면전환이 될 때 애니메이션을 사용 할 것인지 아닌지를 Boolean값으로넘겨 줌  
    <br><br><br>

    **Declaration**
    -
    ```swift
    func popViewController(animated: Bool) -> UIViewController?
    ```

    **Parameters**
    -
    - animated
        - 이전 화면으로 넘어갈 때 애니메이션을 사용 할 것인지 아닌지를Boolean값으로 넘겨 줌
    <br><br><br><br>
    ### **3. 화면 전환용 객체 세그웨이(Segueway)를 사용하여 화면 전환하기**
    _SegueWay는 두개의 ViewController사이에 연결된 화면 객체를 의미한다_
    - StoryBoard를 통해, 출발지와 목적지를 직접 지정하는 방식을 "세그웨이를 이용한 화면전환" 이라고 한다.
    - 세그웨이를 이용하면, 따로 코드작성 없이 StoryBoard 만으로도 화면전환이 가능하다.
    - SegueWay에는 2가지의 종류가 있다.
            <br><br>
        ### 1. Action Segueway
        - 출발지가 버튼, 셀 등인 경우를 Action Segueway(Trigger Segueway)라고 
        한다.
        - Action Segueway의 종류
            1. Show
                - 가장 일반적인 세그웨이로, Navigation Controller를 사용하면 화면전환시 ViewController가 Navigation Stack에 쌓이게 된다.
            2. Show Detail
                - Split View에서 사용하는 세그웨이다.
            3. Present Modally
                - 이전 ViewController를 덮으면서, 새로운 화면이 나타나게 된다.
                - 즉, presentation 방식으로 화면이 전환된다고 보면 된다
            4. Present As Popover 
                - IPhone에서는 사용되지않고 IPad에서 사용되는데, 팝업창을 띄울 때 사용된다.
            5. Custom
                - Segueway를 사용자가 원하는대로 커스텀하여 사용
            <br><br>
        ### 2. Manual Segueway 
        - 출발지가 ViewController자체인 경우를 Manual Segueway라고 한다.
        <br/><br/><br/><br/>
    
    ## 3. ViewController Life Cycle
    _**UIViewController의 객체에는 View객체를 관리하는 매서드들이 내장되어 있다.**_
    - 이 매서드들은 각자 자신들이 필요한 타이밍에 IOS 시스템에 의해 자동으로 호출된다.
    - 따라서 UIViewController의 Child Class를 생성하고 <span style="color:yellow">해당 매서드들을 override하여
    Life Cycle 상황에 맞게 적절한 Logic을 추가</span> 하는것이 가능하다!
    - 이러한 Life-Cycle의 상태는 4가지로 구분된다.
        1. Appearing : 뷰가 화면에 나타나는 중
        2. Appeard : 뷰가 화면에 나타나는게 완료 된 상황
        3. Disappearing : 뷰가 화면에서 사라지는 중
        4. Disappeard : 뷰가 화면에서 사라진 상태
    
    _**그렇다면 Life-Cycle에 따라 자동으로 호출되는 메서드는 어떤 것 들이 있을까?**_

    1. <span style="color:yellow">ViewDidLoad()</span>
        - ViewController의 모든 View들이 메모리에 Load되었을 때 실행
        - 그렇기 때문에, 메모리에 처음 로드될 때 딱 한번만 실행 됨
            - _**보통 Life-Cycle 내에서 딱 한번만 호출 할 행위들을 이 메소드안에 정의한다.**_  
            ex) View와 관련된 초기화 작업, 네트워크 호출 과 같은 일회성 작업들
    2. <span style="color:yellow">ViewWillAppear()</span>
        - View가 계증에 추가되고, 실제 스크린에 보이기 직전마다 호출된다.
        - 마찬가지로 다른View에서 돌아올 때도 호출이 된다.
        - View와 관련된 초기화 작업을 이 매서드 안에 정의함
    3. <span style="color:yellow">ViewDidAppear()</span>
        - ViewController의 View가 계층에 추가가 된 후 호출된다.
        - 보통, View를 나타낼 때 필요한 추가 작업이나 애니메이션을 시작하는 작업을 이 매서드에 정의함
    4. <span style="color:yellow">ViewWillDisappear()</span>
        - ViewController의 View가 계층에서 사라지기 직전에 호출된다.
        - 보통, View가 작업한 내용을 되돌리거나 최종적으로 데이터를 처리하는 작업을 이 매서드에 정의함
    5. <span style="color:yellow">ViewDidDisappear()</span>
        - ViewController의 View가 계층에서 사라지고 난 후에 호출된다.
        - View가 사라지는 것과 관련된 작업을 한다.
    <br/><br/><br/><br/>

    ## 4. 화면간 데이터 전달하기

    - 화면간 데이터를 전달 할 때에는, ViewController의 타입을 다운캐스팅 해주어 Child ViewController의 프로퍼티에 접근을 한다.

        ```swift
        @IBAction func tapCodePushBtn(_ sender: UIButton) {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController
            else {return}
            // 이렇게 intrantiateViewController라는 함수가 StoryBoard에서 ViewController에 정의해 준 id로, 해당하는 ViewController를 찾아서 인스턴스화 해준다!!
        
            // 또한, viewController 변수를 CodePushViewController로 다운캐스팅 해줘서 CodePushViewController의 프로퍼티인 name에 접근할 수 있게 해준다.
 
            viewController.name = "Yongin"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        ```
    <br/><be/>
    - 전환된 화면에서, 이전의 화면으로 Data를 넘길때에는 주로 <span style="color:yellow">_delegate_</span>라는 패턴을 사용한다.
        - delegate = 위임자 라고 생각하면 된다.
        - 즉 delegate패턴이란, _**일을 갖고있는 객체가 다른 객체에게 자신의 일을 위임하는 패턴이다.**_
        - delegate 패턴을 사용할 때, delegate변수는 반드시 _**weak**_ 로 선언해야 한다.
            - 그렇지 않으면 메모리 누수 발생
                ```swift
                protocol SendDataDelegate: AnyObject {
                    func SendData(name:String)
                }
                
                // ..... viewcontroller class 내부 ....... //
                weak var delegate : SendDataDelegate?
                ```
    - segueway로 화면 전환을 할때, data를 넘겨주기 가장 좋은 위치는 <span style="color:yellow">_**prepare**메서드_</span> 이다.
        - 이 prepare라는 메서드는 override되면, segueway가 실행되기 직전에 시스템에 의해서 자동으로 호출된다.
        ```swift
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? SeguePushViewController{
                // 이 'segue.deftination'프로퍼티를 통해 전환하려는 ViewController의 인스턴스를 가져올 수 있다.
                viewController.name = "yongin"
            }
        }
        ```
---
## 개발하면서 생겼던 error & 알아야 할 기능

### 1. NavigationController를 이용하여 이전화면으로 돌아가는 방법
<br/>

```swift
@IBAction func tapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
```
- 이와같이, ViewController클래스 내부에서 navigationController를 통해 popViewController를 호출하면 Back 버튼을 사용하지 않고 이전 화면으로 돌아갈 수 있다.
    <br>
_(화면에 보이는 <span style>하나의 뷰는 1개의 ViewController를 가지고 있고, NavigationController는 여기에 종속되어 있다는 것을 명심할것)_

    <br/><br/><br/>
### 2. Code를 이용해서 화면전환을 할 때, ViewController를 인스턴스화 해주는 방법
<br/>

```swift
@IBAction func tapCodePushBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController")
        else {return}
        // 이렇게 'intrantiateViewController'라는 함수가, 
        // StoryBoard에서 ViewController에 정의해준 id(identifier)에 
        // 해당하는 ViewController를 찾아서 인스턴스화 해준다!!

        // 또한, 옵셔널 바인딩을 하므로 안전하게 guard문으로 감싸준다.
         self.navigationController?.pushViewController(viewController, animated: true)
    }
``` 


<br/><br/><br/>
### 3. Code를 이용해서 Presentation을 통해 화면 전환을 하는 방법
<br/>

```swift
@IBAction func tapCodePushBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController")
        else {return}
        // 이렇게 'intrantiateViewController'라는 함수가, 
        // StoryBoard에서 ViewController에 정의해준 id(identifier)에 
        // 해당하는 ViewController를 찾아서 인스턴스화 해준다!!

        // 또한, 옵셔널 바인딩을 하므로 안전하게 guard문으로 감싸준다.
        self.present(viewController, animated: true, completion: nil)
        // 이렇게 present를 하게 되면 전환된 View는 FullScreen이 아닌 Modal로 보여진다.

        //그럴 땐, 
        // viewController.modalPresentationStyle = .fullScreen
        // 를 사용하게 되면, FullScreen으로 덮여진다.

    }
``` 


<br/><br/><br/>
### 3. Left-Edge Swipe Gesture는 언제나 사용 가능하다???
<br/>

* Left-Edge Swipe Gesture로 이전 화면으로 돌아가는 것은, NavigationViewController를 이용해서 화면을 Push했을 때만 사용이 가능하다.
    - _**presentation 방식으로 화면이 전환 된 경우에는 불가능하다!(따로 구현을 해줘야 함)**_

<br/><br/><br/>

### 4. 삼항 연산자

- 변수 선언 + if ~ else 구문 2가지를 한 줄로 쓸 수 있는 간편한 방법
- example
    ```swift
    self.y_btn.alpha = color == UIColor.yellow ? 1 : 0.2
    self.p_btn.alpha = color == UIColor.purple ? 1 : 0.2
    self.g_btn.alpha = color == UIColor.green ? 1 : 0.2

    // color 가 UIColor.XXX기 맞다면 self.X_btn.alpha는 1이고, 아니면 0,2 라는 의미이다.
    ```

<br/><br/><br/>

### 5. delegate란 무엇일까?
_**내가 개인적으로 고민하고 나온 답을 서술하겠음.**_
- 우선 delegate는 프로토콜로 선언한다
    - 그 이유는, 프로토콜은 내가 사용하고자 하는 기능들의 청사진이므로 실제로 동작하는 구현부는 따로 만들어야하기 때문이다.
- A와 B라는 ViewController가 있다고 가정하자
    - A에서 XX_delegate를 protocol로 선언한다.
        - 이때, protocol내부에는 매서드의 원형과 해당 매서드가 필요로하는 매개변수에 대한 정보만 있다.
    - A에서 XX_delegate타입의 변수를 선언한다.
    - A에서 B화면으로 돌아갈 때 (ex dismiss / popnavigation) XX_delegate가 필요로 하는 매개변수에 data들을 넣어서 
    self.delegate?._메서드_ 를 호출한다. (delegate에 선언된 메서드가 매개변수가 없을 수 있음).  
        <center><span style="color:red">_**중요**_</span></center> 
        -
        - 여기서 메서드를 호출 한다는 의미는, 실제 해당 메서드가 실행이 된다는 의미이다!!
        - 하지만 A에서는 프로토콜이 선언만 되어있을 뿐, 실제 해당 매서드의 구현부는 없음!!
        - 매서드의 구현부는 B ViewController에 구현이 되어있어야 한다!!!!
    - 따라서, B ViewController에서는 해당 프로토콜을 채택 해주어야 한다.
    - 그 후, 프로토콜에 있는 매서드의 실제 구현부를 작성한다.
    - 그리고, delegate의 일을 위임받아서 수행해야 하는 위치에서  
        ```swift
        viewcontroller.delegate? = self
        ````  
        를 선언 해준다.
    - 그렇게 되면, A ViewController에서 delegate의 메서드가 실행이 되면 B ViewController에서 실제 수행을 하게 된다.
    - 이러한 원리로, A에서 데이터만을 넘겨주고 실제 데이터에 대한 처리는 B에서 해주는 이러한 방식이 가능하게 된다!!!

    -----
    
