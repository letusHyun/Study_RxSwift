
import UIKit
import RxSwift

/*:
 # Observables
 */
// MARK: - Observable 생성 방법 2가지

// #1. create 
let o1 = Observable<Int>.create { (observer) -> Disposable in
  observer.on(.next(0))
  observer.onNext(1)
  
  observer.onCompleted()
  
  return Disposables.create()
}
o1.subscribe { print($0) }

// #2. from
  // - 배열을 전달해서 순차적으로 방출
Observable.from([0, 1])
