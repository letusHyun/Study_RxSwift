
import UIKit
import RxSwift

/*:
 # AsyncSubject
 */
// MARK: - Subject로 completed 이벤트가 전달될 때까지, 구독자에게 어떠한 이벤트도 전달하지 않는다.
// - completed 이벤트가 전달될 때, 그 시점에 가장 최근에 전달되었던 next 이벤트 하나를 구독자에게 전달한다.
// - 만약 next 이벤트로 전달된 이벤트가 없다면, 그냥 completed만 전달하고 종료
// - error 이벤트가 전달되면 next 이벤트를 전달하지 않는다.

let disposeBag = DisposeBag()

enum MyError: Error {
  case error
}

let subject = AsyncSubject<Int>()

subject
  .subscribe { print($0) }
  .disposed(by: disposeBag)

subject.onNext(1)
subject.onNext(2)
subject.onNext(3)

subject.onCompleted()
//subject.onError(MyError.error)
