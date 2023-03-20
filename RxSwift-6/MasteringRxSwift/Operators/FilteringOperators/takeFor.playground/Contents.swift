
import UIKit
import RxSwift

/*:
 # take(for:scheduler:)
 */
// for : 해당 시간만큼 이벤트를 전달하고, 시간이 경과하면 종료
// 오차 있음 주의
let disposeBag = DisposeBag()

let o = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)

o
  .take(for: .seconds(3), scheduler: MainScheduler.instance)
  .subscribe { print($0) }
  .disposed(by: disposeBag)
