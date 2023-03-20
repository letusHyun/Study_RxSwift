
import UIKit
import RxSwift

/*:
 # empty
 */

let disposeBag = DisposeBag()

//Observer가 아무런 동작없이 종료해야 할 때 사용
  // - completed 이벤트만 전달되고 종료
  // - Next 이벤트를 전달하지 않는다.
  // - 요소를 방출하지 않으므로, 요소의 형식은 중요하지 않다.
Observable<Void>.empty()
  .subscribe { print($0) }
  .disposed(by: disposeBag)
