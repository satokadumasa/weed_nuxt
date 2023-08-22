export const state = () => ({
    rooms: [],
    room:{},
    whispers: [],
    whisper: {},
    members: [],
    member: {},
    max_page: 0,
    count: 0,
});
export const mutations = {
  /**
   *
   * @param {*} state
   * @param {*} payLoad
   */
  SET_ROOMS(state, payLoad) {
    state.rooms = payLoad;
  },
  SET_ROOM(state, payLoad) {
    state.room = payLoad;
  },
  SET_WISPERS(state, payLoad) {
    state.whispers = payLoad;
  },
  SET_WISPER(state, payLoad) {
    state.whisper = payLoad;
  },
  SET_MEMBERS(state, payLoad) {
    state.members = payLoad;
  },
  SET_MEMBER(state, payLoad) {
    state.member = payLoad;
  },
  SET_MAX_PAGE(state, payLoad) {
    state.max_page = payLoad;
  },
  SET_COUNT(state, payLoad) {
    state.count = payLoad;
  },
};
export const getters = {
  rooms: (state) => {
      return state.rooms;
  },
  room: (state) => {
      return state.room;
  },
  whispers: (state) => {
      return state.whispers;
  },
  whisper: (state) => {
      return state.whisper;
  },
  members: (state) => {
      return state.members;
  },
  member: (state) => {
      return state.member;
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
  asyncRooms({ commit }, params) {
    console.log("asyncRooms() params:" + JSON.stringify(params));
    let searchData = "";
    _.each(params, (value, key) => {
      console.log("asyncRooms() key[" + key + "] value[" + value + "]");
      if (key != "page" && value != undefined && value != "") {
        if(value != '') {
          searchData += `&${key}=${value}`;
        }
      }
    });
    console.log("asyncBoards() searchData:" + searchData);
    return this.$axios
      .$get("/rooms/?page=" + params.page + searchData)
      .then((response) => {
        commit("SET_ROOMS", response.rooms);
        commit("SET_MAX_PAGE", response.max_page);
        commit("SET_COUNT", response.count);
        return response;
      });
  },
  asyncRoom({ commit }, params) {
    console.log("asyncBoard() params:" + JSON.stringify(params));
    return this.$axios
      .$get("/rooms/" + params.id)
      .then((response) => {
        console.log("asyncRoom() response:" + JSON.stringify(response));
        commit("SET_ROOM", response);
        return response;
      });
  },
  asyncRoomCreate({ commit }, params) {
    console.log("asyncRoomCreate() params:" + JSON.stringify(params));
    return this.$axios
      .$post("/rooms/", params)
      .then((response) => {
        commit("SET_ROOMS", response.rooms);
        return response;
      });
  },
  addMessage({ commit }, params) {
    console.log("addMessage() params:" + JSON.stringify(params));
  },
};  