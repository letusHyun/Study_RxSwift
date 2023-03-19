
import UIKit
import RxSwift

/*:
 # just
 */


let disposeBag = DisposeBag()
let element = "😀"

//just는 파라미터로 전달한 요소를 그대로 방출함
//Observable 타입 반환
//이벤트 방출시키고 completed

Observable.just(element)
  .subscribe { event in
    print(event)
  }
  .disposed(by: disposeBag)

Observable.just([1, 2, 3])
  .subscribe { event in print(event) }
  .disposed(by: disposeBag)
