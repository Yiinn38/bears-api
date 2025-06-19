import Foundation
import Combine

@MainActor
class BearViewModel: ObservableObject {
    @Published var bearSections: [BearSection] = []
    @Published var conservationEfforts: [ConservationEffort] = []
    
    init() {
        Task {
            await loadBearData()
            loadConservationData()
        }
    }
    
    func loadBearData() async {
        guard let url = URL(string: "http://64.23.175.211:8080/bear") else {
            print("URL inválida")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let bears = try JSONDecoder().decode([Bear].self, from: data)
            
            print("Osos cargados: \(bears.count)")  // <-- este print
            
            self.bearSections = [
                BearSection(
                    title: "Dive deeper into Bear Knowledge",
                    subtitle: "Explore our comprehensive sections to learn more about bears.",
                    bears: bears
                )
            ]
            
        } catch {
            print("Error cargando osos: \(error)")
        }
    }

    private func loadConservationData() {
        conservationEfforts = [
            ConservationEffort(title: "Conservation Efforts", description: "Protect and preserve bear habitats through targeted Conservation ", iconName: "leaf.fill")
        ]
    }
}

