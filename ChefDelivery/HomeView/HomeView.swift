//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Douglas Silva on 17/03/26.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Attributes
    
    @State private var isAnimating = false
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    let buttonHeight: CGFloat = 80
    
    // MARK: - Body view
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundCirclesView(isAnimating: $isAnimating)
                
                VStack {
                    HeaderTextViews(isAnimating: $isAnimating)
                    
                    MainImageView(isAnimating: $isAnimating)
                    
                    ZStack {
                        
                        BottomButtonView(buttonOffset: $buttonOffset, buttonHeight: buttonHeight)
                        
                        BottomButtoSliderView(buttonOffset: $buttonOffset, showSecondScreen: $showSecondScreen, buttonHeight: buttonHeight)
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 100)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

#Preview {
    HomeView()
}


// MARK: - Background Circles View

struct BackgroundCirclesView: View {
    
    @Binding var isAnimating: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .foregroundColor(Color("ColorRed"))
                .frame(width: isAnimating ? 200 : 0)
                .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                .blur(radius: 60)
                .opacity(isAnimating ? 0.5 : 0)
            
            Circle()
                .foregroundColor(Color("ColorRedDark"))
                .frame(width: isAnimating ? 200 : 0)
                .position(x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50, y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50)
                .blur(radius: 60)
                .opacity(isAnimating ? 0.5 : 0)
        }
    }
}

// MARK: - Header Text View

struct HeaderTextViews: View {
    
    @Binding var isAnimating: Bool
    
    var body: some View {
        Text("Chef Delivery")
            .font(.system(size: 48))
            .fontWeight(.heavy)
            .foregroundColor(Color("ColorRed"))
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
        
        Text("Peça as suas comidas no conforto da sua casa")
            .font(.title2)
            .padding()
            .multilineTextAlignment(.center)
            .foregroundColor(.black.opacity(0.7))
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0: -40)
    }
}

// MARK: - Main Image View

struct MainImageView: View {
    
    @Binding var isAnimating: Bool
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        Image("image")
            .resizable()
            .scaledToFit()
            .shadow(radius: 60)
            .padding(isAnimating ? 32 : 92)
            .opacity(isAnimating ? 1 : 0)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .gesture(
                DragGesture()
                    .onChanged({gesture in
                        updateImageOffset(offset: gesture.translation)
                        
                    })
                    .onEnded({_ in
                        updateImageOffset()
                    })
            )
    }
    
    private func updateImageOffset(offset: CGSize = .zero) {
        withAnimation(.easeInOut(duration: 0.5)) {
            imageOffset = offset
        }
    }
}

// MARK: - Bottom Button View

struct BottomButtonView: View {
    
    @Binding var buttonOffset: CGFloat
    let buttonHeight: CGFloat
    
    var body: some View {
        Capsule()
            .fill(Color("ColorRed").opacity(0.2))
        
        Capsule()
            .fill(Color("ColorRed").opacity(0.2))
            .padding(8)
        
        Text("Descrubra mais")
            .font(.title2)
            .bold()
            .foregroundColor(Color("ColorRedDark"))
            .offset(x: 20)
        
        HStack {
            Capsule()
                .fill(Color("ColorRed"))
                .frame(width: buttonOffset + buttonHeight)
            
            Spacer()
        }
    }
}

// MARK: - Bottom Button Slider View

struct BottomButtoSliderView: View {
    
    @Binding var buttonOffset: CGFloat
    @Binding var showSecondScreen: Bool
    let buttonHeight: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    
                    Circle()
                        .fill(Color("ColorRedDark"))
                        .padding(8)
                    
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .offset(x: buttonOffset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width >= 0  &&
                            buttonOffset <= (geometry.size.width - 60) - buttonHeight {
                            updateButtonOffset(offset: gesture.translation.width)
                        }
                    })
                    .onEnded({ _ in
                        
                        if buttonOffset > (geometry.size.width - 60) / 2 {
                            showSecondScreen = true
                        } else {
                            updateButtonOffset()
                        }
                        
                    })
            )
        }
    }
    
    private func updateButtonOffset(offset: CGFloat = .zero) {
        withAnimation(.easeInOut(duration: 0.25)) {
            buttonOffset = offset
        }
    }
}

