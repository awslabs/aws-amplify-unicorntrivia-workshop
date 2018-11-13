const webpack = require('webpack');

module.exports = {
	entry: './src/index.js',
	module: {
		rules: [{
			test: /\.(js|jsx)$/,
			exclude: /node_modules/,
			use: ['babel-loader']
		},{
			test: /\.sass$/,
			use: [
				"style-loader", // creates style nodes from JS strings
                "css-loader", // translates CSS into CommonJS
                "sass-loader" // compiles Sass to CSS, using Node Sass by default
            ]
		},{
			test: /\.(png|jpg|gif|svg)$/,
        	use: [{
            	loader: 'file-loader',
            	options: {
					outputPath: "images"
            	},
          	}]
		}]
  	},
	resolve: {
		extensions: ['*', '.js', '.jsx']
	},
	output: {
		path: __dirname + '/dist',
		publicPath: '/',
		filename: 'bundle.js'
	},
	plugins: [
		new webpack.HotModuleReplacementPlugin()	
	],
	devServer: {
		contentBase: './dist',
		hot: true
	}
};
