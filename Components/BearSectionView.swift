import SwiftUI

struct BearSectionView : View {
    let section: BearSection
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading, spacing: 8){
                Text(section.title)
                    .font(Fonts.sectionTitle)
                    .foregroundColor(Color("TextPrimary"))
                
                Text(section.subtitle)
                    .font(Fonts.body)
                    .foregroundColor(Color("TextSecondary"))
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:16){
                    ForEach(section.bears){bear in
                        BearCard(bear: bear)
                            .frame(width: 200)
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}
