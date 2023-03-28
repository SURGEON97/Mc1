import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView(){
            Home()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct DetailView: View {
    var body: some View{
        HStack{
            Text("hello!")
        }
    }
}
struct Home: View {
    var body: some View{
        
        VStack(spacing: 200){
            
            
            HStack {
                Text("chapter 1. Coding")
                Spacer().frame(width: 800)
                Text("STAGE").padding(.horizontal, -600)
            }
            .padding(.vertical, -60)
            
            HStack(spacing: 50){
                Image("test5")
                    .frame(width: 300, alignment: .leading)
                
                Image("test6")
                    .frame(width: 300, alignment: .center)
            }
            .padding(.vertical, -180)
            
            //                Spacer().frame(height: -10)
            
            HStack(spacing: 50){
                Image("test7")
                    .frame(width: 300, alignment: .leading)
                
                Image("test5")
                    .frame(width: 300, alignment: .center)
                
                NavigationLink(destination: Home2()) {
                    Text("Go Home2")
                }
            }
            .padding(.vertical, -10)
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home2: View {
    @State var showPopup: Bool = false
    var body: some View{
        
        NavigationView{
            
            VStack(spacing: 200){
                
                
                HStack {
                    Text("chapter 1. Coding")
                    Spacer().frame(width: 800)
                    Text("STAGE").padding(.horizontal, -600)
                }
                .padding(.vertical, -60)
                
                HStack(spacing: 50){
                    Image("test5")
                        .frame(width: 300, alignment: .leading)
                    
                    Image("test6")
                        .frame(width: 300, alignment: .center)
                }
                .padding(.vertical, -180)
                
//                Spacer().frame(height: -10)
                
                HStack(spacing: 50){
                    Image("test7")
                        .frame(width: 300, alignment: .leading)
                    
                    Image("test5")
                        .frame(width: 300, alignment: .center)
                    
                    Button("Show Popup"){
                        withAnimation{
                            showPopup.toggle()
                        }
                        
                    }
    //                NavigationLink(destination: DetailView()) {
    //                                    Text("Do Something")
                    }
                    
                }
                .padding(.vertical, -10)
                .navigationBarTitle("",displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .popupNavigationView(horizontalPadding: 40, show: $showPopup){
            
            // MARK: Your Popup content which will also performs navigations
            List{
                ForEach(tasks){task in
                    NavigationLink(task.taskTitle) {
                        Text (task.taskDescription)
                            .navigationTitle ("Destination" )
                    }
                }
            }
            .navigationTitle("Popup Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Close"){
                        withAnimation{
                            showPopup.toggle()
                        }
                    }
                }
            }
        }
    }
}

//            .frame(height: 5)
//            Spacer().frame(height: 130)
//            Spacer(minLength: 0)
//            Spacer()
//            Spacer().frame(height: <#T##CGFloat?#>)
//        Text("test12")
//            .padding(.horizontal)
//            .padding(.top)
