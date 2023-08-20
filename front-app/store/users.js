export const state = () => ({
    user: {},
    followers: [],
    followings: [],
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
  SET_FOLLOWERS(state, payLoad) {
    state.followers = payLoad;
  },
  SET_FOLLOWINGS(state, payLoad) {
    state.followings = payLoad;
  },
};
export const getters = {
  user: (state) => {
      return state.user;
  },
  followers: (state) => {
    return state.followers;
  },
  followings: (state) => {
    return state.followings;
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
          commit("SET_USER", response.user);
          commit("SET_FOLLOWERS", response.followers);
          commit("SET_FOLLOWINGS", response.followings);
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
    asyncFollowDestroy({ commit }, params) {
      console.log("asyncFollowCreate() params:" + JSON.stringify(params));
      return this.$axios
        .$post("/users/remove/", params)
        .then((response) => {
          return response;
        });
    },
};  