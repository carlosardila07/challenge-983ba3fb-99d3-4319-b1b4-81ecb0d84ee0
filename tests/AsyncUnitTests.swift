import XCTest
@testable import ChallengeApp

/// FASE 2 — Pruebas Unitarias asíncronas (TRABAJO DEL CANDIDATO)
///
/// Objetivo: probar funcionalidades `async` de `AccountDataSource` /
/// `InMemoryAccountRepository` usando `async`/`await`.
///
/// Ideas de casos (NO implementados a propósito):
///  - `fetchAccount(id:)` devuelve la cuenta esperada (camino feliz).
///  - `fetchAccount(id:)` lanza `accountNotFound` para un id inexistente.
///  - `fetchTransactions(accountId:)` devuelve los movimientos esperados.
///
/// Pistas:
///  - Marca el método de prueba como `async throws` y usa `await`.
///  - Para verificar errores asíncronos puedes usar `do/catch` + `XCTFail`,
///    o `await XCTAssertThrowsError(try await ...)` según tu versión.
final class AsyncUnitTests: XCTestCase {

    func test_smoke_repositorioAsyncArranca() async throws {
        let repo = InMemoryAccountRepository(
            accounts: [Account(id: "1", owner: "Ada", balance: 100)]
        )
        let account = try await repo.fetchAccount(id: "1")
        XCTAssertEqual(account.owner, "Ada")
    }

    // TODO (Fase 2): fetchAccount con id inexistente -> accountNotFound.
    func test_fetchAccount_noEncontrada() async throws {
        throw XCTSkip("Pendiente: implementar prueba asíncrona (Fase 2).")
    }

    // TODO (Fase 2): fetchTransactions camino feliz y error.
    func test_fetchTransactions_casos() async throws {
        throw XCTSkip("Pendiente: implementar prueba asíncrona (Fase 2).")
    }
}
