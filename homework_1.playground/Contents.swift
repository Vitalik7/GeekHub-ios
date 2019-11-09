import UIKit
import Foundation
import PlaygroundSupport

/*
 1 Use and understand Swift's basic types like Bool, Int, String, and Double
 Створіть константи із вказаними значеннями двома способами (явно вказуючи тип і неявно)
 Перевірте себе функцією type(of: тут вкажіть назву константи)
*/
// а) ціле число 1
let a = 1
let b: Int = 1
type(of: a)
type(of: b)
// b) дійсне число 1.0
let a1 = 1.0
let b1: Float = 1.0
type(of: a1)
type(of: b1)
// с) рядок, що містить фразу Hello world!
let a2 = "Hello world!"
let b2: String = "Hello world!"
type(of: a2)
type(of: b2)
// d) рядок, що містить фразу The number is та константу з числом 42
let a3: Int = 42
let b3 = "The number is \(a3)"
let c3: String = "The number is \(a3)"
type(of: c3)
// e) хибне значення
let a4 = false
let b4: Bool = false
type(of: a4)
type(of: b4)
// f) істинне значення
let a5 = true
let b5: Bool = true
type(of: a5)
type(of: b5)


/*
 2 Declare and use variables and constants (var let)
*/
// a) Зробіть константу цілого типу зі значенням 3
let num: Int = 3
num
// b) Зробіть змінну типу рядок зі значенням "The three is "
var phrase: String = "The three is "
// c) Змініть значення змінної на таке, що містить раніше створену константу
phrase = String(num)

/*
 3 Handle flow control and looping constructs (if for while switch)
*/
// a) Створіть розгалуження яке до змінної b додасть число 1 якщо b додатнє і відніме - якщо від'ємне
var bNum = -1
if bNum > 0 {
    bNum + 1
} else if bNum < 0 {
    bNum - 1
}
// b) Пройдіть циклом по числам від 1 до 10 і виведіть їх (використайте спочатку for потім while)
var i = 0
for i in 0...10 {
    i
}

while i <= 10 {
    i+=1
}

// c) Використайте switch із цілочисельною змінною який виведе фразу "Low" для значень від 1 до 18, "High" для 19-36, "Zero" для 0 та "Unknown" для решти значень
var value: Int = 7
var result: String = ""
switch value {
case 1...18:
    result = "Low"
case 19...36:
    result = "Hight"
case 0:
    result = "Zero"
default:
    result = "Unknown"
}


/*
 4 Create and use collections (Array Set Dictionary)
*/
// a) Створіть масив (Array) цілих чисел та посортуйте його
var array: Array = [1, 7, 2, 4, 45, 8, 2, 1, 94, 77]
array.sort()
// b) Створіть дві множини (Set) цілих чисел та знайдіть їх перетин
let set1: Set = [9, 56, 44, 8, 61, 13, 1]
let set2: Set = [4, 5, 33, 7, 16, 88, 9, 8]
set1.intersection(set2)
// с) Створіть Dictionary в якому ключем виступає рядок а значенням будь-який тип і заповніть його
var dict: [String: Any?] = [:]
dict["key"] = "value"
dict

/*
 5 Develop and use simple functions ( inout ->  )
 */
// а) Створіть функцію яка приймає на вхід масив і віддає найчастіше повторюване значення в ньому

var testArr = [6, 2, 16, 9, 5, 1, 9, 3, 7, 22, 6, 4, 30, 7, 1]
func testFunc(array: [Int]) -> Int {
    var numCommon: Int = 0
    var numberDict: [Int: Int] = [:]
    
    for num in array {
        if let count = numberDict[num] {
            numberDict[num] = count + 1
        } else {
            numberDict[num] = 1
        }
    }
    
    let highestValue = numberDict.values.max()
    for (num, _) in numberDict {
        if numberDict[num] == highestValue {
            numCommon = num
        }
    }
    numCommon
    
    return numCommon
}

testFunc(array: testArr)

// b) Створіть функцію яка приймає на вхід масив і змінює його ж, додаючи до кожного значення 1
func funcPlusOne(in array: inout [Int]) {
    for i in (array.indices) {
        array[i] += 1
    }
}

funcPlusOne(in: &testArr)

/*
 6-7 Cast objects safely from one type to another ( as! as? as init). Handle optionals and unwrap them safely (if let ; guard let ; != nil)
 Створіть функцію яка приймає на вхід змінну типу Any? і перевіряє тип значення на String, Int, Double, Float та інші базові типи.
 Результат виконання функції - рядок з відповідним типом або "Unknown type" якщо визначити тип не вдалось.
 (!) Для виконання цього завдання НЕ використовуйте метод type(of: ).
 (!!) Для виконання цього завдання МОЖНА використовувати наступні конструкції (спробуйте кожну з них в окремії функції)
 a) `if let`
 b) switch.
 */

func checkType(value: Any?) -> Any? {
    var typeRes: String = ""
    if (value as? String) != nil {
        typeRes = "String"
    } else if (value as? Int) != nil {
        typeRes = "Int"
    } else if (value as? Double) != nil {
        typeRes = "Double"
    } else if (value as? Float) != nil {
        typeRes = "Float"
    } else if (value as? Bool) != nil {
        typeRes = "Boolean"
    } else {
        typeRes = "Unknown type"
    }

    return typeRes
}
checkType(value : "str")

func checkTypeSecond(value: Any?) -> Any? {
    var typeRes: String = ""
    switch value {
    case is String:
        typeRes = "String"
    case is Int:
        typeRes = "Int"
    case is Double:
        typeRes = "Double"
    case is Float:
        typeRes = "Float"
    case is Bool:
        typeRes = "Boolean"
    default:
        typeRes = "Unknown type"
    }
    return typeRes
}

checkTypeSecond(value: true)
