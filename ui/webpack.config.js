const path = require("path");
const dotenv = require("dotenv");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const { DefinePlugin } = require("webpack");

const dev = process.env.NODE_ENV !== "production";

module.exports = () => {
  const env = dotenv.config().parsed;

  const envKeys = Object.keys(env).reduce((acc, cur) => {
    acc[`process.env.${cur}`] = JSON.stringify(env[cur]);
    return acc;
  }, {});

  return {
    entry: "./src/index.tsx",
    target: "web",
    mode: "development",
    resolve: {
      modules: ["node_modules"],
    },
    module: {
      rules: [
        {
          test: /\.(ts|tsx)$/,
          exclude: /node_modules/,
          use: [
            { loader: "babel-loader" },
            {
              loader: "@linaria/webpack-loader",
              options: { sourceMap: dev },
            },
          ],
        },
        {
          test: /\.css$/,
          use: ["style-loader", "css-loader"],
        },
        {
          test: /\.(svg)$/,
          use: [
            {
              loader: "svg-url-loader",
              options: {
                limit: 10000,
              },
            },
          ],
        },
        {
          test: /\.(woff(2)?|ttf|eot)(\?v=\d+\.\d+\.\d+)?$/,
          type: "asset/resource",
        },
      ],
    },
    resolve: {
      extensions: [".tsx", ".ts", ".js"],
    },
    output: {
      filename: "index.bundle.js",
      path: path.resolve(__dirname + "/dist"),
    },
    devServer: {
      port: 3000,
      open: true,
      hot: true,
      static: path.resolve(__dirname, "src/assets"),
    },
    plugins: [
      new HtmlWebpackPlugin({
        template: path.resolve(__dirname, "public", "index.html"),
      }),
      new MiniCssExtractPlugin({
        filename: "styles.css",
      }),
      new DefinePlugin(envKeys),
    ],
  };
};
