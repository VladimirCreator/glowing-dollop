import ProjectDescription

let project: Project = .init(
	name: "Glowing Dollop",
	options: .init(xcodeProjectName: "glowing-dollop"),
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
			productName: "Glowing Dollop",
			bundleId: "com.vladimircreator.glowing-dollop",
			infoPlist: "Sources/GlowingDollop/Configuration/Info.plist",
			sources: ["Sources/GlowingDollop/Sources/**"],
			resources: ["Sources/GlowingDollop/Resources/**"],
			dependences: [
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
			productName: "Glowing Dollop Tests",
			bundleId: "com.vladimircreator.glowing-dollop-tests",
			sources: ["Tests/GlowingDollopTests/**"],
			dependences: [
				.target(name: "GlowingDollop")
			]
		),
		.target(
			name: "GlowingDollopUITests",
			destinations: [
				.iPhone
			],
			product: .uiTests,
			productName: "Glowing Dollop UI Tests",
			bundleId: "com.vladimircreator.glowing-dollop-ui-tests",
			sources: ["Tests/GlowingDollopUITests/**"],
			dependences: [
				.target(name: "GlowingDollop")
			]
		)
	]
)
