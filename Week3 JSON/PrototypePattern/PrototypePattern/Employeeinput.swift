



import Foundation

class Employeeinput{
    
    var NameList = [String]()
    
    func input()->[String]{
        
        let Emp = Employee()
        //print(Emp.name!)
        let cloneobject = Emp.clone()
        
        cloneobject.name = "Raj"
        NameList.append(cloneobject.name!)
        cloneobject.name = "Sudipta"
        NameList.append(cloneobject.name!)
        return NameList
    }
    
}

