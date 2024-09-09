//
//  LeetCode34Tests.swift
//  TDDLeetCodeTests
//
//  Created by Champion Chen on 2024/9/9.
//

import XCTest

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard !nums.isEmpty else {
        return [-1, -1]
    }
    
    if nums.count == 1 {
        return nums[0] == target ? [0, 0] : [-1, -1]
    }
    
    var start = 0
    var end = nums.count-1
    var result = [Int]()
    
    while (start <= end) {
        if nums[start] == target {
            result.append(start)
            start += 1
        }
        
        if nums[end] == target {
            result.append(end)
            end -= 1
        }
        
        let mid = (start+end)/2
        if nums[mid] > target {
            end = mid - 1
        } else if nums[mid] < target {
            start = mid + 1
        }
    }
    
    return result.isEmpty ? [-1, -1] : result
}

final class LeetCode34Tests: XCTestCase {
    
    func test_emptyNums_withDefaultResult() {
        XCTAssertEqual(searchRange([], 0), defaultFailure)
    }

    func test_onlyOneNum_withCorrectResult() {
        XCTAssertEqual(searchRange([1], 1), [0, 0])
        XCTAssertEqual(searchRange([0], 2), defaultFailure)
    }
    
    func test_twoNums_withCorrectResult() {
        XCTAssertEqual(searchRange([2,2], 2), [0, 1])
        XCTAssertEqual(searchRange([0,4], 3), defaultFailure)
        XCTAssertEqual(searchRange([4,4], 3), defaultFailure)
    }
    
    private let defaultFailure = [-1, -1]
}
