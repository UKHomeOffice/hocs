const govukEleventyPlugin = require('@x-govuk/govuk-eleventy-plugin')

module.exports = function(eleventyConfig) {
  const url = process.env.GITHUB_ACTIONS
      ? 'https://ukhomeoffice.github.io/hocs/'
      : '/';

  const pathPrefix = process.env.GITHUB_ACTIONS
      ? '/hocs/'
      : '/';

  // Register the plugin
  eleventyConfig.addPlugin(govukEleventyPlugin, {
    brandColour: '#8f23b3',
    fontFamily: 'Roboto, system-ui, sans-serif',
    icons: {
      mask: '/assets/logos/ho-mask-icon.svg',
      shortcut: '/assets/logos/ho-favicon.ico',
      touch: '/assets/logos/ho-apple-touch-icon.png'
    },
    opengraphImageUrl: '/assets/logos/ho-opengraph-image.png',
    header: {
      productName: 'DECS Developer Documentation',
      organisationLogo: '<img src="'+pathPrefix+'assets/logos/ho_logo.svg" height="34px" alt="Home Office Logo">',
      organisationName: 'Home Office'
    },
    footer: {
      copyright: {
        text: '© Crown Copyright 2023'
      },
      contentLicence: {
        html: 'Licensed under the <a class="govuk-footer__link" href="https://github.com/x-govuk/govuk-eleventy-plugin/blob/main/LICENSE.txt">MIT Licence</a>, except where otherwise stated'
      },
    },
    pathPrefix,
    url,
    stylesheets: ['/assets/styles/base.css']
  })

  eleventyConfig.addPassthroughCopy('./assets')

  return {
    pathPrefix,
    dataTemplateEngine: 'njk',
    htmlTemplateEngine: 'njk',
    markdownTemplateEngine: 'njk',
    dir: {
      // Use layouts from the plugin
      layouts: 'node_modules/@x-govuk/govuk-eleventy-plugin/layouts'
    }
  }
};
