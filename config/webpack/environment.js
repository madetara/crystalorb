const { environment } = require('@rails/webpacker')
const typescript =  require('./loaders/typescript')
const svelte = require('./loaders/svelte')

environment.loaders.prepend('svelte', svelte)
environment.loaders.prepend('typescript', typescript)
module.exports = environment
