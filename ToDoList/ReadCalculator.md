# 계산기

## 기능 상세
- 계산기 키패드 UI 구성
- 계산기를 통해 사칙연산이 가능
- 연산을 누적해서 진행 가능
- AC버튼을 누르면 계산이 초기화됨
## 활용 기술
- UIStackView
- IBDesignables
- IBInspectables
---

## 1. UIStackView
_**UIStackView란 열 또는 행에 View들의 묶음을 배치할 수 있는 간소화된 인터페이스이다.**_
- 비슷한 기능 및 레이아웃을 가진 여러 View object들을 각자 제약을 걸어주면 때때로 오류가 발생할 수 있다.
- 그렇기 때문에, 기능과 Layout이 동일하다면 하나의 <span style="color:yellow">StackView</span>로 묶어서 한번에 제약을 걸거나 하는 등 동작을 해주는 것이 좋다.

- StackView의 Attridute에는 4가지의 속성이 있다.  
 ( = Axis / Alignment / Distribution / Spacing)

    ### 1. <span style="color:yellow">UIStackView Axis</span>
    - StackView의 방향을 결정한다 (가로 또는 세로)
        - Vertical StackView : Sub-View들이 세로로 쌓인다. 
        - Horizontal StackView : Sub-View들이 가로로 쌓인다.  
        <br/>
    
    ### 2. <span style="color:yellow">UIStackView Distribution</span>
    - StackView에 들어갈 Sub-View들의 사이즈를 어떻게 분배할지 정하는 속성
        - Fill : StackView의 방향에 맞게, 내부의 Sub-View들의 크기가 가득 차게 크기를 조정해준다. (horizon이면 가로로 가득차게, vertical이면 세로로 가득차게)
        - Fill Equalliy : StackView의 방향에 따라, 내부의 Sub-View들의 해당 방향 쪽 size을 동일하게 만들어서 StackView에 가득차게 조정해준다.
        - Fill Proportionally : StackView의 크기에 따라, Sub-View의 크기에 비례하게 증가 혹은 감소하여 StackView에 가득차게 조정한다.
        - Equal Spacing : StackView의 방향에 따라서, 내부 Sub-View들간의 간격을 동일하게 조정해준다.
        - Equal Centering : StackView의 방향에 따라서, Sub-Stack들의 center간의 간격을 동일시되도록 Sub-View들을 조정해준다.  
        <br/>
    ### 3. <span style="color:yellow">UIStackView Alignment</span>
    - StackView 내부의 Sub-View들을 어떻게 정렬할 지 결정해주는 속성이다.
        - Fill : StackView가 Horizontal일 경우 상-하를 늘려서 채워주고, Vertical일 경우 좌-우를 늘려서 채워준다.
        - Leading : Vertical StackView에서 Sub-View들을 StackView의 Leading으로 정렬해준다.
        - Trailing : Vertical StackView에서 Sub-View들을 StackView의 Trailing으로 정렬해준다.
        - Top : Horizontal StackView에서 Suv-View들을 StackView의 Top으로 정렬 해준다.
        - Bottom : Horizontal StackView에서 Suv-View들을 StackView의 Bottom으로 정렬 해준다.
        - First Baseline : Horizontal에서만 사용가능한 옵션으로, Sub-View들의 First Baseline에 맞춰서 정렬이 이뤄진다.
        - Last Baseline : Horizontal에서만 사용가능한 옵션으로, Sub-View들의 Last Baseline에 맞춰서 정렬이 이뤄진다.
        - Center : StackView의 종류에 따라 StackView의 Center에 맞춰서 Sub-View들을 정렬 해준다.
        <br/>
    ### 4. <span style="color:yellow">UIStackView Spacing</span>
    - StackView안에 들어가는 View들의 간격을 조정하는 속성
    <br/>
    <br/>
    <br/>
    <br/>
 ## 2 . IBInspectables & IBDesignables
  IBInstectables : 커스텀한 UIView 컴포넌트에서, Inspector창을 이용하여 보다 쉽게 속성을 적용할 수 있도록 해주는 것
  IBDesignables : 컴파일 타임으로 적용한 속성을 실시간으로 UI에 랜더링 해주는 녀석

 

---
## 개발하면서 생겼던 error & 알아야 할 기능

### 1. Aspect Ratio
- View에 제약조건을 추가할 때, 선택할 수 있는 항목 중 하나이다.
    - 해당 기능을 체크하면, View의 가로-세로 비율이 고정됨.
    - 비율 자체를 변경하려면 해당 View의 'show the size inspector'에 들어가서, Aspect Ratio의 값을 변경 해줘야 한다.

### 2. Vertical StackView의 Bottom Space Priority조정
- IOS의 UI는 기기의 해상도에 따라서 자동으로 변환을 하게 된다.
- 이때, StoryBoard상에서 Virticle StackView를 통해 UI를 구성하면, 기기의 해상도 차이에 따라 Virtical StackView가 망가지는 현상이 발생할 수 있다.
- 그렇기 때문에, 해당 Virtical StackView의 Bottom Space Priority를 낮춰줘서 StackView의 상하 조정이 자유로워지도록 해준다.