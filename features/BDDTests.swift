import XCTest
@testable import ChallengeApp

final class BDDTests: XCTestCase {

    private var service: TransferService!
    private var source: Account!
    private var destination: Account!
    private var result: (source: Account, destination: Account)?
    private var capturedError: Error?

    override func setUpWithError() throws {
        service = TransferService()
        source = nil
        destination = nil
        result = nil
        capturedError = nil
    }

    override func tearDownWithError() throws {
        service = nil
        source = nil
        destination = nil
        result = nil
        capturedError = nil
    }

    private func given(_ description: String, _ setup: () -> Void) {
        setup()
    }

    private func when(_ description: String, _ action: () throws -> (source: Account, destination: Account)) {
        do {
            result = try action()
            capturedError = nil
        } catch {
            result = nil
            capturedError = error
        }
    }

    private func then(_ description: String, _ assertion: () -> Void) {
        assertion()
    }

    private func cuentaOrigen(saldo: Decimal) -> Account {
        Account(id: "origen-001", owner: "Ana", balance: saldo)
    }

    private func cuentaDestino(saldo: Decimal) -> Account {
        Account(id: "destino-001", owner: "Bruno", balance: saldo)
    }

    func test_escenario_transferenciaExitosa() throws {
        given("una cuenta origen con saldo suficiente y una cuenta destino") {
            source = cuentaOrigen(saldo: 100)
            destination = cuentaDestino(saldo: 20)
        }

        when("transfiero un monto válido de 30") {
            try self.service.transfer(amount: 30, from: self.source, to: self.destination)
        }

        then("la operación no falla") {
            XCTAssertNil(self.capturedError)
            XCTAssertNotNil(self.result)
        }

        then("el origen queda debitado en el monto transferido") {
            XCTAssertEqual(self.result?.source.balance, 70)
        }

        then("el destino queda acreditado en el monto transferido") {
            XCTAssertEqual(self.result?.destination.balance, 50)
        }
    }

    func test_escenario_fondosInsuficientes() throws {
        given("una cuenta origen con saldo menor al monto a transferir") {
            source = cuentaOrigen(saldo: 10)
            destination = cuentaDestino(saldo: 0)
        }

        when("intento transferir 50") {
            try self.service.transfer(amount: 50, from: self.source, to: self.destination)
        }

        then("la operación falla con el error insufficientFunds") {
            XCTAssertEqual(self.capturedError as? WalletError, .insufficientFunds)
        }

        then("no se produce ningún resultado y los saldos originales se conservan") {
            XCTAssertNil(self.result)
            XCTAssertEqual(self.source.balance, 10)
            XCTAssertEqual(self.destination.balance, 0)
        }
    }

    func test_escenario_montoInvalido() throws {
        given("una cuenta origen con saldo suficiente") {
            source = cuentaOrigen(saldo: 100)
            destination = cuentaDestino(saldo: 0)
        }

        when("intento transferir un monto de 0") {
            try self.service.transfer(amount: 0, from: self.source, to: self.destination)
        }

        then("la operación falla con el error invalidAmount") {
            XCTAssertEqual(self.capturedError as? WalletError, .invalidAmount)
        }
    }

    func test_escenario_montoNegativo() throws {
        given("una cuenta origen con saldo suficiente") {
            source = cuentaOrigen(saldo: 100)
            destination = cuentaDestino(saldo: 0)
        }

        when("intento transferir un monto negativo de -5") {
            try self.service.transfer(amount: -5, from: self.source, to: self.destination)
        }

        then("la operación falla con el error invalidAmount") {
            XCTAssertEqual(self.capturedError as? WalletError, .invalidAmount)
        }
    }

    func test_escenario_transferenciaDelSaldoTotal() throws {
        given("una cuenta origen cuyo saldo es exactamente el monto a transferir") {
            source = cuentaOrigen(saldo: 80)
            destination = cuentaDestino(saldo: 15)
        }

        when("transfiero el saldo completo de 80") {
            try self.service.transfer(amount: 80, from: self.source, to: self.destination)
        }

        then("el origen queda en cero") {
            XCTAssertEqual(self.result?.source.balance, 0)
        }

        then("el destino recibe el monto completo") {
            XCTAssertEqual(self.result?.destination.balance, 95)
        }
    }
}
