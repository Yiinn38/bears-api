import SwiftUI

struct BearCard: View {
    let bear: Bear
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color("PrimaryColor").opacity(0.3), Color("PrimaryColor").opacity(0.6)]),
                    startPoint: .leading, endPoint: .trailing
                ))
                .frame(height: 120)
                .overlay(
                    AsyncImage(url: URL(string: bear.imagen))
                    { image in
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder : {
                        Color.gray.opacity(0.2)
                            .frame(width: 150, height: 150)
                    }
                )
            VStack(alignment: .leading, spacing: 6) {
                Text(bear.especie) 
                    .font(Fonts.cardTitle)
                    .foregroundColor(Color("TextPrimary"))
                
                Text(bear.nombreCientifico)
                    .font(Fonts.caption)
                    .foregroundColor(Color("TextSecondary"))
                
                Text(bear.descripcion)
                    .font(.system(size: 12))
                    .foregroundColor(Color("TextSecondary"))
                    .lineLimit(3)
            }
            .padding(.horizontal, 4)
        }
        .frame(maxWidth: 300)
        .padding()
        .background(Color("CardBackground"))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
