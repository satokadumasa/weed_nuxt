class Administrator::NotesController < NotesController
  before_action :authenticate_admin!
end
