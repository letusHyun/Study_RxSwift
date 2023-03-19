
import UIKit

import RxCocoa
import RxSwift

/*
 RxSwift에는 Relay가 3가지 있음
 - Subject와 유사하지만, 내부적으로 Subject를 wrapping하고 있음
 - Relay는 Subject와 달리, next 이벤트만 전달한다.
    - completed와 error이벤트는 전달 받지도, 하지도 않음
    - dispose되면, 비로소 이벤트를 종료함
 
 - 주로 UI 이벤트 처리할 때 사용함
 
 PublishRelay: PublishSubject를 Wrapping
 BehaviorRelay: BehaviorSubject를 Wrapping
 ReplayRelay: ReplaySubject를 Wrapping
 */


let disposeBag = DisposeBag()

// #1. PublishRelay
let pRelay = PublishRelay<Int>()
pRelay.subscribe { print("PublishRelay: \($0)") }
  .disposed(by: disposeBag)

//pRelay.onNext(1) // Relay는 onNext를 사용하지 않음, 사용 시 에러 발생
pRelay.accept(1)


// #2. BehaviorRelay
let bRelay = BehaviorRelay(value: 1)
bRelay.accept(2)

bRelay.subscribe { print("BehaviorRelay: \($0)") }
  .disposed(by: disposeBag)

bRelay.accept(3)

//read only
print(bRelay.value) // 저장되어있는 값을 바꾸고 싶다면, accept로 새로운 next 이벤트를 전달해야 함


// #3. ReplayRelay
let rRelay = ReplayRelay<Int>.create(bufferSize: 3)

(1...10).forEach { rRelay.accept($0) }

rRelay.subscribe { print("ReplayRelay: \($0)") }
  .disposed(by: disposeBag)
