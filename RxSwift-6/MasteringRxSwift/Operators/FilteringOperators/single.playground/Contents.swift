
import UIKit
import RxSwift

/*:
 # single
 */

// 원본 Observable에서 첫 번째 요소만 방출하거나 조건과 일치하는 첫 번째 요소만 방출
// - 하나의 요소가 방출되는 것을 보장
// 두 개 이상의 요소가 방출되면, 첫 번째 요소만 방출하고 error 발생
// single 연산자가 return 하는 Observable은 원본 Observable에서 completed 이벤트를 전달할 때 까지 대기함
  // - completed 이벤트가 전달되는 시점에 하나의 요소만 방출된 상태라면, 구독자에게 completed 이벤트 전달
  // - 하나의 요소가 방출된 상태가 아니라면, 구독자에게 error 이벤트 전달

// 2가지 형태 존재
// 1. 파라미터가 없는 연산자

// 2. predicate 받는 연산자
  // - 클로저에 조건을 명시할 수 있음

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 1.
Observable.just(1)
  .single()
  .subscribe{ print($0) }
  .disposed(by: disposeBag)

Observable.from(numbers) //첫 번째 요소만 방출하고 error 발생
  .single()
  .subscribe{ print($0) }
  .disposed(by: disposeBag)

// 2.
Observable.from(numbers)
  .single({ value -> Bool in
    return value == 3
  })
  .subscribe { print($0) }
  .disposed(by: disposeBag)


let subject = PublishSubject<Int>()

subject
  .single()
  .subscribe { print($0) }
  .disposed(by: disposeBag)

subject.onNext(100)
subject.onCompleted()
