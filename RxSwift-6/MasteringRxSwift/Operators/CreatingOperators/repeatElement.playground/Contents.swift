
import UIKit
import RxSwift

/*:
 # repeatElement
 */

let disposeBag = DisposeBag()
let element = "❤️"

//repeatElement: 이벤트를 무한정 방출
Observable.repeatElement(element)
  .take(7) //7번만 실행하고 completed
  .subscribe { print($0) }
  .disposed(by: disposeBag)
