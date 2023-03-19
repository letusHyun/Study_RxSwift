
import UIKit
import RxSwift

/*:
 # Infallible
 */

enum MyError: Error {
  case unknown
}

let observable = Observable<String>.create { observer in
  observer.onNext("Hello")
  observer.onNext("Observable")
  
//  observer.onError(MyError.unknown)
  
  observer.onCompleted()
  
  return Disposables.create()
}

// MARK: - Infallible

// - 에러 이벤트를 방출하지 않는 것이 컴파일 타임에 보장됨
let infallible = Infallible<String>.create { observer in
  
  //  observer.onNext("Hello") Infallible에서는 이렇게 사용하면 에러뜸
  observer(.next("Hello"))
  
  return Disposables.create()
}

observable.subscribe { emit in
  print(emit)
}

infallible.subscribe(onNext: { data in
  print(data)
})

//Driver와 Signal은 항상 메인 스케줄러를 사용하고 리소스를 공유함
//Infallible은 사용하는 스케줄러가 context에 따라 달라지고, 기본적으로 리소스를 공유하지 않는다.
