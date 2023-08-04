export const state = () => ({
    boards: [],
    board: {},
    board_comments: {},
    max_page: 0,
});
export const mutations = {
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_BOARDS(state, payLoad) {
    state.boards = payLoad;
  },
  /**
   * 
   * @param {*} state 
   * @param {*} payLoad 
   */
  SET_BOARD_COMMENTS(state, payLoad) {
    state.board_comments = payLoad;
  },
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_BOARD(state, payLoad) {
    state.board = payLoad;
  },
  /**
   * 
   * @param {*} state 
   * @param {*} payLoad 
   */
  SET_MAX_PAGE(state, payLoad) {
    state.max_page = payLoad;
  },
  /**
   * 
   * @param {*} state 
   * @param {*} payLoad 
   */
  SET_COUNT(state, payLoad) {
    state.count = payLoad;
  },
};
export const getters = {
  boards: (state) => {
      return state.boards;
  },
  board_comments: (state) => {
    return state.board_comments;
  },
  board: (state) => {
    return state.board;
  },
  max_page: (state) => {
    return state.max_page;
  },
  count: (state) => {
    return state.count;
  },
};
export const actions = {
    /**
     *
     * @param {*} param0
     * @param {*} params
     */
    asyncBoards({ commit }, params) {
      console.log("asyncBoards() params:" + JSON.stringify(params));
      let searchData = "";
      _.each(params, (value, key) => {
        console.log("asyncBoards() key[" + key + "] value[" + value + "]");
        if (key != "page" && value != undefined && value != "") {
          if(value != '') {
            searchData += `&${key}=${value}`;
          }
        }
      });
      console.log("asyncBoards() searchData:" + searchData);
      return this.$axios
        .$get("/boards/?page=" + params.page + searchData)
        .then((response) => {
          commit("SET_BOARDS", response.boards);
          commit("SET_MAX_PAGE", response.max_page);
          commit("SET_COUNT", response.count);
          return response;
        });
    },
    asyncBoard({ commit }, params) {
      console.log("asyncBoard() params:" + params);
      return this.$axios
        .$get("/boards/" + params.id)
        .then((response) => {
          console.log("asyncBoard() board:" + JSON.stringify(response));
          commit("SET_BOARD", response.board);
          commit("SET_BOARD_COMMENTS", response.board_comments);
          return response;
        });
    },
    /**
     * 
     * @param {*} param0 
     * @param {*} params 
     * @returns 
     */
    asyncBoardCreate({ commit }, params) {
      console.log("asyncBoardCreate() params:" + JSON.stringify(params));
      return this.$axios
        .$post("/boards/", params)
        .then((response) => {
          commit("SET_BOARDS", response.boards);
          return response;
        });
    },
    asyncBoardUpdate({ commit }, params) {
      console.log("asyncBoardUpdate() params:" + JSON.stringify(params));
      return this.$axios
        .$put("/boards/" + params.id , params)
        .then((response) => {
          console.log("asyncBoardCommentCreate() response:" + JSON.stringify(response));
          commit("SET_BOARDS", response.boards);
          return response;
        });
    },
    asyncBoardDelete({ commit }, params) {
      console.log("asyncBoardDelete() params:" + JSON.stringify(params));
      return this.$axios
        .$delete("/boards/" + params.id)
        .then((response) => {
          return response;
        });
    },
    asyncBoardCommentCreate({ commit }, params) {
      console.log("asyncBoardCommentCreate() params:" + JSON.stringify(params));
      return this.$axios
        .$post("/board_comments/", params)
        .then((response) => {
          console.log("asyncBoardCommentCreate() response:" + JSON.stringify(response));
          commit("SET_BOARDS", response.boards);
          return response;
        });
    },
    asyncBoardComments({ commit }, params) {
      console.log("asyncBoardComments() params:" + JSON.stringify(params));
      return this.$axios
        .$get("/board_comments/?board_id=" + params.board_id)
        .then((response) => {
          console.log("asyncBoardComments() response:" + JSON.stringify(response));
          commit("SET_BOARD_COMMENTS", response);
          return response;
        });
    },
};  