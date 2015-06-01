import Foundation

extension Array {
  mutating func removeObject<U: Equatable>(object: U) {
    var index: Int?
    for (idx, objectToCompare) in enumerate(self) {
      if let to = objectToCompare as? U {
        if object == to {
          index = idx
        }
      }
    }
    
    if(index != nil) {
      self.removeAtIndex(index!)
    }
  }
  
  
  func forEach(doThis: (element: T) -> Void) {
    for e in self {
      doThis(element: e)
    }
  }
  
  func eachWithIndex(doThis: (index: Int, element: T) -> Void) {
    for (i, e) in enumerate(self) {
      doThis(index: i, element: e)
    }
  }
}