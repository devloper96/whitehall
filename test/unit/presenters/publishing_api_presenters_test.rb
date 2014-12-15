require 'test_helper'

class PublishingApiPresentersTest < ActiveSupport::TestCase
  test ".presenter_for returns a presenter for a case study" do
    case_study = CaseStudy.new
    presenter  = PublishingApiPresenters.presenter_for(case_study)

    assert_equal PublishingApiPresenters::CaseStudy, presenter.class
    assert_equal case_study, presenter.edition
  end

  test ".presenter_for returns a generic Edition presenter for non-case studies" do
    assert_equal PublishingApiPresenters::Edition,
      PublishingApiPresenters.presenter_for(GenericEdition.new).class

    assert_equal PublishingApiPresenters::Edition,
      PublishingApiPresenters.presenter_for(NewsArticle.new).class
  end

  test ".presenter_for returns a Placeholder presenter for an organisation" do
    organisation = Organisation.new
    presenter  = PublishingApiPresenters.presenter_for(organisation)

    assert_equal PublishingApiPresenters::Placeholder, presenter.class
    assert_equal organisation, presenter.item
  end

  test ".presenter_for returns a Placeholder presenter for a world location" do
    world_location = WorldLocation.new
    presenter  = PublishingApiPresenters.presenter_for(world_location)

    assert_equal PublishingApiPresenters::Placeholder, presenter.class
    assert_equal world_location, presenter.item
  end

  test ".publish_intent_for returns a PublishIntent presenter" do
    case_study = CaseStudy.new
    presenter = PublishingApiPresenters.publish_intent_for(case_study)

    assert_equal PublishingApiPresenters::PublishIntent, presenter.class
    assert_equal case_study, presenter.item
  end

  test ".coming_soon_for returns a Coming Soon presenter" do
    case_study = CaseStudy.new
    presenter = PublishingApiPresenters.coming_soon_for(case_study)

    assert_equal PublishingApiPresenters::ComingSoon, presenter.class
    assert_equal case_study, presenter.edition
  end


end
