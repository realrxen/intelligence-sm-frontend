<template>
	<view class="page">
		<app-tabs v-model="tabIndex" :tabs="tabs" :fixed="true"></app-tabs>
		<swiper :style="{height: height}" :current="tabIndex" @change="swiperChange">
			<swiper-item v-for="(tab,index) in tabs" :key="index">
				<mescroll-item @openNewsDetail="openNewsDetail" :i="tab.tabId" :index="tabIndex" :tabs="tabs"></mescroll-item>
			</swiper-item>
		</swiper>
		<BottomBar :tIndex="1"></BottomBar>
	</view>
</template>

<script>
	import MescrollItem from "../../components/mescroll/mescroll-swiper-item.vue";
	import AppTabs from "../../components/mescroll/app-tabs.vue";
	import BottomBar from "../../components/color-ui/bottombar.vue"
	import common from "../../common/js/common.js"
	var serverUrl = common.serverUrl
	export default {
		components: {
			MescrollItem,
			AppTabs,
			BottomBar
		},
		data() {
			return {
				height: "400px", // 需要固定swiper的高度
				tabs: [],
				tabIndex: 0 // 当前tab的下标
			}
		},
		onShareAppMessage: (res) => {
			return {
				title:'Hi',
				path:'/pages/news/news'
			}
		},
		methods: {
			openNewsDetail(data){
				uni.navigateTo({
					url:'./NewsDetail?newsStr='+encodeURIComponent(JSON.stringify(data))
				})
			},
			// 轮播菜单
			swiperChange(e){
				this.tabIndex = e.detail.current
			}
		},
		onLoad() {
			uni.request({
				url:serverUrl+'/tabs/',
				method:'GET',
				success: (res) => {
					if(res.data.code===0){
						this.tabs = res.data.data
					}
					
				}
			})
			// 需要固定swiper的高度
			this.height = uni.getSystemInfoSync().windowHeight + 'px'
			uni.hideHomeButton()
			
		}
	}
</script>

<style>
	.page{
		background-color: #FFFFFF;
		/* width: 100%;
		height: 100%;
		position: absolute;
		background: -moz-linear-gradient(top, #ff0000 0%, #ff0000 100%);
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#ffffff));
		background: -webkit-linear-gradient(top, #ffffff 0%,#ffffff 100%);
		background: -o-linear-gradient(top, #ff0000 0%,#ffffff 100%);
		background: -ms-linear-gradient(top, #ff0000 0%,#ffffff 100%);
		background: linear-gradient(to bottom, #ff0000 0%,#ffffff 100%); */
		
	}
</style>
