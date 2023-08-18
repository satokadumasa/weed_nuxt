class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    pp "current_user:" << current_user.inspect
    board_ids = BoardBookmark.where(user_id: current_user.id).joins(:board).order(comment_added_at: :desc).page(1).per(5).pluck(:board_id)
    boards = Board.where(id: board_ids).eager_load(:user).order(comment_added_at: :desc)
    @boards = boards.as_json(:include => :user)
    note_ids = NoteBookmark.where(user_id: current_user.id).joins(:note).order(page_added_at: :desc).page(1).per(5).pluck(:note_id)
    notes = Note.where(id: note_ids).eager_load(:user).order(page_added_at: :desc)
    @notes = notes.as_json(:include => :user)
    render json: {boards: @boards, notes: @notes}
  end
end
