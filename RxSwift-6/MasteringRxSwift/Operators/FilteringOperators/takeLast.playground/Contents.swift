
import UIKit
import RxSwift

/*:
 # takeLast
 */
// 정수를 파라미터로 받아서 Observable을 리턴
// 리턴되는 Observable은 원본 Observable이 방출하는 요소 중에서 마지막에 방출된 n개의 요소가 포함되어 있음
// 구독자로 전달되는 시점이 delay됨

enum MyError: Error {
  case error
}

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let subject = PublishSubject<Int>()
subject.takeLast(2)
  .subscribe { print($0) }
  .disposed(by: disposeBag)

numbers.forEach { subject.onNext($0) } // buffer: 9 10

subject.onNext(11) // buffer: 10 11

subject.onCompleted() // buffer에 있는 이벤트를 모두 방출하고 completed 전달

subject.onError(MyError.error) // buffer에 있는 이벤트를 전달하지 않고, error 이벤트만 전달
