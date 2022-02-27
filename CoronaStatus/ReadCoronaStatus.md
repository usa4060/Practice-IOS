# CoronaStatus

## 기능 상세
- 시도별 확진자 수가 파이차트로 표현
- 도시 항목을 선택하면, 해당 도시 상세 현황을 알 수 있는 화면으로 이동

## 활용 기술
- 굿바이 코로나 19 API
- Alamofire
- Cocoapots
---
## 1. Alamofire
- swift 기반의 HTTP 네트워킹 라이브러리
- 연결 가능한 request, response 기능을 제공
- url json 형식의 incoding을 제공한다.
- Alamofire 이전에는 URLSession을 이용하여 네트워킹을 사용함
    - Alamofire를 사용하는 이유?
        1. 코드의 간소화
        2. 가독성의 증가
        3. 여러 기능을 직접 구현하지 않아도 라이브러리 형태로 제공함
        <br/><br/>
- Alamofire 사용법
    ### **1. Alamofire Request**
    - method 파라미터로 URL과 HTTPMethod 파라미터 등 요청에 필요한 정보를 쉽게 설정 가능
        - **HTTPMethod** : 대표적으로 .get, .post, .put, .delete가 정의 됨. 요청을 만들 때 request의 method 파라미터를 통해 전달 가능함 <br/>
        ex) <br/> 

            ```swift
            open func request<Parameter: Encodable>(
                _ convertible: URLConvertible,
                method: HTTPMethod = .get,
                parameters: Parameters? = nil,
                encoder: ParameterEncoder = URLEncoderFormParameterEncoder.defaulf,
                headers: HTTPHeaders? = nil,
                interceptor: RequestInterceptor? = nil) -> DataRequest
            ```
    ### **2. Alamofire Response**
    - Alamofire에서는 요청에 대한 응답을 Response method를 통해 핸들링한다.
    - 6개의 서로 다른 response method가 정의되어 있으며, 응답이 완료되면 complitionHandler가 호출 된다.
    - response method는 request method를 체이닝하여 사용한다.

        ```swift
        AF.request("연결 할 URL").responseJSON {
            response in 
            // action
        }
        ```
    