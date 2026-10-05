import XCTest
@testable import ChallengeApp

/// FASE 1 — Pruebas Funcionales con BDD (TRABAJO DEL CANDIDATO)
///
/// Objetivo: cubrir las funcionalidades clave con escenarios en estilo
/// Given / When / Then (Dado / Cuando / Entonces), legibles para negocio.
///
/// Sugerencias de escenarios a cubrir (NO están implementados a propósito):
///  - Dado un saldo suficiente, Cuando transfiero un monto válido,
///    Entonces el origen se debita y el destino se acredita.
///  - Dado un saldo insuficiente, Cuando intento transferir,
///    Entonces la operación falla con `insufficientFunds`.
///  - Dado un monto inválido (cero o negativo), Cuando valido,
///    Entonces falla con `invalidAmount`.
///
/// Puedes estructurar cada escenario con closures o helpers `given/when/then`,
/// o integrar una librería BDD (p. ej. Quick/Nimble) si lo prefieres.
final class BDDTests: XCTestCase {

    // Prueba de humo: confirma que el target de pruebas compila y enlaza con
    // ChallengeApp. Reemplázala/complétala con tus escenarios BDD.
    func test_smoke_elTargetDePruebasArranca() {
        let service = TransferService()
        XCTAssertNotNil(service)
    }

    // TODO (Fase 1): Dado un saldo suficiente, Cuando transfiero, Entonces...
    func test_escenario_transferenciaExitosa() throws {
        throw XCTSkip("Pendiente: implementar escenario BDD (Fase 1).")
    }

    // TODO (Fase 1): Dado un saldo insuficiente, Cuando transfiero, Entonces...
    func test_escenario_fondosInsuficientes() throws {
        throw XCTSkip("Pendiente: implementar escenario BDD (Fase 1).")
    }
}
