
import UIKit
import RxSwift

/*:
 # take
 */
// 정수를 파라미터로 받아서 해당 숫자만큼만(count) 요소를 방출
// next 이벤트를 제외한 나머지 이벤트들에게는 영향을 주지 않는다.

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Observable.from(numbers)
  .take(5)
  .subscribe { print($0) }
  .disposed(by: disposeBag)
