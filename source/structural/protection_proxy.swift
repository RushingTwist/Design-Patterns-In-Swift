/*
 (保护)代理模式:
    为一个对象提供一种代理以控制对该对象的访问. 主要解决在直接访问对象时带来的问题. 在面向对象系统中, 有些对象由于某些原因(比如对象创建开销大, 或者某些操作需要安全控制...), 直接访问会给使用者或者系统结构带来很多麻烦, 可以在访问次对象时加上一个对此对象的访问层.
 
    代理分的比较多(例子是保护代理): 远程代理/虚拟代理/保护代理/cache代理/copy-on-write代理/防火墙代理/同步化代理/智能引用代理.
 
 `代理模式`和`装饰者模式`对比:
    代理模式是包装一个对象, 并控制对它的访问. 装饰着模式是包装一个对象, 并提供额外的行为.

/*:
☔ Protection Proxy
------------------

The proxy pattern is used to provide a surrogate or placeholder object, which references an underlying object. 
Protection proxy is restricting access.

### Example
*/
protocol DoorOperator {
    func open(doors: String) -> String
}

class HAL9000 : DoorOperator {
    func open(doors: String) -> String {
        return ("HAL9000: Affirmative, Dave. I read you. Opened \(doors).")
    }
}

class CurrentComputer : DoorOperator {
    private var computer: HAL9000!

    func authenticate(password: String) -> Bool {

        guard password == "pass" else {
            return false;
        }

        computer = HAL9000()

        return true
    }

    func open(doors: String) -> String {

        guard computer != nil else {
            return "Access Denied. I'm afraid I can't do that."
        }

        return computer.open(doors: doors)
    }
}
/*:
### Usage
*/
let computer = CurrentComputer()
let podBay = "Pod Bay Doors"

computer.open(doors: podBay)

computer.authenticate(password: "pass")
computer.open(doors: podBay)
