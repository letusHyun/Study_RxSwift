
import UIKit
import RxSwift

/*:
 # from
 */
// 배열에 저장되어있는 요소들을 순차적으로 방출
//Observable 타입 반환
// 이벤트 모두 방출하면 completed

let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]

Observable.from(fruits)
  .subscribe { element in print(element) }
  .disposed(by: disposeBag)
