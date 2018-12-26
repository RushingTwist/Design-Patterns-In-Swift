/*
 适配器模式:
    通过创建适配器进行接口转换, 让不兼容的接口变成兼容. 将一个类的接口转换成另一个符合客户期望的接口.
 
 适配器可以分为对象适配器(组合)和类适配器(继承).
 
 装饰器/适配器/外观:
    装饰器: 用于包装/添加一些新的行为, 但不改变接口.
    适配器: 用于接口转换(一定会转换接口). 改变接口以符合客户端的期望.
    外观: 让接口更简单(提供一个或多个子系统功能组合起来的一个简化接口). 外观没有"封装"子系统类, 只是提供简化的接口, 但是依然会将子系统完整的功能暴露出来, 以供需要的人使用.  外观模式的另一个好处: 如果当初你的客户端代码是针对外观而不是针对子系统编写的, 当子系统功能升级/修改, 只需要修改外观代码就可以了(这点装饰器和适配器也适用).
 */

/*:
🔌 Adapter
----------

The adapter pattern is used to provide a link between two otherwise incompatible types by wrapping the "adaptee" with a class that supports the interface required by the client.

### Example
*/
protocol OlderDeathStarSuperLaserAiming {
    var angleV: NSNumber {get}
    var angleH: NSNumber {get}
}
/*:
**Adaptee**
*/
struct DeathStarSuperlaserTarget {
    let angleHorizontal: Double
    let angleVertical: Double

    init(angleHorizontal:Double, angleVertical:Double) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}
/*:
**Adapter**
*/
struct OldDeathStarSuperlaserTarget : OlderDeathStarSuperLaserAiming {
    private let target : DeathStarSuperlaserTarget

    var angleV:NSNumber {
        return NSNumber(value: target.angleVertical)
    }

    var angleH:NSNumber {
        return NSNumber(value: target.angleHorizontal)
    }

    init(_ target:DeathStarSuperlaserTarget) {
        self.target = target
    }
}
/*:
### Usage
*/
let target = DeathStarSuperlaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
let oldFormat = OldDeathStarSuperlaserTarget(target)

oldFormat.angleH
oldFormat.angleV
/*:
>**Further Examples:** [Design Patterns in Swift](https://github.com/kingreza/Swift-Adapter)
*/
