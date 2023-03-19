
import UIKit
import RxSwift

/*:
 # Operators
 */

// MARK: - 연산자는 새로운 Observable을 리턴

let bag = DisposeBag()

Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9])
  .take(5) //앞에서 5개의 요소만 전달 : 1 2 3 4 5
  .filter { $0.isMultiple(of: 2) } //짝수 필터링 : 2 4
  .subscribe { print($0) }
  .disposed(by: bag)

print("-------------")

Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9])
  .filter { $0.isMultiple(of: 2) } //짝수 필터링 : 2 4 6 8
  .take(5) //앞에서 5개의 요소만 전달 : 2 4 6 8
  .subscribe { print($0) }
  .disposed(by: bag)
