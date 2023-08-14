export const state = () => ({
    user: {},
});
export const mutations = {
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_USER(state, payLoad) {
    state.user = payLoad;
  },
};
export const getters = {
  user: (state) => {
      return state.user;
  },
};
export const actions = {
    /**
     *
     * @param {*} param0
     * @param {*} params
     */
    /**
     * 
     * @param {*} param0 
     * @param {*} params 
     * @returns 
     */
    asyncUserCreate({ commit }, params) {
      console.log("asyncBoardCreate() params:" + JSON.stringify(params));
      return this.$axios
        .$post("/account/sign_up", params)
        .then((response) => {
          commit("SET_USER", response.user);
          return response;
        });
    },
    asyncUser({ commit }, params) {
      console.log("asyncUser() params:" + JSON.stringify(params));
      return this.$axios
        .$get("/users/" + params.id)
        .then((response) => {
          console.log("asyncUser() response:" + JSON.stringify(response));
          commit("SET_USER", response);
          return response;
        });
    },
    asyncFollowCreate({ commit }, params) {
      console.log("asyncFollowCreate() params:" + JSON.stringify(params));
      return this.$axios
        .$post("/follows/", params)
        .then((response) => {
          return response;
        });
    },
};  