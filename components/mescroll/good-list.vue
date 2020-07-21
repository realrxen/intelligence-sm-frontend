<template>
	<view class="pd-list">
		<view class="pd-li" v-for="news in list" :key="news.newsId" @click="openNewsDetail(news)">
			<image class="pd-img" style="" :src="news.cover" mode="aspectFill"/>
			<view class="pd-detail">
				<view class="pd-name">{{news.title}}</view>
				<!-- <text class="pd-price">{{pd.pdPrice}} 元</text> -->
				<text class="pd-sold">浏览次数 {{news.watchTimes}}</text>
			</view>
		</view>
		<view v-if="list.length>0&&pageHelper.total>7" class="load">{{pageHelper.hasNextPage?'加载更多中……':'似乎没有更多~'}}</view>
	</view>
</template>

<script>
	export default {
		props:{
			list: { // 数据列表
				type: Array,
				default(){
					return []
				}
			},
			pageHelper:Object
		},
		methods:{
			openNewsDetail(data){
				this.$emit('openNewsDetail',data)
			}
		}
	}
</script>

<style>
	/*数据列表*/
	.pd-list{
		display: flex;
		background-color: #fff;
		flex-direction: column;
		padding:20rpx 0 50rpx;
	}
	.pd-detail{
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		justify-content: flex-start;
		width: 100%;
		margin-right: 20rpx;
	}
	.pd-li{
		display: flex;
		align-items: center;
		position: relative;
		height: 160upx;
		padding: 20upx 16upx 20upx 240upx;
		border-bottom: 1upx solid #eee;
	}
	.pd-li .pd-img{
		position: absolute !important; /*编译到H5,在mescroll-more的案例中需加上!important,解决tab切换过快定位失效的问题*/
		left: 36upx;
		top: 20upx;
		width: 160upx;
		height: 120upx;
	}
	.pd-li .pd-name{
		font-size: 26upx;
		line-height: 40upx;
		height: 80upx;
		overflow: hidden;
	}
	.pd-li .pd-price{
		font-size: 26upx;
		color: red;
	}
	.pd-li .pd-sold{
		font-size: 24upx;
		margin-top: 10upx;
		color: gray;
	}
	.load{
		text-align: center;
		font-size: 28rpx;
		color: #c8c8c8;
	}
</style>
