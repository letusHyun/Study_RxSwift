
import UIKit
import RxSwift

/*:
 # generate
 */

let disposeBag = DisposeBag()
let red = "🔴"
let blue = "🔵"


//initialState: 시작값
//condition:
// - true: 요소 전달
// - false: completed 이벤트 전달하고 즉시 종료
//iterate: 값을 바꾸는 코드 전달(ex: 값 증가, 값 감소)

//range와 달리, 파라미터 값을 정수로 제한하지 않는다.
Observable.generate(
  initialState: 0,
  condition: { $0 <= 10 },
  iterate: { $0 + 2 }
)
.subscribe { print($0) }
.disposed(by: disposeBag)

Observable.generate(
  initialState: 10,
  condition: { $0 >= 0 },
  iterate: { $0 - 1 }
)
.subscribe { print($0) }
.disposed(by: disposeBag)

Observable.generate(
  initialState: red,
  condition: { $0.count < 15 },
  iterate: { $0.count.isMultiple(of: 2) ? $0 + red : $0 + blue }
)
.subscribe { print($0) }
.disposed(by: disposeBag)
