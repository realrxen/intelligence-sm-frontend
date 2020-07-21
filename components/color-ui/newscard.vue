<template>
	<view  :style="cardObj.isLast?'padding-bottom: 101rpx;':''">
		

		<view v-if="showBar" class="cu-bar bg-white solid-bottom" :class="cardObj.isFirst?'margin-top-sm':''" style="margin-bottom: -30rpx;border-radius: 20rpx 20rpx 0 0;">
			<view class="action">
				<text :class="['text-'+cardObj.color,'cuIcon-'+cardObj.icon]"></text> {{cardObj.name}}
			</view>
			<!-- <view class="action">
				<switch :class="isCard?'checked':''" :checked="isCard?true:false" @change="IsCard"></switch>
			</view> -->
			<view class="moreNews" @click="moreNews(cardObj)">
				<view class="news_content">
					更多
				</view>
				<view class="cuIcon-right news-icon">
					
				</view>
				
			</view>
			
		</view>
		<view class="cu-card article" :class="isCard?'no-card':''" v-for="(news,index) in newsList" :key="index" @click="goToNewsDetail(news)">
			<view class="cu-item shadow">
				<view class="title"><view class="text-cut">{{news.title}}</view></view>
				<view class="content">
					<image :src="news.cover"
					 mode="aspectFill"></image>
					<view class="desc">
						<view class="text-content">{{news.summary}}</view>
						<view>
							<view class="cu-tag light sm round"
							  v-for="(tag,index2) in news.tags" :key="index2" :class="{ 'bg-red':index2===0,'bg-green':index2===1,'bg-blue':index2===2}"
							  >{{tag.name}}</view>
							<!-- <view class="cu-tag bg-green light sm round">志愿者</view>
							<view class="cu-tag bg-blue light sm round">共青组织</view> -->
						</view>
					</view>
				</view>
				<!-- <view class="createTime">{{news.createTime}}</view> -->
			</view>
		</view>
		<CutLine></CutLine>
	</view>
</template>

<script>
	export default {
		props:{
			isLast:false,
			cardObj:Object,
			newsList:{
				type: Array,
				default(){
					return [];
				}
			},
			showBar:{
				type:Boolean,
				default:true
			},
			isMorePage:{
				type:Boolean,
				default:false
			}
		},
		data() {
			return {
				isCard: true,
				myList:[]
				
			};
		},
		onLoad() {
		},
		methods: {
		
			moreNews(data){
				var cardObjStr = JSON.stringify(data)
				uni.navigateTo({
					url:'../../pages/news/MoreNews/MoreNews?cardObjStr='+cardObjStr
				})
			},
			goToNewsDetail(data){
				if(this.isMorePage){
					uni.navigateTo({
						url:'../../../pages/news/NewsDetail?newsStr='+encodeURIComponent(JSON.stringify(data))
					})
				}else{
					uni.navigateTo({
					url:'../../pages/news/NewsDetail?newsStr='+encodeURIComponent(JSON.stringify(data))
				})
				}
				
				
			},
			IsCard(e) {
				this.isCard = e.detail.value
			},
		}
	}



</script>

<style>
	.createTime{
		right: 0;
		margin-top: 5rpx;
		margin-bottom: 0;
		margin-right: 30rpx;
		float:right ;
		color: #c8c8c8;
		font-size: 12px;
		
	}
	
	.moreNews{
		display: flex;
		justify-content: center;
		align-items: center;
		color: #C8C8C8;
		font-size: 28rpx;
		margin-right: 30rpx;
	}
	.news-icon{
		margin-left: 5rpx;
	}
</style>
