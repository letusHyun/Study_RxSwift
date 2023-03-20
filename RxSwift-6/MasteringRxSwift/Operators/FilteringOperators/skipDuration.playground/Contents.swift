
import UIKit
import RxSwift

/*:
 # skip(duration:scheduler:)
 */

// Observable이 방출하는 이벤트를 duration만큼 무시
  // - 약간의 오차가 존재한다.

let disposeBag = DisposeBag()

let o = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)

o
  .take(10)
  .skip(.seconds(3), scheduler: MainScheduler.instance)
  .subscribe { print($0) }
  .disposed(by: disposeBag)
