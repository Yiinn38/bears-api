import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            HStack(spacing:8){
                Image(systemName: "pawprint.fill")
                    .foregroundColor(.primary)
                Text("Wild Bear")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                
            }
            Spacer()
            Button(action:{}){
                Circle()
                    .fill(Color("AccentColor").opacity(0.2))
                    .frame(width:32, height: 32)
                    .overlay(
                    Text("")
                        .font(.system(size:16))
                    )
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(Color("Background"))
    }
}

