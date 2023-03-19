
import UIKit
import RxSwift

/*:
 # deferred
 */

let disposeBag = DisposeBag()
let animals = ["🐶", "🐱", "🐹", "🐰", "🦊", "🐻", "🐯"]
let fruits = ["🍎", "🍐", "🍋", "🍇", "🍈", "🍓", "🍑"]
var flag = true

//deferred: 특정 조건에서 Observable 생성
//Observable을 리턴하는 클로저를 파라미터로 받는다.
let factory: Observable<String> = Observable.deferred {
  flag.toggle()
  
  if flag {
    return Observable.from(animals)
  } else {
    return Observable.from(fruits)
  }
}

factory
  .subscribe { print($0) }
  .disposed(by: disposeBag)

factory
  .subscribe { print($0) }
  .disposed(by: disposeBag)
