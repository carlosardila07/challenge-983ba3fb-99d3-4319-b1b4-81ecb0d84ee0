import XCTest
@testable import ChallengeApp

/// FASE 2 — Pruebas Unitarias síncronas (TRABAJO DEL CANDIDATO)
///
/// Objetivo: validar en aislamiento la lógica de `TransferService` y
/// `StatementAnalyzer`. Las pruebas deben ser rápidas, deterministas y
/// enfocadas en una sola cosa (Arrange / Act / Assert).
///
/// Ideas de casos (NO implementados a propósito):
///  - `validate(amount:)` lanza `invalidAmount` con 0 y negativos.
///  - `transfer(...)` ajusta saldos correctamente en el camino feliz.
///  - `transfer(...)` lanza `insufficientFunds` cuando no alcanza el saldo.
///  - `StatementAnalyzer.total(of:in:)` suma solo el tipo indicado.
///  - `StatementAnalyzer.duplicateTransactionIDs(in:)` detecta duplicados.
final class UnitTests: XCTestCase {

    func test_smoke_statementAnalyzerArranca() {
        let analyzer = StatementAnalyzer()
        XCTAssertEqual(analyzer.total(of: .deposit, in: []), 0)
    }

    // TODO (Fase 2): probar validación de montos inválidos.
    func test_validate_montoInvalido() throws {
        throw XCTSkip("Pendiente: implementar prueba unitaria (Fase 2).")
    }

    // TODO (Fase 2): probar transferencia exitosa y por fondos insuficientes.
    func test_transfer_casos() throws {
        throw XCTSkip("Pendiente: implementar prueba unitaria (Fase 2).")
    }
}
