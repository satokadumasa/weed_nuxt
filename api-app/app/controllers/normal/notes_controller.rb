class Normal::NotesController < NotesController
  before_action :authenticate_user!
end
