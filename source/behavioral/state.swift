/*
 状态模式:
    允许对象在内部状态改变时改变他的行为, 对象看起来好像改变了它的类.
 
 `状态模式`和`策略模式`对比:
    状态模式: 将一群行为封装在状态对象中, context的行为随时可委托到状态对象中的一个. 随着时间的流逝, 当前状态在状态对象集合中游走改变, 以反映出context内部的状态, 因此, context的行为也会跟着改变. 但是context的客户对于状态对象了解不多, 甚至根本是浑然不觉.
    策略模式: 客户通常主动指定context所要组合的策略对象是哪一个. 固然策略模式让我们具有弹性, 能够在运行时改变策略, 但是对于某个context对象来说, 通常只有一个最适当的策略对象. 而状态模式通常伴随着状态改变来重新决定行为.
 */

/*:
🐉 State
---------

The state pattern is used to alter the behaviour of an object as its internal state changes.
The pattern allows the class for an object to apparently change at run-time.

### Example
*/
final class Context {
	private var state: State = UnauthorizedState()

    var isAuthorized: Bool {
        get { return state.isAuthorized(context: self) }
    }

    var userId: String? {
        get { return state.userId(context: self) }
    }

	func changeStateToAuthorized(userId: String) {
		state = AuthorizedState(userId: userId)
	}

	func changeStateToUnauthorized() {
		state = UnauthorizedState()
	}

}

protocol State {
	func isAuthorized(context: Context) -> Bool
	func userId(context: Context) -> String?
}

class UnauthorizedState: State {
	func isAuthorized(context: Context) -> Bool { return false }

	func userId(context: Context) -> String? { return nil }
}

class AuthorizedState: State {
	let userId: String

	init(userId: String) { self.userId = userId }

	func isAuthorized(context: Context) -> Bool { return true }

	func userId(context: Context) -> String? { return userId }
}
/*:
### Usage
*/
let userContext = Context()
(userContext.isAuthorized, userContext.userId)
userContext.changeStateToAuthorized(userId: "admin")
(userContext.isAuthorized, userContext.userId) // now logged in as "admin"
userContext.changeStateToUnauthorized()
(userContext.isAuthorized, userContext.userId)
/*:
>**Further Examples:** [Design Patterns in Swift](https://github.com/kingreza/Swift-State)
*/
