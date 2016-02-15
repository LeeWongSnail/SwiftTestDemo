//
//  CalculatorBrain.swift
//  SwiftTest
//
//  Created by LeeWong on 16/2/15.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    //枚举的声明
    private enum Op : CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String,Double -> Double)
        case BinaryOperation(String,(Double,Double) -> Double)
        
        var description : String {
            get {
                switch self {
                case .Operand(let operand) :
                    return "\(operand)"
                case .UnaryOperation(let symbol, _) :
                    return symbol
                case .BinaryOperation(let symbol, _) :
                    return symbol
                }
            }
        }
    }
    
    //声明一个存放操作符的数组
   private var opStack = [Op]()
    
    //声明一个字典，注意要表明键值的类型
   private var knownOps = [String:Op]();
    
    //init 方法
    init () {
        knownOps["+"] = Op.BinaryOperation("+",+)
        knownOps["-"] = Op.BinaryOperation("-",{$0 - $1})
        knownOps["×"] = Op.BinaryOperation("×",*)
        knownOps["÷"] = Op.BinaryOperation("÷",{$1/$0})
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
   private func evaluate(ops:[Op]) -> (result:Double? ,remainingOps:[Op]) {
    
    if !ops.isEmpty {
        var remainingOps = ops
        let op  = remainingOps.removeLast()
        
        switch op {
        case .Operand(let operand) :
            return (operand,remainingOps)
            
        case .UnaryOperation(_, let operation) :
            let operandEvaluation = evaluate(remainingOps)
            
            if let operand = operandEvaluation.result {
                return (operation(operand),operandEvaluation.remainingOps)
            }
        case .BinaryOperation(_, let operation) :
            let op1Evaluation = evaluate(remainingOps)
            
            if let operand = op1Evaluation.result {
                let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                
                if let operand2 = op2Evaluation.result {
                    return (operation(operand,operand2),op2Evaluation.remainingOps)
                }
            }
            
        }
        
    }
    
        return (nil,ops)
    }
    
    //返回值可能为nil
    func evaluate() -> Double? {
        let (result,remainer) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainer)")
        return result;
    }
    
    func pushOperand(operand:Double) ->Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol:String) ->Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        
        return evaluate()
    }
    
}