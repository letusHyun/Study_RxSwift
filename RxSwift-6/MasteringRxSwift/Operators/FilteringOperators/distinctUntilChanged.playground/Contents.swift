
import UIKit
import RxSwift

/*:
 # distinctUntilChanged
 */
// 동일한 항목이 연속적으로 발생되지 않도록 필터링
struct Person {
  let name: String
  let age: Int
}

let disposeBag = DisposeBag()
let numbers = [1, 1, 3, 2, 2, 3, 1, 5, 5, 7, 7, 7]
let tuples = [(1, "하나"), (1, "일"), (1, "one")]
let persons = [
  Person(name: "Sam", age: 12),
  Person(name: "Paul", age: 12),
  Person(name: "Tim", age: 56)
]






