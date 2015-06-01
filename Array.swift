import Foundation

extension Array {
  var select: ((Element) -> Bool) -> [Element] {
    return Array.filter(self)
  }
  
  var keep_if: ((Element) -> Bool) -> [Element] {
    return select
  }
  
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
  
  
  func each(f: (element: T) -> Void) {
    for e in self {
      f(element: e)
    }
  }
  
  func eachWithIndex(doThis: (index: Int, element: T) -> Void) {
    for (i, e) in enumerate(self) {
      doThis(index: i, element: e)
    }
  }
  
  
  func deleteIf(f: (Element) -> Bool) -> [Element] {
    return self.filter(notF(f))
  }
  
  func reverseEach(f: (Element) -> ()) {
    for e in self.reverse() {
      f(e)
    }
  }

}

func notF<T>(f: (T)->Bool) -> (T)->Bool {
  // this returns a closure that captures f
  return { !f($0) }
}