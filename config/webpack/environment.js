const { environment } = require("@rails/webpacker");
const Webpack = require("webpack");

environment.loaders.append("jquery", {
  test: require.resolve("jquery"),
  loader: "expose-loader",
  options: {
    exposes: {
      globalName: "$",
      override: true,
    },
  }
});

module.exports = environment
