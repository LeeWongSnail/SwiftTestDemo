//
//  ViewController.swift
//  SwiftTest
//
//  Created by LeeWong on 16/2/14.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!

    //由于swift有推断类型的功能，这里可以省略掉bool
    var userIsInTheMiddleOfTypingNumber : Bool = false;
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit;
        } else {
            display.text = digit;
            userIsInTheMiddleOfTypingNumber = true;
        }
    }

    //类型推断 这里可以写成
    //var digitStack : Array <Double> = Array <Double>();
    var digitStack = Array <Double>();
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false;
        digitStack.append(displayValue)
        
        print("digitStack = \(digitStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingNumber {
            enter()
        }
        
        switch operation {
        case "+" : performOperation{$0 + $1}
        case "-" : performOperation{$0 - $1}
        case "×" : performOperation{$0 * $1}
        case "÷" : performOperation{$0 / $1}
        case "√" : performOperation{sqrt($0)}
            default :
                break
        }
        
    }
    
    //定义一个 传入两个double类型的参数返回一个double类型的方法
    func performOperation(operation:(Double,Double) -> Double){
        if digitStack.count >= 2 {
            displayValue = operation(digitStack.removeLast(),digitStack.removeLast())
            enter()
        }
    }

    private func performOperation(operation:Double -> Double){
        if digitStack.count >= 1 {
            displayValue = operation(digitStack.removeLast())
            enter()
        }
    }
    
    
    func add (op1:Double,op2:Double) -> Double {
        return op1 + op2
    }
    
    //声明一个变量的同事重写他的setter和getter方法
    var displayValue : Double {
        get {
            //字符串转换为数字
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false;
        }
    }
}



//第一种，最初级的方法 通过switch判断 点击的是哪一种运算符 然后做出对应的操作
/*
let operation = sender.currentTitle!

if userIsInTheMiddleOfTypingNumber {
enter()
}

switch operation {
case "+" :
if digitStack.count > 2 {
displayValue = digitStack.removeLast() + digitStack.removeLast()
enter()
}
case "-" :
if digitStack.count > 2 {
displayValue = digitStack.removeLast() + digitStack.removeLast()
enter()
}
case "×" :
if digitStack.count > 2 {
displayValue = digitStack.removeLast() + digitStack.removeLast()
enter()
}
case "÷" :
if digitStack.count > 2 {
displayValue = digitStack.removeLast() + digitStack.removeLast()
enter()
}
default :
break
}
*/

//第二种 抽出来一个方法 将方法作为参数进行传递

//调用
//case "+" : performOperation(add)

/*
//定义一个 传入两个double类型的参数返回一个double类型的方法
func performOperation(operation:(Double,Double) ->Double){
if digitStack.count >= 2 {
displayValue = operation(digitStack.removeLast(),digitStack.removeLast())
enter()
}
}


func add (op1:Double,op2:Double) ->Double {
return op1 + op2;
}
*/

//第三种 既然是将方法作为参数进行传递 那么为什么不直接将函数写出来作为参数 避免需要额外的定义新的方法

/*
case "+" : performOperation({(op1:Double,op2:Double) ->Double in
return op1 + op2
})

func performOperation(operation:(Double,Double) ->Double){
if digitStack.count >= 2 {
displayValue = operation(digitStack.removeLast(),digitStack.removeLast())
enter()
}
}

*/

//第四种 由于swift 有类型推断的作用所以 我们可以对格式进行调整

/*
1、
case "+" : performOperation({(op1,op2) in
return op1 + op2
})

2、
case "+" : performOperation{$0 + $1}
*/
