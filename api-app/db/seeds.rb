# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User
User.create(email: 'webmaster@example.com', uid: 'webmaster@example.com',password: 'password',nickname: 'ウェブマスタ')
User.create(email: 'operator@example.com', uid: 'operator@example.com',password: 'password',nickname: 'オペレータ')

#admin
Admin.create(email: 'webmaster@example.com', uid: 'webmaster@example.com',password: 'password',nickname: 'ウェブマスタ')

# Role
Role.create(name: 'admin')
Role.create(name: 'operator')
Role.create(name: 'user')

# User-Role
UserRole.create(user_id:1, role_id:1)
UserRole.create(user_id:2, role_id:2)
# UserRole.create(user_id:3, role_id:3)
# UserRole.create(user_id:4, role_id:3)
# UserRole.create(user_id:5, role_id:3)

# #Board
# Board.create(user_id: 1,title: 'フリートーク', detail: "フリートーク\n\nなんでもいいから書いてね。\n")
# Board.create(user_id: 1,title: 'BOARD02', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD03', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD04', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD05', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD06', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD07', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD08', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD09', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD10', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD11', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD12', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD13', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD14', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD15', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD16', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD17', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD18', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD19', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD20', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD21', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD22', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD23', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD24', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD25', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD26', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD27', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD28', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD29', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD30', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD31', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD32', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD33', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD34', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD35', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD36', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD37', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD38', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD39', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD40', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD41', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")
# Board.create(user_id: 1,title: 'BOARD42', detail: "BOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\nBOARDBOARDBOARDBOARDBOARDBOARDBOARD\n")

# #BoardComment
# BoardComment.create(user_id: 1,board_id: 1, title: 'BOARD001 Comment01', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 3,board_id: 1, title: 'BOARD001 Comment02', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 4,board_id: 1, title: 'BOARD001 Comment03', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment03', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 1,board_id: 1, title: 'BOARD001 Comment04', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 3,board_id: 1, title: 'BOARD001 Comment05', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 4,board_id: 1, title: 'BOARD001 Comment06', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment07', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment06', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment08', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment10', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 3,board_id: 1, title: 'BOARD001 Comment11', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 3,board_id: 1, title: 'BOARD001 Comment12', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 4,board_id: 1, title: 'BOARD001 Comment13', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment13', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 1,board_id: 1, title: 'BOARD001 Comment14', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 3,board_id: 1, title: 'BOARD001 Comment15', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 4,board_id: 1, title: 'BOARD001 Comment16', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment17', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment16', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment18', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment20', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")
# BoardComment.create(user_id: 5,board_id: 1, title: 'BOARD001 Comment21', detail: "DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL\nDETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01DETAIL01\n")

# # Note
# Note.create(user_id: 1,title: '運営日誌', overview: "運営に関する日々のあれこれを書き綴るノートです。", detail: "なんでも書いてください。")
# Note.create(user_id: 1,title: 'NOTE02', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE03', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE04', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE05', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE06', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE07', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE08', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE09', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE10', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE11', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE12', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE13', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE14', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE15', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE16', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE17', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE18', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE19', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE20', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE21', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE22', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE23', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE24', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE25', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE26', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE27', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE28', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE29', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE30', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")
# Note.create(user_id: 1,title: 'NOTE31', overview: "ORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\nORVERVIEWORVERVIEWORVERVIEWORVERVIEW\n", detail: "DETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\nDETAILDETAILDETAILDETAILDETAILDETAILDETAIL\n")

# # Page
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-01', overview: "ORVERVIEW01", detail: "DETAIL01")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-02', overview: "ORVERVIEW02", detail: "DETAIL02")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-03', overview: "ORVERVIEW03", detail: "DETAIL03")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-04', overview: "ORVERVIEW04", detail: "DETAIL04")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-05', overview: "ORVERVIEW05", detail: "DETAIL05")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-06', overview: "ORVERVIEW06", detail: "DETAIL06")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-07', overview: "ORVERVIEW07", detail: "DETAIL07")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-08', overview: "ORVERVIEW08", detail: "DETAIL08")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-09', overview: "ORVERVIEW09", detail: "DETAIL09")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-10', overview: "ORVERVIEW10", detail: "DETAIL10")
# Page.create(user_id: 3,note_id: 1,title: 'TITLE001-11', overview: "ORVERVIEW11", detail: "DETAIL11")
