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
    fontFamily: 'system-ui, sans-serif',
    header: {
      productName: 'DECS Developer Documentation',
      organisationLogo: null,
      organisationName: 'Home Office'
    },
    footer: {
      copyright: {
        text: '© Crown Copyright'
      },
      contentLicence: {
        html: 'Licensed under the <a class="govuk-footer__link" href="https://github.com/x-govuk/govuk-eleventy-plugin/blob/main/LICENSE.txt">MIT Licence</a>, except where otherwise stated'
      },
    },
    pathPrefix,
    url,
  })

  eleventyConfig.addPassthroughCopy('./assets')

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
