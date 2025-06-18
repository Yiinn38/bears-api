import Fluent
import Vapor

final class Bear: Model, Content, @unchecked Sendable {
    static let schema = "bears"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "especie")
    var especie: String

    @Field(key: "estado_conservacion")
    var estadoConservacion: String

    @Field(key: "nombre_cientifico")
    var nombreCientifico: String

    @Field(key: "peso_kg")
    var pesoKg: Int

    @Field(key: "longitud_m")
    var longitudM: Double

    @Field(key: "habitat")
    var habitat: String

    @Field(key: "descripcion")
    var descripcion: String

    @Field(key: "imagen")
    var imagen: String

    init() {}

    init(
        especie: String,
        estadoConservacion: String,
        nombreCientifico: String,
        pesoKg: Int,
        longitudM: Double,
        habitat: String,
        descripcion: String,
        imagen: String
    ) {
        self.especie = especie
        self.estadoConservacion = estadoConservacion
        self.nombreCientifico = nombreCientifico
        self.pesoKg = pesoKg
        self.longitudM = longitudM
        self.habitat = habitat
        self.descripcion = descripcion
        self.imagen = imagen
    }
}
