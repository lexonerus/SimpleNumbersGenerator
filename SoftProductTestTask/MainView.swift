//
//  ContentView.swift
//  SoftProductTestTask
//
//  Created by Alex Krzywicki on 20.07.2022.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @StateObject var model = Model()
    @State private var selector = 0
    
    private var colors: [Color] = [Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)),Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))]
    private var gridColumns = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    private let limit = 999_999_999_999

    var body: some View {
        // Display header
        VStack {
            Spacer()
                  .frame(height: 20)
            Text("Генератор чисел")
                .foregroundColor(.white)
                .font(
                    .system(size: 20)
                    .bold()
                )
            Picker("Генератор чисел", selection: $selector, content: {
                Text("Простые числа")
                    .tag(0)
                Text("Числа Фибоначчи")
                    .tag(1)
            })
                .pickerStyle(SegmentedPickerStyle())
            Spacer()
                .frame(height: 10)
        }
        .background(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)))
                // Display primes
                if selector == 0 {
                    ScrollView {
                        LazyVGrid(columns: gridColumns, spacing: 0) {
                            ForEach((0...limit), id: \.self) {
                                Text("  \(model.primeArray[$0])    ")
                                        .font(.system(size: 30))
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                                        .background(colors[$0 % colors.count])
                                        .scaledToFill()
                                        .minimumScaleFactor(0.3)
                                        .lineLimit(1)
                                        .onAppear {
                                            model.generatePrimes()
                                        }
                            }
                        }
                    }
                }
                // Display fibo
                if selector == 1 {
                    ScrollView {
                        LazyVGrid(columns: gridColumns, spacing: 0) {
                            ForEach((0...limit), id: \.self) {
                                if $0 <= 87 {
                                    Text("  \(model.generateFibonacci(n: $0+1))    ")
                                        .font(.system(size: 30))
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                                        .background(colors[$0 % colors.count])
                                        .scaledToFill()
                                        .minimumScaleFactor(0.3)
                                        .lineLimit(1)
                                } else {
                                    Text("  \(model.fibArray[$0 % model.fibArray.count])    ")
                                        .font(.system(size: 30))
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                                        .background(colors[$0 % colors.count])
                                        .scaledToFill()
                                        .minimumScaleFactor(0.3)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
