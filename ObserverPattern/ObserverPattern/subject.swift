


import Foundation

class Subject{
    
    private var observerArray = [Observer]()
    private var _number = Int()
    var number : Int {
        set {
            _number = newValue
            notify()
        }
        get {
            return _number
        }
    }
    
    func attachObserver(observer : Observer){
        observerArray.append(observer)
    }
    
    private func notify(){
        for observer in observerArray {
            observer.update()
        }
    }
    
}
