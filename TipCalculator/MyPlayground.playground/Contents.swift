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
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt:Double, total:Double)?{
        let tipAmt = subtotal*tipPct;
        let finalTotal = total+tipAmt;
        return (tipAmt, finalTotal);
    }
    
    func returnPossibleTips() -> Dictionary<Int, (tipAmt: Double, total: Double)> {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: (tipAmt:Double, total:Double)]()
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
class DateSimulator {
    
    let a:Speaker
    let b:Speaker
    
    init(a:Speaker, b:Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        print("Off to dinner...")
        a.Speak()
        b.Speak()
        print("Walking back home...")
        a.tellJoke?()
        b.tellJoke?()
    }
}

let sim = DateSimulator(a:Vicki(), b:Ray())
sim.simulate()

class TestDataSource : NSObject, UITableViewDataSource {
    
    // 3
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:[Int] = []
    
    // 4
    override init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = Array(possibleTips.keys).sort()
        super.init()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 2
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        // 3
        let tipPct = sortedKeys[indexPath.row]
        // 4
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        // 5
        cell.textLabel?.text = "\(tipPct)%:"
        cell.detailTextLabel?.text = String(format:"Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
}
let testDataSource = TestDataSource()
let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: 320, height: 320), style:.Plain)
tableView.dataSource = testDataSource
tableView.reloadData()
