


import Foundation


class inputdoc{
    
    
    func input()->[Doctor]{
    
        enum avail{
            
            case AM
            case PM
            case Both
        }
        
        print("How many Entries")
        var inputsize = Int(readLine()!)
        var d:[Doctor] = []
        var lang1 :avail?
        for i in 0..<inputsize!
        {
            print("Print timings morning for a evening for p and both for any character")
            var input = readLine()
            if input == "a" || input == "A"
            {
                var lang = avail.AM
                lang = .AM
                lang1 = lang
            }
                
            else if input == "p" || input == "P"
            {
                var lang = avail.PM
                lang = .PM
                lang1 = lang
            }
            else
            {
                var lang = avail.Both
                lang = .Both
                lang1 = lang
            }
            switch lang1 {
                
            case .AM?:
                
                let d1 = Doctor(name: "Sudipta", id: "D101", specialization: "Cardiology", availability: "AM")
                d.append(d1)
                
            case .PM?:
                
                let d2 = Doctor(name: "Raj", id: "D102", specialization : "Psychiatrist", availability: "PM")
                d.append(d2)
                
            case .Both?:
                
                let d3 = Doctor(name: "Pradip", id: "D103", specialization: "NeuroSurgeon", availability: "Both")
                d.append(d3)
                
            default:
                
                print("Insert perfect time")
            }
            
            
            
            
            
        }
        
        return d
        

       }
    
}
