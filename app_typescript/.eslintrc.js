module.exports = {
  env: {
    node: true,
  },
  parser: '@typescript-eslint/parser',
  plugins: [
    '@typescript-eslint',
  ],
  "extends": [
    "eslint:recommended",
  ],
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      "extends": [
        "plugin:@typescript-eslint/recommended",
      ],
      parserOptions: {
        project: './app_typescript/tsconfig.json',
      },
    },
  ],
  rules: {
    "indent": ["error", 2],
    "object-curly-spacing": ["error", "always"],
    "comma-dangle": ["error", "always-multiline"],
  },
};
