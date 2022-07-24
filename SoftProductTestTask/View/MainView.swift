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

    var body: some View {
        // Display header
        setupHeader()
        // Display primes
        if selector == 0 {

            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 0) {
                    ForEach((0...model.primeArray.count), id: \.self) {
                        setupText(number: (model.primeArray[$0]), color: $0)
                            .onAppear {
                                DispatchQueue.main.async {
                                    model.generatePrimes()
                                }
                            }
                    }
                }
            }
            
        }
        // Display fibo
        if selector == 1 {

            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 0) {
                    ForEach((0...Constants.limit), id: \.self) {
                        if $0 < 90 {
                            setupText(number: (model.generateFibonacci(n: $0)), color: $0)
                        } else {
                            setupText(number: (model.fibArray[$0 % model.fibArray.count]), color: $0)
                        }
                    }
                }
            }
        }
    }
    
    func setupHeader() -> some View {
        let stack = VStack {
            Spacer()
                .frame(height: 20)
            Text(Constants.title)
                .foregroundColor(.white)
                .font(
                    .system(size: 20)
                    .bold()
                )
            Picker(Constants.title, selection: $selector, content: {
                Text(Constants.primeTitle)
                    .tag(0)
                Text(Constants.fiboTitle)
                    .tag(1)
            })
                .pickerStyle(SegmentedPickerStyle())
            Spacer()
                .frame(height: 10)
            } .background(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)))
        return stack
    }

    func setupText(number: Int, color: Int) -> some View {
        return Text("   \(number)   ")
            .font(.system(size: 30))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
            .background(colors[color % colors.count])
            .scaledToFill()
            .minimumScaleFactor(0.2)
            .lineLimit(1)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
