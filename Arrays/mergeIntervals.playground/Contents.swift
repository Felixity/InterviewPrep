import Cocoa

// Given a collection of intervals, merge all overlapping intervals.
// For example,
// Given [1,3],[2,6],[8,10],[15,18],
// return [1,6],[8,10],[15,18].

// Definition for an interval.
public class Interval {
    
    public var start: Int
    
    public var end: Int
    
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

struct Stack<Element> {
    
    fileprivate var array: [Element] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func top() -> Element? {
        return array.last
    }
}

class Solution {
    
    func merge(_ intervals: [Interval]) -> [Interval] {

        var mergedIntervals: [Interval] = []
        
        // sort the intervals
        let sortedIntervals = intervals.sorted { $0.start < $1.start }
        
        // create the stack
        var stack = Stack<Interval>()
        
        for interval in sortedIntervals {
            if stack.isEmpty {
                stack.push(interval)
            }
            else {
                let top = stack.top()
                if interval.start <= (top?.end)! {
                    
                    // determine the end of the interval by calculating the max between top.end and interval.end
                    let max = (top?.end)! > interval.end ? (top?.end)! : interval.end
                    
                    stack.pop()
                    stack.push(Interval((top?.start)!, max))
                }
                else {
                    // the intervals can't be merged, so we have to add the new interval to the stack
                    stack.push(interval)
                }
            }
        }
        
        for index in 0..<stack.count {
            mergedIntervals.append(stack.pop()!)
        }
        mergedIntervals = mergedIntervals.sorted(by: { $0.start < $1.start })
        
        return mergedIntervals
    }
    
    init() {}
}

var intervals: [Interval] = []

let int1 = Interval(1,3)
let int2 = Interval(8,10)
let int3 = Interval(2,6)
let int4 = Interval(15,18)

intervals.append(int1)
intervals.append(int2)
intervals.append(int3)
intervals.append(int4)

let sol = Solution()
sol.merge(intervals)

