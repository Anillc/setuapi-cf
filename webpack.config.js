module.exports = {
	target: "webworker",
	entry: './src/index.coffee',
	mode: "production",
	module: {
		rules: [
			{
				test: /\.coffee$/,
				use: 'coffee-loader'
			}
		]
	}
}