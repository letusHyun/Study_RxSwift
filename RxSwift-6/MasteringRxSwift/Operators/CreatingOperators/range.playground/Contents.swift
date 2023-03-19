
import UIKit
import RxSwift

/*:
 # range
 */

let disposeBag = DisposeBag()

//start 값으로부터 count만큼 1씩 증가하는 10개의 정수를 방출
//증가되는 크기 바꾸거나, 감소하는 값으로 바꾸는 것은 불가능
//방출 완료 시, completed
Observable.range(start: 1, count: 10)
  .subscribe { print($0) }
  .disposed(by: disposeBag)



