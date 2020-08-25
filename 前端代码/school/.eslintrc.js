// https://eslint.org/docs/user-guide/configuring

module.exports = {
    root: true,
    parserOptions: {
        parser: 'babel-eslint'
    },
    env: {
        browser: true,
    },
    extends: [
        // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
        // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
        'plugin:vue/essential',
        // https://github.com/standard/standard/blob/master/docs/RULES-en.md
        'standard'
    ],
    // required to lint *.vue files
    plugins: [
        'vue'
    ],
    // add your custom rules here
    rules: {
        'quotes': ['error', 'single'],
        'generator-star-spacing': 0,
        "indent": [2, 2, { "SwitchCase": 1 }],
        "eol-last": 0,
        "curly": [2, "all"],
        "space-before-function-paren": [0, "always"],
        "eqeqeq": 0,
        "no-eval": 0,
        "semi": [2, "always"],
        "no-irregular-whitespace": 0,
        "vue/no-parsing-error": [2, { "x-invalid-end-tag": false }],
        "no-extra-parens": 0,
        "curly": 0,
        "no-multiple-empty-lines": [2, { "max": 3 }],
        // allow async-await
        // 'generator-star-spacing': 'off',
        // allow debugger during development
        'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off'
    },
    'globals': {
        "eval": true,
        "jQuery": true,
        "$": true
    }
}