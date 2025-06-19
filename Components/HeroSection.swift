import SwiftUI

struct HeroSection : View {
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("SecondaryColor").opacity(0.3),
                    Color("SecondaryColor").opacity(0.6),
                    Color.black.opacity(0.8)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(spacing:20){
                Text("Explore the Majestic World of Bears")
                    .font(Fonts.heroTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text("Discover the dicerse species of bears, their habitats, behaviors and the ongoing conservation efforts to protect these magnificent creatures.")
                    .font(Fonts.body)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button(action:{
                    
                }){
                    Text("Learn More")
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal,30)
                        .padding(.vertical,12)
                        .background(Color("AccentColor"))
                        .cornerRadius(25)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top,10)
            }
            .padding()
        }
        .frame(height: 300)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
