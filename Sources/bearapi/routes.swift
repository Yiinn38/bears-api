import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "🐻 Bienvenido a la API de osos"
    }

    try app.register(collection: BearController())
}
