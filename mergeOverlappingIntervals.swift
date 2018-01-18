/*
Given a collection of intervals, merge all overlapping intervals.

For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].

*/

/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        var result:[Interval] = []
        var prev_start = 0, prev_end = 0 
        var curr_start = 0, curr_end = 0
        var overlap = false
        
        //corner case where there is a empty input
        if intervals.count == 0 { 
            return result
        }
        
        //sort the input 
        var sortedIntervals = intervals.sorted {
                $0.start < $1.start
        }
        
        //There is atleast one element so add in the first element to the result
        result.append(sortedIntervals[0])
        if intervals.count == 1 {
            return result
        }
        
        prev_start = sortedIntervals[0].start
        prev_end = sortedIntervals[0].end
       
        for i in 1..<sortedIntervals.count {
            
            curr_start = sortedIntervals[i].start
            curr_end = sortedIntervals[i].end
            
            if (curr_end < prev_start || curr_start > prev_end) {
                overlap = false
            }
            else {
                overlap = true
            }
            
            if(overlap) {
                prev_start = min(prev_start,curr_start)
                prev_end = max(prev_end,curr_end)
                result[result.count-1].start = prev_start
                result[result.count-1].end = prev_end
            }
            else {
                var range1 = Interval(curr_start,curr_end)
                result.append(range1)
                prev_start = curr_start
                prev_end = curr_end
                
            }
        }
        
        return result
        
        
        
    }
}
