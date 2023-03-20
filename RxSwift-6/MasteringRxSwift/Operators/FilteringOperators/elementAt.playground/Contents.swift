
import UIKit
import RxSwift

//정수 인자를 파라미터로 받아서 Observable을 반환
  // - 해당 index의 요소를 방출하고 completed 이벤트를 전달함
  // - 나머지 요소들은 무시됨

let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]

Observable.from(fruits)
  .element(at: 1)
  .subscribe { print($0) }
  .disposed(by: disposeBag)
