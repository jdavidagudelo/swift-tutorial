//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
let tipAndTotal : (Double, Double) = (100.0, 20.0)
tipAndTotal.0
tipAndTotal.1
let (tip, total) = tipAndTotal
tip
total
let tipAndTotalNamed = (tip:100, total:200)
tipAndTotalNamed.total
tipAndTotalNamed.tip
let totalValue = 21.19
let taxPct = 0.06
let subtotal = totalValue/(taxPct+1)
func calcTipWithTipPct(tipPct: Double) -> (tiAmt:Double, total:Double){
    let tipAmt = subtotal*tipPct;
    let finalTotal = total+tipAmt;
    return (tipAmt, finalTotal);
}
calcTipWithTipPct(0.20)
class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> (tiAmt:Double, total:Double){
        let tipAmt = subtotal*tipPct;
        let finalTotal = total+tipAmt;
        return (tipAmt, finalTotal);
    }
    
    func returnPossibleTips() -> [Int: (Double, Double)] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: (Double, Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}
let x = TipCalculatorModel(total: total, taxPct: taxPct)
let result = x.returnPossibleTips()

@objc protocol Speaker{
    func Speak()
    optional func tellJoke()
}
class Vicki: Speaker
{
    @objc func Speak(){
        print("Hello I am Speaking")
    }
    @objc func tellJoke(){
        print("Oh I am so funny")
    }
}
class Ray: Speaker{
    @objc func Speak(){
        print("This is Me Speaking");
    }
}
class Animal {
}
class Dog : Animal, Speaker {
    @objc func Speak() {
        print("Woof!")
    }
}

var speaker: Speaker
speaker = Ray()
speaker.Speak()
speaker.tellJoke?()
speaker = Vicki()
speaker.Speak()
speaker.tellJoke?()

