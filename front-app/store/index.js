import Vuex from 'vuex';

export const state = () => ({
    user:null,
    messageList:[],
});
export const mutations = {
    setUser(state,{user}){
        console.log("setUser()");
        state.user = user;
    }
}

// const createStore = () => {
//     return new Vuex.Store({
//         state: () => ({
//             messageList: []
//         }),
//     })
// }
// export default createStore;