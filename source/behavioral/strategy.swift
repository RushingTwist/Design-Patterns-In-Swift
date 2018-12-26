/*
 策略模式:
    定义算法族, 分别封装起来, 使其之间可以相互替换. 此模式让算法的变换独立于使用算法的客户.

 
 继承的缺点:(不同的子类Printer实现各自的print方法)
    1. 容易造成代码在多个子类中重复.
    2. 修改基类会影响子类.(牵一发而动全身)
    3. print方法实现写死在子类中(实现跟类捆绑在一起了,不能在调用时修改/随意组合). 不能在外面动态修改Printer行为. 不够灵活.

 原则:
    1.封装变化.
    2.多用组合, 少用继承.
    3.针对接口编程, 不针对实现编程.
*/

/*******************************************************************/
/*:
💡 Strategy
-----------

The strategy pattern is used to create an interchangeable family of algorithms from which the required process is chosen at run-time.

### Example
*/
protocol PrintStrategy {
    func print(_ string: String) -> String
}

final class Printer {

    private let strategy: PrintStrategy

    func print(_ string: String) -> String {
        return self.strategy.print(string)
    }

    init(strategy: PrintStrategy) {
        self.strategy = strategy
    }
}

final class UpperCaseStrategy: PrintStrategy {
    func print(_ string: String) -> String {
        return string.uppercased()
    }
}

final class LowerCaseStrategy: PrintStrategy {
    func print(_ string:String) -> String {
        return string.lowercased()
    }
}
/*:
### Usage
*/
var lower = Printer(strategy: LowerCaseStrategy())
lower.print("O tempora, o mores!")

var upper = Printer(strategy: UpperCaseStrategy())
upper.print("O tempora, o mores!")
/*:
>**Further Examples:** [Design Patterns in Swift](https://github.com/kingreza/Swift-Strategy)
*/
