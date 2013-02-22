FactoryGirl.define do
  sequence :name do |n|
    "Foo bar #{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :uid do |n|
    "#{n}"
  end

  sequence :permalink do |n|
    "foo_page_#{n}"
  end

  factory :user, :class => Catarse::User do |f|
    f.provider "twitter"
    f.uid { generate(:uid) }
    f.name "Foo bar"
    f.email { generate(:email) }
    f.bio "This is Foo bar's biography."
  end

  factory :category, :class => Catarse::Category do |f|
    f.name_pt { generate(:name) }
  end

  factory :project, :class => Catarse::Project do |f|
    f.name "Foo bar"
    f.permalink { generate(:permalink) }
    f.association :user, :factory => :user
    f.association :category, :factory => :category
    f.about "Foo bar"
    f.headline "Foo bar"
    f.goal 10000
    f.online_days 5
    f.how_know 'Lorem ipsum'
    f.more_links 'Ipsum dolor'
    f.first_backers 'Foo bar'
    f.expires_at { 1.month.from_now }
    f.video_url 'http://vimeo.com/17298435'
  end

  factory :notification_type, :class => Catarse::NotificationType do |f|
    f.name "confirm_backer"
  end

  factory :unsubscribe, :class => Catarse::Unsubscribe do |f|
    f.association :user, :factory => :user
    f.association :project, :factory => :project
    f.association :notification_type, :factory => :notification_type
  end

  factory :notification, :class => Catarse::Notification do |f|
    f.association :user, :factory => :user
    f.association :backer, :factory => :backer
    f.association :project, :factory => :project
    f.association :notification_type, :factory => :notification_type
  end

  factory :reward, :class => Catarse::Reward do |f|
    f.association :project, :factory => :project
    f.minimum_value 1.00
    f.description "Foo bar"
  end

  factory :backer, :class => Catarse::Backer do |f|
    f.association :project, :factory => :project
    f.association :user, :factory => :user
    f.confirmed true
    f.confirmed_at Time.now
    f.value 10.00
  end

  factory :payment_notification, :class => Catarse::PaymentNotification do |f|
    f.association :backer, :factory => :backer
    f.extra_data {}
  end

  factory :oauth_provider, :class => Catarse::OauthProvider do |f|
    f.name 'GitHub'
    f.strategy 'GitHub'
    f.path 'github'
    f.key 'test_key'
    f.secret 'test_secret'
  end

  factory :configuration, :class => Catarse::Configuration do |f|
    f.name 'Foo'
    f.value 'Bar'
  end

  factory :update, :class => Catarse::Update do |f|
    f.association :project, :factory => :project
    f.association :user, :factory => :user
    f.title "My title"
    f.comment "This is a comment"
    f.comment_html "<p>This is a comment</p>"
  end
end
