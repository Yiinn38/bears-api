import Fluent
import Vapor

struct BearController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let bears = routes.grouped("bear")
        bears.get(use: index)
        bears.post(use: create)
        bears.group(":bearID") { bear in
            bear.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Bear]> {
        Bear.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Bear> {
        let bear = try req.content.decode(Bear.self)
        return bear.save(on: req.db).map { bear }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Bear.find(req.parameters.get("bearID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
