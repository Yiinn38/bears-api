import SwiftUI

struct HomeView : View {
    @StateObject private var viewModel = BearViewModel()
    @State private var selectedBear: Bear? = nil
    
    var body: some View {
        ScrollView{
            VStack(spacing:30){
                NavigationBar()
                
                HeroSection()
                
                HStack {
                    Text("Choose a Bear")
                        .font(.title)
                        .fontWeight(.bold)
                }
                HStack {
                    ForEach(viewModel.bearSections.flatMap { $0.bears }) { bear in
                        BearCard(bear: bear)
                            .onTapGesture {
                                selectedBear = bear
                            }
                    }
                }

                ConservationSection(efforts: viewModel.conservationEfforts)
            }
            .padding(.bottom, 50)
        }
        .background(Color("Background"))
        .sheet(item: $selectedBear) { bear in
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    Text(bear.estadoConservacion)
                        .padding(8)
                        .background(Color.orange.opacity(0.3))
                        .clipShape(Capsule())
                        .foregroundColor(.orange)

                    AsyncImage(url: URL(string: bear.imagen)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .frame(width: 220, height: 180)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        } else {
                            Color.gray.opacity(0.2)
                                .frame(width: 180, height: 220)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }

                    Text(bear.especie)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text("Nombre científico: \(bear.nombreCientifico)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("Peso: \(bear.pesoKg, specifier: "%.1f") kg")
                    Text("Longitud: \(bear.longitudM, specifier: "%.2f") m")

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hábitat:")
                            .font(.headline)
                        Text(bear.habitat)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Descripción:")
                            .font(.headline)
                        Text(bear.descripcion)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer(minLength: 20)

                }
                .padding()
            }
        }

        
        
    }
}
