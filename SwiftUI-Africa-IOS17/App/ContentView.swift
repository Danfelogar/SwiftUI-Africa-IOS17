//
//  ContentView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        //toolbar Img
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    //MARK: - Body
    var body: some View {
        VStack {
            NavigationView {
                Group {
                    if !isGridViewActive {
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalListItemView(animal: animal)
                                }//: Link
                                .listRowBackground(Color.clear)
                            }//: Loop
                            CreditsView()
                                .modifier(CenterModifier())
                        }//: List
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                                        AnimalGridItemView(animal: animal)
                                    }//: Link
                                    .listRowBackground(Color.clear)
                                }//: Loop
                            }//: LazyVGrid
                            .padding(10)
                            .animation(.easeIn)
                        }// :ScrollView
                    }//: Condition
                }//: Group
                .navigationTitle("Africa")
                .toolbarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            //List
                            Button {
                                print("List vies is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary  : .accentColor)
                            }
                            //Grid
                            Button {
                                print("Grid vies is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            } label: {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor  : .primary)
                            }
                        }//: HStack
                    }//:ToolbarItem
                }//:Toolbar
            }//: Navigation
        }
    }
}

#Preview { ContentView() }
