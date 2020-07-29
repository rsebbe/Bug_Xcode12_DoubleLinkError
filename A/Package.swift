// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension Target {
	static func stub(for target: String) -> Target {
		return .target(
			name: target + "-stub",
			dependencies: [Target.Dependency.target(name: target)],
			path: "Sources/Misc",
			//sources: ["stub.c"],
			sources: ["stub.swift"]//,
//			sources: ["stub.swift"]
//			publicHeadersPath: "Sources/"+target, //"." // to silence include/ not existing (there is no public header)
//			linkerSettings: [ .linkedFramework("Foundation") ]
		)
	}
}
extension Product {
	static func stub(for target: String) -> Product {
		return .library(
			name: target + "-stub",
			type: .dynamic,
			targets: [target + "-stub"])
	}
}

let package = Package(
    name: "A",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "A",
            targets: ["A"]),
		.stub(for: "A"),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "A",
            dependencies: []),
		.stub(for: "A"),
        .testTarget(
            name: "ATests",
            dependencies: ["A"]),
    ]
)
