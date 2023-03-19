
import UIKit
import RxSwift

/*:
 # BehaviorSubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
  case error
}

let p = PublishSubject<Int>()
p.subscribe {
  print("PublishSubject >>", $0)
}
.disposed(by: disposeBag)

let b = BehaviorSubject<Int>(value: 0)
b.subscribe {
  print("BehaviorSubject1 >>", $0)
}
.disposed(by: disposeBag)

b.onNext(1)

b.subscribe {
  print("BehaviorSubject2 >>", $0)
}
.disposed(by: disposeBag)

//b.onError(MyError.error)
b.onCompleted() //모든 구독자에게 completed가 전달됨

b.subscribe { //completed 방출했는데 다른 구독자가 구독하면, completed 방출함
  print("BehaviorSubject3 >>", $0)
}
.disposed(by: disposeBag)
