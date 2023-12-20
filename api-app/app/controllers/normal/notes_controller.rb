class Normal::NotesController < NotesController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
