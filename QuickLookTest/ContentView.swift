//
//  ContentView.swift
//  QuickLookTest
//
//  Created by Yuto on 2024/12/22.
//

import SwiftUI
import QuickLook

struct ContentView: View {
    
    let slides = [
        Bundle.main.url(forResource: "スライド1", withExtension: "pdf")!,
        Bundle.main.url(forResource: "スライド2", withExtension: "pdf")!,
        Bundle.main.url(forResource: "スライド3", withExtension: "pdf")!,
        Bundle.main.url(forResource: "スライド4", withExtension: "pdf")!,
        Bundle.main.url(forResource: "スライド5", withExtension: "pdf")!,
    ]
    
    @State var selected: URL? = nil
    @State var selectedIn: URL? = nil
    
    @State var showAllSlides: Bool = false
    
    var body: some View {
        Form {
            Section {
                ForEach(0..<5) { i in
                    Button {
                        if showAllSlides {
                            selectedIn = slides[i]
                        } else {
                            selected = slides[i]
                        }
                    } label: {
                        Text(verbatim: "スライド\(i + 1)")
                    }
                }
            }
            
            Section {
                Toggle(isOn: $showAllSlides) {
                    Text("全スライド表示")
                }
            }
        }
        .quickLookPreview($selected)
        .quickLookPreview($selectedIn, in: slides)
    }
}

#Preview {
    ContentView()
}
