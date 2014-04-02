CodeCache::Application.routes.draw do
  get '/', to: redirect('/snippets')

  scope '/s' do
    get '/' => 'snippets#index', :as => :snippets
    get '/:uuid' => 'snippets#edit', :as => :snippet
    post '/:uuid' => 'snippets#update', :as => :edit_snippet, :defaults => { :format => 'json' }
    post '/' => 'snippets#create', :as => :new_snippet, :defaults => { :format => 'json' }
  end
end
