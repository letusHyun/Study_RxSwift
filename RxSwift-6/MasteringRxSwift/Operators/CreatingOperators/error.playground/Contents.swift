
import UIKit
import RxSwift
/*:
 # error
 */
//error 이벤트를 전달하고 종료
  // - 파라미터로 Error 타입을 받는다.
  // - Next 이벤트를 전달하지 않는다.

let disposeBag = DisposeBag()

enum MyError: Error {
  case error
}

Observable<Void>.error(MyError.error)
  .subscribe { print($0) }
  .disposed(by: disposeBag)
