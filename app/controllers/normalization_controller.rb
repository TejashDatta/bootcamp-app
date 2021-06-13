class NormalizationController < ApplicationController
  def show
    @unnormalized_site_visitors = UnnormalizedSiteVisitor.all
    @site_visitors = SiteVisitor.all
    @browsers = Browser.all
    @platforms = Platform.all
    @browser_compatibilities = BrowserCompatibility.all
  end
end
