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
            for index in currentItem...(currentItem+1000) {
                if !(2...index-1).contains(where: {index%$0 == 0}) {
                    primeArray.append(index)
                }
            }
            currentItem += 1000
        } else {
            for index in currentItem...(currentItem+10) {
                if !(2...index-1).contains(where: {index%$0 == 0}) {
                    primeArray.append(index)
                }
            }
            currentItem += 10
        }

    }

}
