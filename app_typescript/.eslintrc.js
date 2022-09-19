module.exports = {
  env: {
    node: true,
    jest: true,
  },
  parser: '@typescript-eslint/parser',
  plugins: [
    '@typescript-eslint',
  ],
  extends: [
    "eslint:recommended",
  ],
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      "extends": [
        "plugin:@typescript-eslint/recommended",
      ],
      parserOptions: {
        project: ['./tsconfig.json', './tests/tsconfig.json'],
      },
    },
  ],
  rules: {
    "semi": ["error", "always"],
    "indent": ["error", 2],
    "object-curly-spacing": ["error", "always"],
    "comma-dangle": ["error", "always-multiline"],
    "eol-last": ["error", "always"],
  },
};
