// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import ViewUI from 'view-design';
import 'view-design/dist/styles/iview.css';
import App from './App'
import { router } from './router/index'
import store from './store'
import '@/locale'
import VueI18n from 'vue-i18n';
import VueLazyload from 'vue-lazyload'
// 引入awesome图标
import Icon from 'vue-awesome/components/Icon'
import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest } from '@/libs/axios'
import { setStore, getStore, removeStore } from '@/libs/storage'
import util from '@/libs/util';
import { hasPermission , hasRole } from '@/directives/directives'
import VueClipboard from 'vue-clipboard2'
import VCharts from "v-charts";
import Dict from "@/components/dict";
import "@/mock"
import '@babel/polyfill'

Vue.config.productionTip = false
Vue.use(VueLazyload, {
    error: require('./assets/noimg.png'),
    loading: require('./assets/loading.gif')
})
Vue.use(VueI18n);
Vue.use(ViewUI);
Vue.use(VueClipboard);
Vue.component('icon', Icon);
Vue.use(hasPermission);
Vue.use(hasRole);
Vue.use(VCharts);
Vue.component("Dict", Dict);
// 挂载全局使用的方法
Vue.prototype.getRequest = getRequest;
Vue.prototype.postRequest = postRequest;
Vue.prototype.putRequest = putRequest;
Vue.prototype.deleteRequest = deleteRequest;
Vue.prototype.uploadFileRequest = uploadFileRequest;
Vue.prototype.setStore = setStore;
Vue.prototype.getStore = getStore;
Vue.prototype.removeStore = removeStore;
Vue.prototype.$util = util;

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    render: h => h(App),
    data: {
        currentPageName: ''
    },
    mounted() {
        // 初始化菜单
        util.initRouter(this);
        this.currentPageName = this.$route.name;
        // 显示打开的页面的列表
        this.$store.commit('setOpenedList');
        this.$store.commit('initCachepage');
    }
})
