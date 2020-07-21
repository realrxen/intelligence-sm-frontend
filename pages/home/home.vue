<template>
	<view class="page">
		<SearchBar :isDisabled="true"></SearchBar>
		<Swiper></Swiper>
		<List></List>
		<Block1></Block1>
		<!-- <NewsCard :newsList="newsLists[index].newsListItem.list" @goToNewsDetail="goToNewsDetail" :cardObj="cardObj" v-for="(cardObj,index) in cardList" :key="index"></NewsCard> -->
		<block v-for="(home,index) in homeObj" :key="index" v-if="home.newsBOS.length>0">
			<NewsCard :newsList="home.newsBOS" :cardObj="home.cardVO"></NewsCard>
		</block>
		<BottomBar :tIndex="0"></BottomBar>
		
	</view>
</template>

<script>
	import common from '../../common/js/common.js'
	var serverUrl = common.serverUrl
	import SearchBar from "../../components/color-ui/searchbar.vue"
	import Swiper from "../../components/color-ui/swpier.vue"
	import List from "../../components/color-ui/list.vue"
	import Block1 from "../../components/color-ui/oneAndTwo.vue"
	import NewsCard from "../../components/color-ui/newscard.vue"
	import BottomBar from "../../components/color-ui/bottombar.vue"
	export default {
		components:{
			SearchBar,
			Swiper,
			List,
			Block1,
			NewsCard,
			BottomBar
		},
		data() {
			return {
				
				newsLists:[
					
				],
				homeObj:[]
			}
		},
		onShareAppMessage: (res) => {
			return {
				title:'Hi',
				path:'/pages/home/home'
			}
		},
		onPullDownRefresh(){
			uni.request({
				url:serverUrl+'/news/',
				method:'GET',
				success: (res) => {
					uni.stopPullDownRefresh()
					if(res.data.code===0){
						this.homeObj = res.data.data
					}
					
				}
			})
		},
		onLoad() {
			uni.request({
				url:serverUrl+'/news/',
				method:'GET',
				success: (res) => {
					if(res.data.code===0){
						this.homeObj = res.data.data
					}
					
				}
			})
			
			
		},
		methods: {
			
		}
	}
</script>

<style>
	.page{
		background-color: #FF0000;
		width: 100%;
		height: 100%;
		position: absolute;
		/* background: -moz-linear-gradient(top, #ff0000 0%, #ff0000 100%);
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#ffffff));
		background: -webkit-linear-gradient(top, #ffffff 0%,#ffffff 100%);
		background: -o-linear-gradient(top, #ff0000 0%,#ffffff 100%);
		background: -ms-linear-gradient(top, #ff0000 0%,#ffffff 100%);
		background: linear-gradient(to bottom, #ff0000 0%,#ffffff 100%); */
		
		
		background: linear-gradient(to bottom, #ff0000 0%,#ffffff 100%);
		
	}
</style>
