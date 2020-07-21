<template>
	<view class="page">
		<cu-custom :isBack="false">
		</cu-custom>
		<view class="box">
			<view class="cu-bar  bg-white ">
				<view class="action sub-title" @click="back">
					<!-- <text class="cuIcon-back"></text> -->
					<text class="text-xl text-bold" :class="'text-'+card.color">返回</text>
					<text style="width:2rem" :class="'bg-'+card.color"></text>
				</view>
			</view>
		</view>
		<view class="box">
			<view class="cu-bar justify-center bg-white" style="margin-top: 0;min-height: 5upx;">
				<view class="action sub-title">
					<!-- <text class="cuIcon-back"></text> -->
					<text class="text-xl text-bold" :class="'text-'+card.color">{{card.name}}</text>
					<text style="width:2rem" :class="'bg-'+card.color"></text>
				</view>
			</view>
		</view>
		<NewsCard :showBar="false" :isMorePage="true" :newsList="myPageHelper.list" @goToNewsDetail="goToNewsDetail" :key="index"></NewsCard>
		<backTop :src="backTop.src"  :scrollTop="backTop.scrollTop"></backTop>
	</view>
</template>

<script>
	import NewsCard from '../../../components/color-ui/newscard.vue'
	import backTop from '@/components/back-top/back-top.vue';
	import common from '../../../common/js/common.js'
	var serverUrl = common.serverUrl
	export default {
		components:{
			NewsCard,
			backTop
		},
		data() {
			return {
				backTop: {
					src: '../../static/back-top/top.png',
					scrollTop: 0
				},
				scrollTop: 0,
				card:{},
				tabId:0,
				myPageHelper:{},
				
			}
		},
		onPageScroll(e) {
			this.backTop.scrollTop = e.scrollTop;
		},
		onShareAppMessage: (res) => {
			return {
				title:'Hi',
				path:'/pages/news/MoreNews/MoreNews'
			}
		},
		onLoad(params) {
			var card = JSON.parse(params.cardObjStr)
			this.card=card
			this.tabId=card.tabId
			this.getOriginList()
		},
		onReachBottom(){
			this.getMoreList()
		},
		methods: {
			back(){
				uni.navigateBack({ delta:1 })
			},
			
			goToNewsDetail(newsStr){
				uni.navigateTo({
					url:'../../news/NewsDetail?newsStr='+newsStr
				})
			},
			
			//请求初始列表数据
			getOriginList(){
				uni.request({
					url:serverUrl+'/news/'+this.tabId+'?currentNum=1&size=4',
					method:'GET',
					success: (res) => {
						if(res.data.code===0){
							this.myPageHelper = res.data.data
							
						}
						
					}
				})
			},
			
			//请求更多列表数据
			getMoreList(){
				var nextPage = this.myPageHelper.pageNum+1
				var hasNextPage = this.myPageHelper.hasNextPage
				if(hasNextPage){
					uni.request({
						url:serverUrl+'/news/'+this.tabId+'?currentNum='+nextPage+'&size=4',
						method:'GET',
						success: (res) => {
							if(res.data.code===0){
								var preList = []
								preList = this.myPageHelper.list
								this.myPageHelper = res.data.data
								var newList = []
								newList = this.myPageHelper.list
								var nowList = []
								nowList = preList.concat(newList)
								this.myPageHelper.list=nowList
							}
							
						}
					})
				}else{
					uni.showToast({
						icon:"none",
						title:"没有更多了!",
						duration:2000
					})
				}
			}
		}
	}
</script>

<style>
	.box {
			
			margin: 20upx 0 10upx;
		}
		
		/* .myBar{
			position: fixed;
			z-index: 999;
		} */
	
		.box view.cu-bar {
			margin-top: 35upx;
		}
</style>
