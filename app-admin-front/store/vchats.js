export const state = () => ({
    vchats: [],
    vchat:{},
    max_page: 0,
    count: 0,
});
export const mutations = {
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_VCHATS(state, payLoad) {
    state.vchats = payLoad;
  },
  SET_VCHAT(state, payLoad) {
    state.vchat = payLoad;
  },
  SET_MAX_PAGE(state, payLoad) {
    state.max_page = payLoad;
  },
  SET_COUNT(state, payLoad) {
    state.count = payLoad;
  },
};
export const getters = {
  vchats: (state) => {
      return state.vchats;
  },
  vchat: (state) => {
      return state.vchat;
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
  asyncVchats({ commit }, params) {
    console.log("asyncvchats() params:" + JSON.stringify(params));
    let searchData = "";
    _.each(params, (value, key) => {
      console.log("asyncvchats() key[" + key + "] value[" + value + "]");
      if (key != "page" && value != undefined && value != "") {
        if(value != '') {
          searchData += `&${key}=${value}`;
        }
      }
    });
    console.log("asyncBoards() searchData:" + searchData);
    return this.$axios
      .$get("/vchats/?page=" + params.page + searchData)
      .then((response) => {
        console.log("asyncVchats() params:" + JSON.stringify(params));
        commit("SET_VCHATS", response.vchats);
        commit("SET_MAX_PAGE", response.max_page);
        commit("SET_COUNT", response.count);
        return response;
      });
  },
  asyncvchat({ commit }, params) {
    console.log("asyncBoard() params:" + JSON.stringify(params));
    return this.$axios
      .$get("/vchats/" + params.id)
      .then((response) => {
        console.log("asyncvchat() response:" + JSON.stringify(response));
        commit("SET_VCHAT", response);
        return response;
      });
  },
  asyncvchatCreate({ commit }, params) {
    console.log("asyncvchatCreate() params:" + JSON.stringify(params));
    return this.$axios
      .$post("/vchats/", params)
      .then((response) => {
        commit("SET_VCHATS", response.vchats);
        return response;
      });
  },
  addMessage({ commit }, params) {
    console.log("addMessage() params:" + JSON.stringify(params));
  },
};  