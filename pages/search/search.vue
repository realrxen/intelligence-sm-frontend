<template>
	<view>
		<SearchBar></SearchBar>
		<template v-if="searchList.length===0">
			<view class="searchWrapper">
				<view class="top-words">
				搜索历史
				</view>
				<view class="searchHistoryWrapper">
					<view v-for="(item,index) in searchTextList" :key="index" class="history-item"
					@click="tapSearchHistoryItem(item)">
							{{item}}
					</view>
				</view>
				<view class="top-words">
				热词
				</view>
				<view class="searchHistoryWrapper">
					<view v-for="(item,index) in searchTextList" :key="index" class="history-item"
					@click="tapSearchHistoryItem(item)">
							{{item}}
					</view>
				</view>
			</view>
			
		</template>
		<template v-else>
			<!-- <block v-for="(searchResult,index) in searchList" :key=index>
				<UserPost :post='searchResult' :index='index'></UserPost>
				<Divider></Divider>
			</block> -->
		</template>
	</view>
</template>

<script>
	// import UserPost from '../post/components/UserPost.vue'
	import SearchBar from '../../components/color-ui/searchbar.vue'
	export default {
		components:{
			// UserPost
			SearchBar
		},
		data() {
			return {
				searchText:"",
				searchTextList:["北京","上海","南京","三潭印月","平湖秋月","断桥残雪",
				"苏堤春晓","陶然亭","敦煌莫高窟","花港观鱼","曲院风荷","双峰插云","南屏晚钟","柳浪闻莺","雷锋夕照"],
				searchList:[]
			}
		},
		onNavigationBarButtonTap(e) {
			if(e.index===0){
				this.searchEvent()
			}
		},
		onNavigationBarSearchInputChanged(e){
			this.searchText=e.text
			// this.searchTextList.push(e.text)
		},
		methods: {
			tapSearchHistoryItem(text){
				console.log(text)
				this.searchText=text
				this.searchEvent()
			},
			searchEvent(){
				
				// 收起键盘
				uni.hideKeyboard()
				// uni.showLoading({
				// 	mask:true,
				// 	title:"请稍后……",
				// })
				uni.showToast({
					title:"搜索中...",
					duration:2000
				})
				
				// 请求
				}

		},
		
	}
</script>

<style>
	.searchWrapper{
		display: flex;
		flex-direction: column;
		margin-top: 101rpx;
	}
	.top-words{
		padding-top: 20rpx;
		padding-bottom: 20rpx;
		font-size: 30rpx;
	}
	.searchHistoryWrapper{
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start;
	}
	.history-item{
		border: 1rpx solid #D9D9D9;
		border-radius: 8rpx;
		margin: 5rpx 10rpx;
		padding: 10rpx 20rpx 10rpx 20rpx;
	}


</style>
