




import Foundation


func appoint(doc:[Doctor],docname:String,doctorvisit: inout [[Int]])->String
{
    var count = doc.count
    //var doctorvisit = Array(repeating: 0, count: count)
    var i = 0
    var flag = 1
    //while i != count
    //{
        for j in 0..<doc.count
        {
            if doc[j].name == docname && doctorvisit[j].count != 5
            {
                flag = 0
                doctorvisit[j].append(1)
                 break
                //return true
            }
            else if doc[j].name == docname
            {
                flag = 2
                break
            }
            else
            {
                flag = 3
                continue
            }
            
        }
      if flag == 0
      {
          return "Appointment Fixed"
      }
      else if  flag == 2 {
         return "Appointment cant be done. Sorry try next time"
       }
     else
      {
         return "Check doctors name.. try again later"
      }
    //}
}
