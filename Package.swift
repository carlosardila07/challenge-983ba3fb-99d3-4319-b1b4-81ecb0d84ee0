// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ChallengeApp",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ChallengeApp",
            targets: ["ChallengeApp"]
        )
    ],
    targets: [
        // Código de dominio bajo prueba (la "app").
        .target(
            name: "ChallengeApp",
            path: "Sources/ChallengeApp"
        ),

        // Fase 1 — Pruebas funcionales con BDD (Given/When/Then).
        .testTarget(
            name: "BDDTests",
            dependencies: ["ChallengeApp"],
            path: "features"
        ),

        // Fase 2 — Pruebas unitarias (síncronas y asíncronas).
        .testTarget(
            name: "UnitTests",
            dependencies: ["ChallengeApp"],
            path: "tests"
        )
    ]
)
