import Vuex from 'vuex';

export const state = () => ({
    user:null,
    messageList:[],
});
export const mutations = {
    setUser(state,{user}){
        console.log("setUser()");
        state.user = user;
    },
    addMessage(state, messageText) {
        console.log("addMessage() state:" + JSON.stringify(state));
        console.log("addMessage() messageText:" + JSON.stringify(messageText));
        state.messageList.push({sender: messageText.sender, message: messageText.message})
    }
}
export const getters = {
    user: (state) => {
        return state.user;
    },
    messageList: (state) => {
        console.log("state:" + JSON.stringify(state));
        return state.messageList;
    },
};
