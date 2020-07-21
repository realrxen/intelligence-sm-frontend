<template>
	<view>
		<app-tabs v-model="tabIndex" :tabs="tabs" :fixed="true"></app-tabs>
		<swiper :style="{height: height}" :current="tabIndex" @change="swiperChange">
			<swiper-item>
				<mescroll-item :i="0" :index="tabIndex" :tabs="tabs"></mescroll-item>
			</swiper-item>
			
			<swiper-item>
				<mescroll-item :i="1" :index="tabIndex" :tabs="tabs"></mescroll-item>
			</swiper-item>
			
			<swiper-item>
				<mescroll-item :i="2" :index="tabIndex" :tabs="tabs"></mescroll-item>
			</swiper-item>
			
			<swiper-item>
				<mescroll-item :i="3" :index="tabIndex" :tabs="tabs"></mescroll-item>
			</swiper-item>
			<swiper-item>
				<mescroll-item :i="4" :index="tabIndex" :tabs="tabs"></mescroll-item>
			</swiper-item>
		</swiper>
	</view>
</template>

<script>
	import MescrollItem from "./mescroll-swiper-item.vue";
	import AppTabs from "./app-tabs.vue";
	
	export default {
		components: {
			MescrollItem,
			AppTabs
		},
		data() {
			return {
				height: "400px", // 需要固定swiper的高度
				tabs: ['推荐', '升学', '就业', '新闻','志愿'],
				tabIndex: 0 // 当前tab的下标
			}
		},
		methods: {
			// 轮播菜单
			swiperChange(e){
				this.tabIndex = e.detail.current
			}
		},
		onLoad() {
			// 需要固定swiper的高度
			this.height = uni.getSystemInfoSync().windowHeight + 'px'
		}
	}
</script>

<style>
</style>
