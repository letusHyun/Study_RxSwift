
import UIKit
import RxSwift

/*:
 # of
 */

let disposeBag = DisposeBag()
let apple = "🍏"
let orange = "🍊"
let kiwi = "🥝"

//이벤트를 묶어서 방출할 때, 하나씩 방출시킴
//Observable 타입 반환
//이벤트 방출시키고 completed
Observable.of(apple, orange, kiwi)
  .subscribe { element in print(element) }
  .disposed(by: disposeBag)

Observable.of([1, 2], [3, 4], [5, 6])
  .subscribe { element in print(element) }
  .disposed(by: disposeBag)
