// Server API makes it possible to hook into various parts of Gridsome
// on server-side and add custom data to the GraphQL data layer.
// Learn more: https://gridsome.org/docs/server-api/

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

module.exports = function(api) {
    api.createPages(async ({ graphql, createPage }) => {
        const { data } = await graphql(`
            {
                allDefault {
                    edges {
                        node {
                            id
                            path
                            content
                        }
                    }
                }
            }
        `);

        data.allDefault.edges.forEach(({ node }) => {
            createPage({
                // Strip /src/content out of the path.
                path: `${node.path.slice(12)}`,
                component: "./src/templates/Default.vue",
                context: {
                   title: node.title,
                   content: node.content
                }
            });
        });
    });
};
