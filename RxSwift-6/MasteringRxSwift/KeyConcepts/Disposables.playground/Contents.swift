
import UIKit
import RxSwift
/*:
 # Disposables
 */
//Observable이 completed나 error 이벤트로 끝나면, 리소스 정리를 따로 안해줘도 되긴 함.
// - 하지만 공식 문서에서는 직접 리소스 정리를 해주는 것을 권하고 있음.

let subscription1 = Observable.from([1, 2, 3])
  .subscribe(onNext: { elem in
    print("Next", elem)
  }, onError: { error in
    print("Error", error)
  }, onCompleted: {
    print("Completed")
  }, onDisposed: { //리소스가 해제되는 시점에 로직을 구현하고 싶으면, 이렇게 구현해야 함.
    //Disposed는 Observable이 전달하는 이벤트가 아니다.
    //파라미터로 클로저를 전달하면 Observable과 관련된 모든 리소스가 제거된 후에 호출됨
    print("Disposed")
  })
subscription1.dispose() // #1. dispose를 이용해 직접 리소스 해제하는 방법
print("------------------")

var disposeBag = DisposeBag()
Observable.from([4, 5, 6])
  .subscribe { print($0) }
  .disposed(by: disposeBag) // #2. 공식 문서에서 권하는 방법

//disposed 메소드에 bag을 넣으면, subscribe가 리턴하는 disposable이 bag에 추가됨.
//disposeBag에 추가된 disposable은 disposeBag이 해제되는 시점에 함께 해제된다.
//리소스를 할당할 때에는 이렇게 disposeBag를 사용하는 것이 좋다.
//리소스를 강제로 원하는 시점에 해제시키고 싶다면,
  // 1. bag = DisposeBag()을 새로 만들면 됨
  // 2. 변수를 옵셔널로 만들고 nil을 할당

//1초마다 이벤트를 방출 (무한정)
let subscription2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
  .subscribe(onNext: { elem in
    print("Next", elem)
  }, onError: { error in
    print("Error", error)
  }, onCompleted: {
    print("Completed")
  }, onDisposed: {
    print("Disposed")
  })

/* dispose를 직접 실행시켜 메모리 해제하는 방법 */
DispatchQueue.main.asyncAfter(deadline: .now() + 3) { //3초 뒤에 실행
  subscription2.dispose() //해제
}
//문제점: completed가 호출되지 않으므로, 이런 코드는 피해야 함

//만약 특정 시점에 취소해야한다면 dispose를 직접 호출하지말고, take until을 이용하자

