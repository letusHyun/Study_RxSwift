
import UIKit
import RxSwift

/*:
 # ReplaySubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
  case error
}

// MARK: - 지정된 버퍼 사이즈만큼 최신 이벤트를 저장하고, 새로운 구독자에게 전달함
// - 버퍼는 메모리에 저장되기 때문에, 항상 메모리에 신경 써야함.
// - 종료 여부에 관계 없이, 항상 버퍼에 저장되어 있는 이벤트를 전달함

// - 생성자가 아닌 create 메소드로 생성함
// - bufferSize: 이벤트 저장 개수

let rs = ReplaySubject<Int>.create(bufferSize: 3)

(1...10).forEach { rs.onNext($0) } //10개의 이벤트 방출

rs.subscribe { print("Observer 1 >>", $0) }
  .disposed(by: disposeBag)

rs.subscribe { print("Observer 2 >>", $0) }
  .disposed(by: disposeBag)

rs.onNext(11) //새 이벤트가 추가되면서, 버퍼에서 가장 오래된 이벤트를 밀어냄

rs.subscribe { print("Observer 3 >>", $0) }
  .disposed(by: disposeBag)

//rs.onCompleted()
rs.onError(MyError.error)

//completed 방출 후 새로운 구독자가 구독하면, 버퍼의 이벤트 전달 후 completed 이벤트가 전달됨.
//error 방출 후 새로운 구독자가 구독하면, 버퍼의 이벤트 전달 후 error 이벤트가 전달됨.
rs.subscribe { print("Observer 4 >>", $0) }
