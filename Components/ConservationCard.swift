import SwiftUI

struct ConservationCard: View {
    let effort : ConservationEffort
    var body: some View {
        VStack(spacing:20){
            Image(systemName: "heart.fill")
                .font(.system(size: 24))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 50, height: 50)
                .background(Color("AccentColor").opacity(0.1))
                .clipShape(Circle())
            Text(effort.title)
                .font(.system(size:16,weight: .semibold))
                .foregroundColor(Color("TextPrimary"))
                .multilineTextAlignment(.center)
            
            Text(effort.description)
                .font(.system(size:12))
                .foregroundColor(Color("TextSecondary"))
                .multilineTextAlignment(.center)
                .lineLimit(4)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("CardBackground"))
        .cornerRadius(12)
        .shadow(color:.black.opacity(0.05),radius: 3, x:0, y:1)
    }
}
