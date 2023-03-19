
import UIKit
import RxSwift

/*:
 # PublishSubject
 */
// MARK: - PublishSubject는 구독 이후에 전달되는 새로운 이벤트만 구독자로 전달한다.
let disposeBag = DisposeBag()

enum MyError: Error {
  case fatalError
}

let subject = PublishSubject<String>()
subject.onNext("Hello")

subject //구독자
  .subscribe { print(">> 1", $0) }
  .disposed(by: disposeBag)

subject.onNext("RxSwift")

subject //구독자
  .subscribe { print(">> 2", $0) }
  .disposed(by: disposeBag)

subject.onNext("Subject")

subject.onError(MyError.fatalError) //모든 구독자에게 에러 이벤트 전달하고 구독 종료

//subject.onCompleted() //모든 구독자에게 완료 이벤트 전달하고 구독 종료

// 이미 에러종료 였는데 구독자가 생기면, 에러이벤트 보내고 종료
// 이미 완료종료 였는데 구독자가 생기면, 완료이벤트 보내고 종료
subject
  .subscribe { print(">> 3", $0) }
  .disposed(by: disposeBag)


//subject가 최초로 생성되는 시점과, 첫번째 구독이 시작되는 사이에 전달되는 이벤트는 그냥 사라진다.
