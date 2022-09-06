const govukEleventyPlugin = require('govuk-eleventy-plugin')

module.exports = function(eleventyConfig) {
  const url = process.env.GITHUB_ACTIONS
      ? 'https://ukhomeoffice.github.io/hocs/'
      : '/';

  const pathPrefix = process.env.GITHUB_ACTIONS
      ? '/hocs/'
      : '/';

  // Register the plugin
  eleventyConfig.addPlugin(govukEleventyPlugin, {
    header: {
      productName: 'DECS Documentation',
    },
    pathPrefix,
    url,
  })

  return {
    pathPrefix,
    dataTemplateEngine: 'njk',
    htmlTemplateEngine: 'njk',
    markdownTemplateEngine: 'njk',
    dir: {
      // Use layouts from the plugin
      layouts: 'node_modules/govuk-eleventy-plugin/layouts'
    }
  }
};
