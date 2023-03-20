
import UIKit
import RxSwift

/*:
 # create
 */

let disposeBag = DisposeBag()

enum MyError: Error {
  case error
}

//onNext : 데이터 방출
  // - 선택 사항

//onCompleted or onError : Observable을 종료하기 위해서는 둘 중 하나 필수사항

//Disposables.create() : 모든 리소스를 종료하고, observable이 정상적으로 종료됨

Observable<String>.create { observer -> Disposable in
  guard let url = URL(string: "https://www.apple.com")
  else {
    observer.onError(MyError.error)
    return Disposables.create()
  }
  
  guard let html = try? String(contentsOf: url, encoding: .utf8)
  else {
    observer.onError(MyError.error)
    return Disposables.create()
  }
  
  observer.onNext(html)
  observer.onCompleted()
  
  
  observer.onNext("After completed") //completed 이후의 방출은 전달되지 않는다.
  
  return Disposables.create()
}
.subscribe { print($0) }
.disposed(by: disposeBag)
