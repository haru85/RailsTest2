# README

お手数をおかけしますが、JQuery設定のため、
下記ファイルの上書きをお願い致します。
（Webpackerのインストール時にJQueryの設定が消去されてしまうようです）

* JQueryの読み込み設定（environment.jsの編集）
config/webpack/environment.jsを開き

__変更前__
const { environment } = require('@rails/webpacker')

module.exports = environment

__↓変更後__
const { environment } = require('@rails/webpacker')

/* ここから追記 */
const webpack = require('webpack')

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jQuery/src/jquery',
        jQuery: 'jQuery/src/jquery'
    })
)

/* 追記ここまで */

module.exports = environment
