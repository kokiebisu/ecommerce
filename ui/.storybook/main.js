const path = require("path");

module.exports = {
  stories: ["../src/**/index.stories.tsx"],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-interactions",
  ],
  framework: "@storybook/react",
  core: {
    builder: "@storybook/builder-webpack5",
  },
  webpackFinal: (config) => {
    config.module.rules.push({
      test: /\.(ts|js|tsx|jsx)$/,
      exclude: /node_modules/,
      use: [
        {
          loader: require.resolve("@linaria/webpack-loader"),
          options: {
            sourceMap: process.env.NODE_ENV !== "production",
            extension: ".css",
            babelOptions: {
              configFile: path.resolve(__dirname, "../.babelrc"),
            },
          },
        },
      ],
    });
    return config;
  },
};
