//
//  ContentView.swift
//  AdminCoursesViewPOC
//
//  Created by Guru Mahan on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var firstbutton: Bool = false
    @State var secondbutton: Bool = false
    @State var thirdbutton: Bool = false
    @State var fourthbutton: Bool = false
    
    //MARK: -> bodyView
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "1A7BDC"), Color(hex: "56B8FF")], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                HStack{
                    Button{
                        
                    } label: {
                        Image(systemName:"chevron.backward").foregroundColor(Color.white)
                            .font(Font.system(size: 25))
                    }
                    Label("Admin Courses", systemImage: "")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(-11)
                    Spacer()
                    
                    HStack{
                        searchButtonView
                        
                            .frame(width: 40 ,height: 40)
                            .background(Color.white)
                    }
                    .cornerRadius(20)
                }
                .padding()
                
                HStack {
                    
                    completeButtonView
                    toStartButtonView
                    inProgressButtonView
                    allButtonView
                    
                }
                
                .padding(.leading,0)
                Spacer()
                
                ZStack{
                    backgroundView
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                        .background(Color(hex: " #EFEFEF"))
                        .background(Color(uiColor: .lightGray))
                }
              
            }
        }
    }
    
  
    
    @ViewBuilder var completeButtonView: some View{
        
            Button(action: {
                firstbutton.toggle()
                firstbutton = true
                secondbutton = false
                thirdbutton = false
                fourthbutton = false
                
                
            }) {
                Text("Completed").padding()
                    .font(Font.system(size: 12))
                    .background(firstbutton ? Color.white : Color(hex: "#c0c0c0"))
                //(hex: "#c0c0c0")
                    .foregroundColor(Color(uiColor: .black))
                    .frame(height: 40)
                    .cornerRadius(20)
                
                
            }
            
        
        
     }
    @State var title = ""
  
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["Arabic","tada"]
    @State var current = 0
    @State var finish = false
    @ViewBuilder var courseCodeCellView: some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading,spacing: 4){
           Text("Course Code - Course 1")
                    .fontWeight(.medium)
                Text("Program 1 / Year 2 / Level 3 / Rotation 1")
                    .foregroundColor(Color.gray)
                Text(" Jan 5, 2021 - Feb 26, 2021")
                    .foregroundColor(Color.gray)
              
             
            }.padding()
            Divider().padding(2)
            VStack(alignment: .leading){
                HStack{
                    Text(" 00/ 52 Sessions")
                  Spacer()
                    Button {
                        
                    } label: {
                        Text("To Start").foregroundColor(Color.red)
                            .fontWeight(.bold)
                    }

                }
                ZStack(alignment: .leading){
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                    Capsule().fill(Color.red).frame(width: self.width ,height: 8)
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                let x = value.location.x
                                 
                                self.width = x
                            }).onEnded({ value in
                                
                                let x = value.location.x
                                let screen = UIScreen.main.bounds.width - 30
                               
                                let percent = x / screen
                            
                            }))
                }
                .padding(.top)

            }.padding()
            Spacer()
        }
    }
    
    @ViewBuilder var backgroundView: some View{
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                VStack{
                    ForEach(0..<3){ _ in
                        courseCodeCellView
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(9)
                            .padding()
                    }
                  
                    
                }
           
            }
        }
     }
    @ViewBuilder var searchButtonView: some View{
        Button{
            
        } label: {
            Image(systemName:"magnifyingglass").foregroundColor(Color.blue)
                .cornerRadius(50)
                .font(Font.system(size: 15))
        }
        .background(Color.white)
        .frame(width: 40,height: 40)
    }
    //MARK: ->toStartButtonView
    @ViewBuilder var toStartButtonView: some View{
       
        Button(action: {
            secondbutton.toggle()
            secondbutton = true
            firstbutton = false
            thirdbutton = false
            fourthbutton = false
            
            
            
        }) {
            Text("To Start")
                .padding()
                .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 12))
                .background(secondbutton ? Color.white : Color(hex: "#c0c0c0"))
                .frame(height: 40)
                .background(Color(hex: "#c0c0c0"))
                .cornerRadius(20)
            
        }
            
        
     }
  
    //MARK: ->inProgressButtonView

    @ViewBuilder var inProgressButtonView: some View{
       
        
        Button(action: {
            thirdbutton.toggle()
            firstbutton = false
            secondbutton = false
            thirdbutton = true
            fourthbutton = false
            
        }) {
            Text("In  Progress").padding()
                .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 12))
                .background(thirdbutton ? Color.white : Color(hex: "#c0c0c0"))
                
            .frame(height: 40)
            .cornerRadius(20)
                           
            
               
        }
        
        
     }
   
    //MARK: ->allButtonView
    @ViewBuilder var allButtonView: some View{
       
        Button(action: {
            fourthbutton.toggle()
            firstbutton = false
            secondbutton = false
            thirdbutton = false
            fourthbutton = true
            
        }) {
            Text("All").padding()
                .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 12))
                .background(fourthbutton ? Color.white : Color(hex: "#c0c0c0"))
                
                .frame(height: 40)
               .cornerRadius(20)
            
            
        }
       
            
        
     }
    //MARK: ->backgroundView
 

    
    @ViewBuilder var frontView: some View{
        
        VStack {
           
            VStack{
                HStack{
                    Label("Session Details", systemImage: "")
                    Spacer()
                    ZStack{
                        Button {
                            
                        } label: {
                            
                            Text("More Info")
                            Image(systemName: "info.circle")
                            
                            
                        }
                    }
                    .frame(width: 120,height: 30)
                   
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: 2))
                    .padding(.trailing,10)

                    
                }
                
                .padding(.top,100)
                Divider()
                VStack{
                    Label("Sessoin timing", systemImage: "")
                        .font(Font.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.trailing,250)
                    Label("7 Jan 10:00AM-11:00AM", systemImage: "")
                        .padding(.trailing,140)
                        .padding(.top,-3)
                    Label("Student group", systemImage: "")
                        .font(Font.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.trailing,250)
                        .padding(.top,5)
                    Label("MG1 - G1( 50 Students )", systemImage: "")
                        .padding(.trailing,140)
                        .padding(.top,-3)
                    
                    
                }
                
            }
//            popUpView
//
//                .frame(width: 400,height: 400)
//                .background(Color(uiColor: .white))
//                .cornerRadius(15)
//              //  .padding(.top,10)
                
              Spacer()
           
                
        }
       
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
