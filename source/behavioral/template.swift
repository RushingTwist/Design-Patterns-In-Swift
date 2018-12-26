/*
 模板模式:
    用来创建一个算法的模板. 在一个方法中定义一个算法的骨架, 而将一些步骤延迟到子类中. 模板方法使得子类可以在不改变算法结构的情况下, 重新定义算法的某些步骤.
 
 原则: 好莱坞原则. 允许低层组件将自己挂钩到系统上, 但是高层组件会决定什么时候和怎样使用这些低层组件. 换句话说, 高层组件对待低层组件的方式是"别调用我,我会调用你们".
 
 `好莱坞原则`和`依赖倒置`原则的关系:
    * 依赖倒置原则: 尽量避免使用具体类, 多使用抽象.
    * 好莱坞原则: 在创建框架或者组件上的一种技巧, 让低层组件能够被挂钩进计算中, 而且又不会让高层组件依赖低层组件.
    * 两者的目标都在解耦, 但是依赖倒置原则更加注重如何在设计中避免依赖.
 
 `模板模式`和`策略模式`对比:
    * 模板模式必须依赖超类中的方法实现, 因为这是算法的一部分. 但是策略模式不同, 算法由单独的类自己提供.
 */

/*:
🍪 Template
-----------

The Template Pattern is used when two or more implementations of an
algorithm exist. The template is defined and then built upon with further
variations. Use this method when most (or all) subclasses need to implement
the same behavior. Traditionally, this would be accomplished with abstract
classes and protected methods (as in Java). However in Swift, because
abstract classes don't exist (yet - maybe someday),  we need to accomplish
the behavior using interface delegation.


### Example
*/

protocol ICodeGenerator {
    func crossCompile()
}

protocol IGeneratorPhases {
    func collectSource()
    func crossCompile()
}

class CodeGenerator : ICodeGenerator{
    var delegate: IGeneratorPhases

    init(delegate: IGeneratorPhases) {
        self.delegate = delegate
    }

    private func fetchDataforGeneration(){
        //common implementation
        print("fetchDataforGeneration invoked")
    }

    //Template method
    final func crossCompile() {
        fetchDataforGeneration()
        delegate.collectSource()
        delegate.crossCompile()
    }
    
}

class HTMLGeneratorPhases : IGeneratorPhases {
    func collectSource() {
        print("HTMLGeneratorPhases collectSource() executed")
    }

    func crossCompile() {
        print("HTMLGeneratorPhases crossCompile() executed")
    }
}

class JSONGeneratorPhases : IGeneratorPhases {
    func collectSource() {
        print("JSONGeneratorPhases collectSource() executed")
    }

    func crossCompile() {
        print("JSONGeneratorPhases crossCompile() executed")
    }
}



/*:
### Usage
*/

let htmlGen : ICodeGenerator = CodeGenerator(delegate: HTMLGeneratorPhases())
let jsonGen: ICodeGenerator = CodeGenerator(delegate: JSONGeneratorPhases())

htmlGen.crossCompile()
jsonGen.crossCompile()
