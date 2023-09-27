export const state = () => ({
    notes: [],
    boards: [],
});
export const mutations = {
    SET_NOTES(state, payLoad) {
        state.notes = payLoad;
    },
    SET_BOARDS(state, payLoad) {
        state.boards = payLoad;
    },
};
export const getters = {
    notes: (state) => {
        return state.notes;
    },
    boards: (state) => {
        return state.boards;
    },
  };
export const actions = {
    asynHome({ commit }, params) {
        console.log("asynHome() params:" + JSON.stringify(params));
        return this.$axios
            .$get("/home/index")
            .then((response) => {
                console.log("asynHome() response:" + JSON.stringify(response));
                commit("SET_NOTES", response.notes);
                commit("SET_BOARDS", response.boards);
                return response;
            });
    },
}; 