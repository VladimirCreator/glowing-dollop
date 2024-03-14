// swift-tools-version:5.7
import PackageDescription

let package: Package = .init(
	name: "glowing-dollop",
	//defaultLocalization,: "en",
	platforms: [
		.iOS(.v16), .macOS(v13)
	],
	products: [
		.library(
			name: "GlowingDollopKit",
			targets: [
				"GlowingDollopKit"
			]
		)
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "GlowingDollopKit",
			exclude: [
				"Resources/CHRONICLES.md"
			]
		),
		.testTarget(
			name: "GlowingDollopKitTests",
			dependencies: [
				"GlowingDollopKit"
			]
		),
		.testTarget(
			name: "GlowingDollopKitUITests",
			dependencies: [
				"GlowingDollopKit"
			]
		)
	]
)
