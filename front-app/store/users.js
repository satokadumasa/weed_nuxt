export const state = () => ({
    user: [],
});
export const mutations = {
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_USER(state, payLoad) {
    state.boards = payLoad;
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
};  