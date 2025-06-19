import Foundation

struct Bear: Identifiable, Codable {
    let id: UUID = UUID()
    let nombreCientifico: String
    let descripcion: String
    let estadoConservacion: String
    let especie: String
    let longitudM: Double
    let habitat: String
    let pesoKg: Double
    let imagen: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombreCientifico
        case descripcion
        case estadoConservacion
        case especie
        case longitudM
        case habitat
        case pesoKg
        case imagen
    }
}

struct BearSection {
    let title: String
    let subtitle: String
    let bears: [Bear]
}
