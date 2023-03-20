
import UIKit
import RxSwift

/*:
 # take(while:)
 */
// 파라미터 while
  // - true 리턴: 해당 요소(next 이벤트) 방출
  // - false 리턴: 해당 요소를 방출하지 않고, completed 또는 error 이벤트 전달
// 파라미터 behavior
  // .exclusive:
    // - default
    // - 마지막의 값이 true일 경우 방출, 나머지 경우는 무시
  // .inclusive
    // - 마지막에 확인한 값이 조건을 충족시키지 않더라도 방출
    // - 자주 사용하진 않음

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Observable.from(numbers)
  .take(
    while: { value -> Bool in
      return !value.isMultiple(of: 2) //홀수이면 true, 짝수이면 false
    }
    , behavior: .exclusive // default
  )
  .subscribe { print($0) }
  .disposed(by: disposeBag)

Observable.from(numbers)
  .take(
    while: { value -> Bool in
      return !value.isMultiple(of: 2)
    }
    , behavior: .inclusive //마지막 값 조건 충족시키지 않더라도 이벤트 방출하고 종료
  )
  .subscribe { print($0) }
  .disposed(by: disposeBag)
