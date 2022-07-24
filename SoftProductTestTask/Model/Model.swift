//
//  Model.swift
//  SoftProductTestTask
//
//  Created by Alex Krzywicki on 20.07.2022.
//

import Foundation
import Combine

class Model: ObservableObject {
    
    @Published var primeArray   = [2]
    @Published var fibArray     = [0,1,1,2,3]
    private var currentItem     = 3
    
    init() {
        generatePrimes()
    }
    func generateFibonacci(n: Int) -> Int {
        if (fibArray.count > n) {
            return fibArray[n];
        }
        let fibonacciNumber = generateFibonacci(n: n - 1) + generateFibonacci(n: n - 2)
        fibArray.append(fibonacciNumber)
        return fibonacciNumber
    }
    
    func generatePrimes() {
        if currentItem == 3 {
            for index in stride(from: currentItem, to: currentItem+200, by: 2) {
                var count = 0
                for indexJ in stride(from: currentItem, to: index/2, by: 2) {
                    if index % indexJ == 0 {
                        count += 1
                    }
                    if count == 1 {
                        break
                    }
                }
                if count == 0 {
                    if checkPrime(number: index) {
                        primeArray.append(index)
                    }
                }
            }
            currentItem += 200
        } else {
            for index in stride(from: currentItem, to: currentItem+50, by: 2) {
                var count = 0
                for indexJ in stride(from: currentItem, to: index/2, by: 2) {
                    if index % indexJ == 0 {
                        count += 1
                    }
                    if count == 1 {
                        break
                    }
                }
                if count == 0 {
                    if checkPrime(number: index) {
                        primeArray.append(index)
                    }
                }
            }
            currentItem += 50
        }

        

    }
    // For future improvements...
    func checkPrime(number: Int) -> Bool {
        var i = 2
        while number / 2 >= i {
            if number % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
    
    func getPrime(number: Int) -> Int {
        var i = number
        if checkPrime(number: i) {
            return i
        } else {
            while checkPrime(number: i) == false {
                i += 1
            }
            return i
        }
    }
    
    func simplePrimeGenerator(from begin: Int, to end: Int) -> [Int] {
        var result: [Int] = []
        
        for i in begin...end {
            if checkPrime(number: i) {
                result.append(i)
            }
        }
        
        return result
    }
    
    func simpleFiboGenerator(from begin: Int, to end: Int) -> [Int] {
        var result: [Int] = []
        // Code will be here
        
        
        return result
    }

}
