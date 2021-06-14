class StaticPagesController < ApplicationController
  def home
  end
  
  def log
  end

  def sql
  end

  def technology_summary
    @technology_summary = TechnologySummarizer.new.summarize
  end
end
