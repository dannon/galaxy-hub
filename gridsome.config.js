// This is where project configuration and plugin options are located.
// Learn more: https://gridsome.org/docs/config

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

module.exports = {
    siteName: "Galaxy Community Hub",
    plugins: [
        {
            use: '@gridsome/source-filesystem',
            options: {
              path: './src/content/**/*.md',
              typeName: 'Default',
              remark: {
                // remark options
              }
            }
          }
        ],
        transformers: {
          remark: {
            // global remark options
          }
        }
};
