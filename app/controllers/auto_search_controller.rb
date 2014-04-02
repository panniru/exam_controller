class AutoSearchController < ApplicationController

  autocomplete :course, :name, :full => true

end
