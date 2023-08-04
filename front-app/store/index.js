export const state = () => ({
    user:null,
});
export const mutations = {
    setUser(state,{user}){
        console.log("setUser()");
        state.user = user;
    }
}