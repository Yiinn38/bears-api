import SwiftUI

struct ConservationSection : View {
    let efforts : [ConservationEffort]
    var body: some View {
        VStack(alignment: .leading,spacing: 20){
            VStack(alignment: .leading,spacing: 8){
                Text("Conservation and Community")
                    .font(Fonts.sectionTitle)
                    .foregroundColor(Color("TextPrimary"))
                
                Text("Learn about our conservation efforts and how you can get involved.")
                    .font(Fonts.body)
                    .foregroundColor(Color("TextSecondary"))
            }
            .padding(.horizontal)
            LazyVGrid(columns:[
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16){
                ForEach(efforts){ effort in
                    ConservationCard(effort: effort)
                }
            }
            .padding(.horizontal)
        }
    }
}
