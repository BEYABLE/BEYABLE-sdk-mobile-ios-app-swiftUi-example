//
//  TCTabBar.swift
//  BeyableExampleApplication
//
//  Created by Brahim Ouamassi

//

import SwiftUI


struct TCTabBar: View {
    
    @State var images:[Image]
    @State var contentTabs:[AnyView]
    @EnvironmentObject var stateStore: StateStore
    
    var body: some View {
        ZStack(alignment: .center) {
            
            // Page Content
            ForEach(contentTabs.indices) { i in
                if i == self.stateStore.indexTab {
                    self.contentTabs[i]
                }
            }
            
            // TC TAB BAR
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Divider()
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        ForEach(images.indices) { i in
                            
                            if i == self.stateStore.indexTab {
                                self.images[i]
                                    .foregroundColor(Color.black)
                                    .onTapGesture {
                                        stateStore.indexTab = i
                                    }
                            } else {
                                self.images[i]
                                    .foregroundColor(Color.gray.opacity(0.7))
                                    .onTapGesture {
                                        stateStore.indexTab = i
                                    }
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                    
                    
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -2)
                
            }.edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

