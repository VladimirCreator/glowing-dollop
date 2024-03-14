import ProjectDescription

let project: Project = .init(
	name: "Glowing Dollop",
	options: .options (xcodeProjectName: "glowing-dollop"),
	packages: [
		.package(path: ".")
	],
	targets: [
		.target(
			name: "GlowingDollop",
			destinations: [
				.iPhone
			],
			product: .app,
			productName: "GlowingDollop",
			bundleId: "com.vladimircreator.glowing-dollop",
			infoPlist: "Sources/GlowingDollop/Configuration/Info.plist",
			sources: ["Sources/GlowingDollop/Sources/**"],
			resources: ["Sources/GlowingDollop/Resources/**"],
			dependencies: [
				.package(product: "GlowingDollopKit")
			],
			settings: .settings(
				configurations: [
					.debug(name: .debug, xcconfig: .path("Sources/GlowingDollop/Configuration/Debug.xcconfig")),
					.release(name: .release, xcconfig: .path("Sources/GlowingDollop/Configuration/Release.xcconfig"))
				]
			)
		),
		.target(
			name: "GlowingDollopTests",
			destinations: [
				.iPhone
			],
			product: .unitTests,
			productName: "GlowingDollopTests",
			bundleId: "com.vladimircreator.glowing-dollop-tests",
			sources: ["Tests/GlowingDollopTests/**"],
			dependencies: [
				.target(name: "GlowingDollop")
			]
		),
		.target(
			name: "GlowingDollopUITests",
			destinations: [
				.iPhone
			],
			product: .uiTests,
			productName: "GlowingDollopUITests",
			bundleId: "com.vladimircreator.glowing-dollop-ui-tests",
			sources: ["Tests/GlowingDollopUITests/**"],
			dependencies: [
				.target(name: "GlowingDollop")
			]
		)
	]
)
