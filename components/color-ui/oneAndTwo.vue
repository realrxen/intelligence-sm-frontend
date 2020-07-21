<template>
		<view class="block1">
			<view class="one">
				<!-- <view class="one-item1 bg-transparent" style="background-image:url(http://img1.imgtn.bdimg.com/it/u=1581670763,31131566&fm=26&gp=0.jpg);">志愿活动</view> -->
				<view class="one-item1 bg-transparent" style="background-image:url(http://img0.imgtn.bdimg.com/it/u=2804077929,1583113489&fm=26&gp=0.jpg);" @click="goToMp">志愿活动</view>
			</view>
			<view class="two">
				<view class="two-item1 bg-transparent" style="background-image:url(http://img3.imgtn.bdimg.com/it/u=284615882,1607990725&fm=26&gp=0.jpg);" @click="goToMp">报销指南</view>
				<view class="two-item2 bg-transparent" style="background-image:url(http://img4.imgtn.bdimg.com/it/u=3165886466,1780957566&fm=26&gp=0.jpg);" @click="goToMp">健康填报</view>
			</view>
		</view>
</template>

<script>
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			goToMp(){
				// uni.showToast({
				// 	icon:"none",
				// 	title:"开发中，请持续关注······",
				// 	duration:2000
				// })
				uni.navigateToMiniProgram({
				  appId: 'wx63bc9eaa97ae4fca',
				  // path: 'pages/login/login',
				  success(res) {
				    // 打开成功
				  }
				})
			}
		}
	}
</script>

<style>
	.block1{
		display: flex;
		width: 95%;
		height: 200rpx;
		margin: 20rpx 20rpx 0 20rpx ;
		
	}
	
	.one{
		display: flex;
		width: 50%;
		
	}
	.two{
		display: flex;
		width: 50%;
		flex-direction: column;
		margin: 0 10rpx;
	}
	
	.one-item1{
		display:flex;
		align-items:center;
		justify-content:center;
		width: 100%;
		/* background-color: #f48a55; */
		border-radius: 12rpx;
		font-size: 32rpx;
		color: #fff;
		font-weight: bold;
	}
	
	.two-item1{
		display:flex;
		align-items:center;
		justify-content:center;
		width: 100%;
		height: 100rpx;
		/* background-color: #39B54A; */
		border-radius: 12rpx;
		margin: 0 10rpx 5rpx;
		font-size: 32rpx;
		color: #fff;
		font-weight: bold;
	}
	
	.two-item2{
		display:flex;
		align-items:center;
		justify-content:center;
		width: 100%;
		height: 100rpx;
		/* 5460CD */
		/* background-color: #9000FF; */
		border-radius: 12rpx;
		margin: 5rpx 10rpx 0;
		font-size: 32rpx;
		color: #fff;
		font-weight: bold;
	}
	
	.bg-transparent {
		position: relative;
		/* background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big91005.jpg); */
		
	}
	
	.bg-transparent::before {
		content: "";
		display: block;
		background: inherit;
		filter: blur(10upx);
		position: absolute;
		width: 100%;
		height: 100%;
		top: 10upx;
		left: 10upx;
		/* z-index: -1; */
		opacity: 0.1;
		transform-origin: 0 0;
		border-radius: inherit;
		transform: scale(1, 1);
	}
</style>
