
import UIKit
import RxSwift

/*:
 # ignoreElements
 */
//ignoreElements의 반환 타입은 Observable<Never>
  // - Observable<Never>은 completed 또는 error 이벤트만 전달한다.
    // - next 이벤트는 무시
//Observable이 방출하는 Next 이벤트를 필터링하고, completed 이벤트와 error 이벤트만 구독자에게 전달

let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]

Observable.from(fruits)
  .ignoreElements()
  .subscribe { print($0) }
  .disposed(by: disposeBag)
