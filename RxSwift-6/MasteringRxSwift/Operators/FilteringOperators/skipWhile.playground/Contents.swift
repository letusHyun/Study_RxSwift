
import UIKit
import RxSwift

//클로저를 파라미터로 받는다.
  // - 클로저에서 true를 리턴하는 동안 방출되는 요소를 무시
  // - 클로저에서 false를 리턴하면 그때부터 조건에 관계없이 모든 요소를 방출
  // - 연산자는 방출되는 요소를 포함한 Observable을 리턴

let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Observable.from(numbers)
  .skip(while: { value -> Bool in
    return !value.isMultiple(of: 2) //홀수이면 true, 짝수이면 false
  })
  .subscribe { print($0) }
  .disposed(by: disposeBag)
