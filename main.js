import Vue from 'vue'
import App from './App'

// 注册全局组件
import MescrollBody from "@/components/mescroll-uni/mescroll-body.vue"
import MescrollUni from "@/components/mescroll-uni/mescroll-uni.vue"
Vue.component('mescroll-body', MescrollBody)
Vue.component('mescroll-uni', MescrollUni)


import CutLine from "@/common/components/cutline.vue"
Vue.component('CutLine', CutLine)
Vue.config.productionTip = false

import cuCustom from './colorui/components/cu-custom.vue'
Vue.component('cu-custom',cuCustom)

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()