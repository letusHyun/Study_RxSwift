
import UIKit
import RxSwift

/*:
 # skip(until:)
 */
//Observable 타입을 파라미터로 받는다.
  // - 파라미터로 전달하는 Observable을 trigger라고 한다.
//trigger의 next 이벤트를 전달하기 전까지 원본 Observable이 전달하는 이벤트를 무시
//trigger가 요소를 방출한 이후부터 원본 Observable에서 방출되는 요소들을 구독자로 전달
let disposeBag = DisposeBag()

let subject = PublishSubject<Int>()
let trigger = PublishSubject<Int>()

subject
  .skip(until: trigger)
  .subscribe { print($0) }
  .disposed(by: disposeBag)

subject.onNext(1) // 무시
trigger.onNext(0) // trigger 작동
subject.onNext(2) // 이벤트 방출
