import { govukEleventyPlugin } from "@x-govuk/govuk-eleventy-plugin";
import fs from "node:fs/promises";

export default async function(eleventyConfig) {
  const url = process.env.GITHUB_ACTIONS
      ? 'https://ukhomeoffice.github.io/hocs/'
      : '/';

  const pathPrefix = process.env.GITHUB_ACTIONS
      ? '/hocs/'
      : '/';

  // Inline logo SVG, allowing the logo elements to be targeted by CSS style rules.
  // This is so that the purple vertical line can be switched to black when the header link has focus.
  const svgContents = await fs.readFile('assets/logos/ho_logo.svg', 'utf8');
  const logoSvg = svgContents.replace('<?xml version="1.0" encoding="UTF-8"?>\n<svg ', '<svg height="34" aria-label="Home Office logo"');


  // Register the plugin
  eleventyConfig.addPlugin(govukEleventyPlugin, {
    icons: {
      mask: '/assets/logos/ho-mask-icon.svg',
      shortcut: '/assets/logos/ho-favicon.ico',
      touch: '/assets/logos/ho-apple-touch-icon.png'
    },
    opengraphImageUrl: '/assets/logos/ho-opengraph-image.png',
    header: {
      logotype: {
        html:
            '<span class="govuk-header__logotype">' +
            logoSvg +
            '  <span class="govuk-header__logotype-text">Home Office</span>' +
            '</span>'
      },
      productName: 'DECS Developer Documentation',
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
    markdownTemplateEngine: 'njk'
  }
};
