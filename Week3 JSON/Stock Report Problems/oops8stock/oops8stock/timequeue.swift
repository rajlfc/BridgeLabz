import Foundation

func datecurrent() -> String{
    let dateFormatter : DateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
    let date = Date()
    let dateString = dateFormatter.string(from: date)
    return dateString
}
class NodeQ{
    var value: String
    var next: NodeQ?
    init(value: String, next: NodeQ?) {
        self.value = value
        self.next = next
    }
}
class linkedlistQueue {
    var head: NodeQ?
    func add(_ time: String){
        var time = time
        var timecurrent = datecurrent()
        time.append(timecurrent)
        // print(time)
        if(head==nil){
            head = NodeQ(value: time, next: nil)
            //  print(time)
            return
        }
        var current = head
        while(current?.next != nil){
            current = current?.next
        }
        current?.next = NodeQ(value: time, next: nil)
        // print("added stock time\(time)")
    }
    func delete(){
        var time = datecurrent()
        if(head==nil){
            print("no data in the stack")
            return
        }
        //print("deleted stock time: \(time)")
        head = head?.next
    }
    func display(){
        var current = head
        while(current != nil){
            print((current?.value)!)
            current = current?.next
        }
    }
}
