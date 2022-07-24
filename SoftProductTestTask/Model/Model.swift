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
    @Published var fibArray     = [2,3]
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
            for index in stride(from: currentItem, to: currentItem+100, by: 2) {
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
            currentItem += 100
        }

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

}
