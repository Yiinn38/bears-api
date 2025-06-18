import Fluent

struct CreateBear: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("bears")
            .id()
            .field("especie", .string, .required)
            .field("estado_conservacion", .string, .required)
            .field("nombre_cientifico", .string, .required)
            .field("peso_kg", .int, .required)
            .field("longitud_m", .double, .required)
            .field("habitat", .string, .required)
            .field("descripcion", .string, .required)
            .field("imagen", .string, .required)
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("bears").delete()
    }
}
