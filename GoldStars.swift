/*
Gold Stars
Alice is a teacher with a class of n children, each of whom has been assigned a numeric rating. 
The classroom is seated in a circular arrangement, with Alice at the top of the circle. 
She has a number of gold stars to give out based on each child's rating, but with the following conditions:

Each child must receive at least one gold star
Any child with a higher rating than his or her immediate neighbor should get more stars than that neighbor
Assuming n >= 3, what is the minimum total number of stars Alice will need to give out?

Write a program which takes as its input an int[] containing the ratings of each child, ordered by seating position, 
and returns an int value for the minimum total number of stars that Alice will need to give out.

Hint: this problem can be solved with an algorithm that runs in O(n) time.

For example:

In a class of three children with ordered ratings of {1, 2, 2}, Alice will need to give out {1, 2, 1} stars accordingly, 
for a total number of 4 stars overall.

*/


class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var stars = [Int](repeating:1,count:ratings.count)
        let ratingsSize = ratings.count 
        var step = ratingsSize-2  //min is 3 
        var result = 0
  
        //Forward iteration
        //ratings = { 1,2,2}, stars  = {1,2,1} 
        //ratings = {6,5,4,3,2,1} stars = {1,1,1,1,1,}
        for i in 1..<ratings.count {
            if ratings[i] > ratings[i-1] {
                stars[i] = stars[i-1] + 1
            }
            //print("\(stars[i])",terminator:" ")
        }
        //print()
  
        
        //Need to iterate in backward direction for test cases like {6,5,4,3,2,1}
        while(step >= 0) {
            if ((ratings[step] > ratings[step+1]) && (stars[step] <= stars[step+1])) {
                stars[step] = stars[step+1] + 1
            }
            step -= 1
        }
  

        for i in 0..<stars.count {
            result += stars[i]
        }
  
        return result

    }
}
