require 'publishing_api_presenters/edition.rb'
require 'publishing_api_presenters/case_study.rb'
require 'publishing_api_presenters/placeholder.rb'

module PublishingApiPresenters
  def self.presenter_for(model, options={})
    presenter_class_for(model).new(model, options)
  end

  def self.publish_intent_for(model)
    PublishingApiPresenters::PublishIntent.new(model)
  end

  def self.coming_soon_for(model)
    PublishingApiPresenters::ComingSoon.new(model)
  end

  def self.presenter_class_for(model)
    if model.is_a?(::CaseStudy)
      PublishingApiPresenters::CaseStudy
    elsif model.is_a?(::Edition)
      PublishingApiPresenters::Edition
    else
      PublishingApiPresenters::Placeholder
    end
  end
end
