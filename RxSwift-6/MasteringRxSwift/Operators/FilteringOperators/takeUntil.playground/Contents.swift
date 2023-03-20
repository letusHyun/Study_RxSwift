
import UIKit
import RxSwift

/*:
 # take(until:)
 */
// 2가지 버전 존재


// 1. 파라미터로 받는 Observable타입
// 파라미터로 전달한 Observable에서 next 이벤트를 전달하기 전까지, 원본 Observable에서 next 이벤트를 전달

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let subject1 = PublishSubject<Int>()
let subject2 = PublishSubject<Int>()
let trigger = PublishSubject<Int>()

subject1
  .take(until: trigger)
  .subscribe { print($0) }
  .disposed(by: disposeBag)

subject1.onNext(1) //요소 방출
subject1.onNext(2) //요소 방출

trigger.onNext(3) //completed

subject1.onNext(2) //요소 방출 x
print("------------------------")


// 2. 파라미터로 받는 클로저, behavior

// 파라미터 behavior
  // .exclusive:
    // - default
    // - false일 경우, next 이벤트 방출
    // - true일 경우, next 이벤트 방출하지 않고 completed
  // .inclusive
    // - 마지막에 확인한 값이 조건을 충족시키지 않더라도 방출
    // - 자주 사용하진 않음

subject2
  .take(
    until: { value -> Bool in
      return value > 5 // 조건
    }
    , behavior: .exclusive) // default
  .subscribe { print($0) }
  .disposed(by: disposeBag)

subject2.onNext(1) // false이므로 next 이벤트 방출
subject2.onNext(2) // false이므로 next 이벤트 방출
subject2.onNext(3) // false이므로 next 이벤트 방출

subject2.onNext(6) // true이므로 next 이벤트 방출하지 않고 completed

subject2.onNext(2) //이벤트 방출 x
