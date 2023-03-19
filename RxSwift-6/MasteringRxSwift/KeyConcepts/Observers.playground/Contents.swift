//
//  Mastering RxSwift
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift
/*:
 # Observers
 */
// Observable이 이벤트를 먼저 방출했어도, 이벤트의 전달은 Observer가 구독을 시작하는 시점에 전달된다.
//Observer는 동시에 두개 이상 이벤트를 처리하지 않는다. -> Observable은 이벤트를 하나씩 방출한다.

let o1 = Observable<Int>.create { (observer) -> Disposable in
  
  // 둘이 같은 코드
  observer.on(.next(0))
  observer.onNext(1)
  
  observer.onCompleted()
  
  return Disposables.create()
}

// #1. Event 객체로 받기
o1.subscribe {
  print("== Start ==")
  print($0)
//  if let element = $0.element { // element로 받는 방법
//    print(element)
//  }
  print("== End ==")
  print("")
}

print("--------------------------------------")

// #2. element 직접 받기
o1.subscribe(onNext: { elem in
  print(elem)
})

Observable.from([1, 2, 3])
