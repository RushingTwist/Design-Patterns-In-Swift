/*
 命令模式:
    将请求封装成对象, 可以让你使用不同的请求/队列, 或者日志请求来参数化其他对象了. 命令模式也可以支持撤销操作(undo).
 
    命令模式可以将运算块打包(一个接收者和一组动作), 然后将它传来传去, 就像一般的对象一样. 即使在使用命令对象被创建许久之后, 运算依然可以被调用, 甚至可以在不同的线程中被调用. 例如:日程安排,线程池,工作队列等. (想象有一个工作队列: 在某一端添加命令, 另一端则是线程. 线程动作: 从队列中取出一个命令, 调用execute方法, 调用完后将此命令对象丢弃再取出下一个执行.)
 */

/*:
👫 Command
----------

The command pattern is used to express a request, including the call to be made and all of its required parameters, in a command object. The command may then be executed immediately or held for later use.

### Example:
*/
protocol DoorCommand {
    func execute() -> String
}

class OpenCommand : DoorCommand {
    let doors:String

    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Opened \(doors)"
    }
}

class CloseCommand : DoorCommand {
    let doors:String

    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

class HAL9000DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors:doors)
        self.closeCommand = CloseCommand(doors:doors)
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
    
    func open() -> String {
        return openCommand.execute()
    }
}
/*:
### Usage:
*/
let podBayDoors = "Pod Bay Doors"
let doorModule = HAL9000DoorsOperations(doors:podBayDoors)

doorModule.open()
doorModule.close()
