export const state = () => ({
    notes: [],
    note: {},
    pages: [],
    page:{},
    max_page: 0,
});
export const mutations = {
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_NOTES(state, payLoad) {
    state.notes = payLoad;
  },
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_NOTE(state, payLoad) {
    state.note = payLoad;
  },
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_PAGES(state, payLoad) {
    state.pages = payLoad;
  },
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_PAGE(state, payLoad) {
    state.page = payLoad;
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
  notes: (state) => {
      return state.notes;
  },
  note: (state) => {
    return state.note;
  },
  pages: (state) => {
    return state.pages;
  },
  page: (state) => {
    return state.page;
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
     * ノートリスト
     * 
     * @param {*} param0
     * @param {*} params
     */
    asyncNotes({ commit }, params) {
        console.log("asyncNotes() params:" + JSON.stringify(params));
        let searchData = "";
        _.each(params, (value, key) => {
        console.log("asyncNotes() key[" + key + "] value[" + value + "]");
        if (key != "page" && value != undefined && value != "") {
            if(value != '') {
            searchData += `&${key}=${value}`;
            }
        }
        });
        console.log("asyncNotes() searchData:" + searchData);
        return this.$axios
            .$get("/notes/?page=" + params.page + searchData)
            .then((response) => {
                commit("SET_NOTES", response.notes);
                // commit("SET_MAX_PAGE", response.max_page);
                // commit("SET_COUNT", response.count);
                return response;
            });
    },
    /**
     * ノート詳細
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncNote({ commit }, params) {
        console.log("asyncNote() params:" + params);
        return this.$axios
            .$get("/notes/" + params.id)
            .then((response) => {
                console.log("asyncNote() note:" + JSON.stringify(response));
                commit("SET_NOTE", response.note);
                commit("SET_PAGES", response.pages);
                return response;
            });
    },
    /**
     * ノート作成
     * 
     * @param {*} param0
     * @param {*} params
     * @returns 
     */
    asyncNoteCreate({ commit }, params) {
        console.log("asyncNoteCreate() params:" + JSON.stringify(params));
        return this.$axios
            .$post("/notes/", params)
            .then((response) => {
                commit("SET_NOTES", response.notes);
                return response;
            });
    },
    /**
     * ノート更新
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncNoteUpdate({ commit }, params) {
        console.log("asyncNoteUpdate() params:" + JSON.stringify(params));
        return this.$axios
            .$put("/notes/" + params.id , params)
            .then((response) => {
                console.log("asyncNoteCommentCreate() response:" + JSON.stringify(response));
                commit("SET_NOTES", response.notes);
                return response;
            });
    },
    /**
     * ノート削除
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncNoteDelete({ commit }, params) {
        console.log("asyncNoteDelete() params:" + JSON.stringify(params));
        return this.$axios
            .$delete("/notes/" + params.id)
            .then((response) => {
                return response;
            });
    },
    /**
     * ページ
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncPage({ commit }, params) {
        console.log("asyncPage() params:" + params);
        return this.$axios
            .$get("/pages/" + params.id)
            .then((response) => {
                console.log("asyncPage() page:" + JSON.stringify(response));
                commit("SET_PAGE", response);
                return response;
            });
    },
    asyncPages({ commit }, params) {
      console.log("asyncPage() params:" + JSON.stringify(params));
      return this.$axios
          .$get("/pages/?note_id=" + params.note_id)
          .then((response) => {
              console.log("asyncPage() page:" + JSON.stringify(response));
              // commit("SET_PAGES", response);
              return response;
          });
    },
    /**
     * ページ作成
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncPageCreate({ commit }, params) {
        console.log("asyncPageCreate() params:" + JSON.stringify(params));
        return this.$axios
            .$post("/pages/", params)
            .then((response) => {
                commit("SET_PAGES", response.pages);
                return response;
            });
    },
    /**
     * ページ更新
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncPageeUpdate({ commit }, params) {
        console.log("asyncPageeUpdate() params:" + JSON.stringify(params));
        return this.$axios
            .$put("/pages/" + params.id , params)
            .then((response) => {
                console.log("asyncNoteCommentCreate() response:" + JSON.stringify(response));
                commit("SET_PAGES", response.pages);
                return response;
            });
    },
    /**
     * ページ削除
     * 
     * @param {*} param0
     * @param {*} params
     * @returns
     */
    asyncPageDelete({ commit }, params) {
        console.log("asyncPageDelete() params:" + JSON.stringify(params));
        return this.$axios
            .$delete("/pages/" + params.id)
            .then((response) => {
                return response;
            });
    },
    asyncNoteBookmarkCreate({ commit }, params) {
      console.log("asyncNoteBookmarkCreate() params:" + JSON.stringify(params));
      return this.$axios
        .$post("/note_bookmarks/", params)
        .then((response) => {
          return response;
        });
    },
};
