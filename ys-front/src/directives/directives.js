export const hasPermission = {
    install(Vue, options) {
        Vue.directive('has', {
            inserted(el, binding, vnode) {
                let permTypes = vnode.context.$route.meta.permTypes;
                if (!permTypes.includes(binding.value)) {
                    el.style.display = 'none';
                }
            }
        })
    }
};

export const hasRole = {
    install(Vue, options) {
        Vue.directive('hasRole', {
            inserted(el, binding, vnode) {
                let roles = window.localStorage.getItem('roles');
                if (!roles.includes(binding.value)) {
                    el.style.display = 'none';
                }
            }
        })
    }
};