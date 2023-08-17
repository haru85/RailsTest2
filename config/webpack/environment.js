const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jQuery/src/jquery',
        jQuery: 'jQuery/src/jquery'
    })
)

module.exports = environment
