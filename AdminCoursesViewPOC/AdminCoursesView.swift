//
//  ContentView.swift
//  AdminCoursesViewPOC
//
//  Created by Guru Mahan on 03/02/23.
//

import SwiftUI

struct AdminCoursesView: View {
    @ObservedObject var viewModel = AdminCoursesViewModel()
    @State var firstbutton: Bool = false
    @State var secondbutton: Bool = false
    @State var thirdbutton: Bool = false
    @State var fourthbutton: Bool = false
    @State var courseCodeCount = []
    
    //MARK: -> bodyView
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "1A7BDC"), Color(hex: "56B8FF")], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            VStack {
                HStack{
                    HStack(spacing: 18){
                        Button{
                            
                        } label: {
                            Image("bulletMenuButton").foregroundColor(Color.white)
                                .font(Font.system(size: 25))
                        }
                        Label("Admin Courses", systemImage: "")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(-11)
                    }
                    Spacer()
                    
                    HStack{
                        searchButtonView
                            .frame(width: 40 ,height: 40)
                            .background(Color.white)
                    }
                    .cornerRadius(20)
                }
                .padding()
                ScrollView(.horizontal,showsIndicators: false){
                    HStack {
                        
                        completeButtonView
                        toStartButtonView
                        inProgressButtonView
                        allButtonView
                        
                    }
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
            Text("Completed").padding(10)
                .font(Font.system(size: 12))
                .frame(width: 106,height: 29)
                .background(firstbutton ? Color.white : Color.white.opacity(0.6))
                .foregroundColor(Color(uiColor: .black))
                .cornerRadius(20)
            
            
        }
        
        
        
    }
    @State var title = ""
    
    @State var playing = false
    @State var width : CGFloat = 100
    @State var current = 0
    @State var finish = false
   
    
    @ViewBuilder var backgroundView: some View{
        VStack{
            //  if fourthbutton{
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    VStack{
                        ForEach(viewModel.adminModelList,id: \.id){ adminModelList in
                            courseCodeCellView(adminList: adminModelList)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(9)
                                .padding()
                        }
                        
                        
                    }
                    
                }
            }
            //  }
        }
    }
    
    @ViewBuilder func courseCodeCellView(adminList: AdminCourseCellModel) -> some View{
        
        
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
            VStack(alignment: .leading,spacing: 10){
              
                    if let index = viewModel.adminCourseIndexOf(adminCourseCell: adminList ){
                        
                        HStack{
                            Text("3.5").font(.headline)
                                 ForEach(0..<maximumRation , id: \.self) { number in
                                   
                                     image(for: number, rating: adminList.rating)
                                         .font(.system(size: 22))
                                         .foregroundColor(number > adminList.rating ? offColor : onColor)
                                         .onTapGesture {
                                         
                                             viewModel.adminModelList[index].rating = number
                                             
                                         }
                                     
                                 
                         
                         }
                     
                    }
                }
                Text("1234 Total feedbacks / 85 Sessions")
            }.padding()
            
            Divider().padding(2)
            VStack(alignment: .leading){
                HStack{
                 
                       
                    ForEach(0..<(adminList.SessionCount.firstIndex(of: "52") ?? 0),id: \.self){ index in
                                Text(" \(adminList.SessionCount[index])/ 52 Sessions")
                         
                      
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("To Start").foregroundColor(Color.red)
                            .fontWeight(.bold)
                    }
                    
                }
                ZStack(alignment: .leading){
                    Capsule().fill(Color.black.opacity(0.08)).frame(width: .infinity,height: 8)
                    Capsule().fill(Color.red).frame(width: 300 ,height: 8)
                    
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
    var maximumRation = 5
    var offImage = Image(systemName: "star.fill")
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    

    func image(for number: Int,rating: Int) -> Image {
        if number > rating{
            return offImage
            
        }else{
            return onImage
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
                .padding(10)
                .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 14))
                .frame(width: 82,height: 29)
                .background(secondbutton ? Color.white : Color.white.opacity(0.6))
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
            Text("In  Progress").padding(10)
                .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 14))
                .frame(width: 109,height: 29)
                .background(thirdbutton ? Color.white : Color.white.opacity(0.6))
            
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
            Text("All").padding(10)
                .foregroundColor(Color(uiColor: .black))
                .font(Font.system(size: 14))
                .frame(width: 50,height: 29)
                .background(fourthbutton ? Color.white : Color.white.opacity(0.6))
                .cornerRadius(20)
      
        }
   
    }
  
  
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AdminCoursesView()
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
