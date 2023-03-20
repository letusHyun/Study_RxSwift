
import UIKit
import RxSwift

/*:
 # skip
 */
// 해당 숫자만큼 방출되는 요소를 무시하고, 이후에 방출되는 요소가 포함된 새로운 Observable을 리턴
// index 아니고, count임을 주의해야 함.
let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Observable.from(numbers)
  .skip(3) // [4,5,6,7,8,9,10]
  .subscribe { print($0) }
  .disposed(by: disposeBag)
