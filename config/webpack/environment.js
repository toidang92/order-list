const { environment } = require("@rails/webpacker")
const Webpack = require("webpack")

environment.loaders.append("jQuery", {
  test: require.resolve("jQuery"),
  use: [
    {
      loader: "expose-loader",
      options: "$",
    },
  ],
})

module.exports = environment
