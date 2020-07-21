<template>
	<view>
		<view class="news">
			<view class="title">
				{{news.title}}
			</view>
			<view class="news-info">
				<view class="time">
					  {{news.author}}
					  
					{{news.createTime}} 
				</view>
			</view>
			<!-- <view class="content" v-html="news.htmlContent">
				{{news.htmlContent}}
			</view> -->
			<view class="ql-snow">
				<view class="ql-editor" v-html="content">
				</view>
			</view>
			<!-- <rich-text :nodes="news.htmlContent" :selectable="true"></rich-text> -->
			<view class="attachment-text" v-if="news.attachments.length>0">附件(点击预览)</view>
			<view class="attachment" v-for="(attachment,index) in news.attachments" :key="index">
				<!-- <view class="order" style="text-align: justify;">{{index+1}}.</view> -->
				<view class="attachment-item" @click="openDocument(attachment.url)">{{index+1}}. {{attachment.name}}</view>
				<view class="attachment-item2"  @click="saveDocument(attachment.url)">下载</view>
			</view>
			
			<!-- <view class="content-info">编辑 abc</view> -->
			<!-- <template v-if="this.myPageHelper.pageNum>1"> -->
				<view class="cu-bar bg-white solid-bottom margin-top-sm" style="margin-bottom: -30rpx;border-radius: 20rpx 20rpx 0 0;">
					<view class="action" style="margin-left: 0;">
						<text class="cuIcon-titles text-red"></text> 精彩推荐
					</view>
					<view class="changeRecommend" @click.stop="changeRecommend()">
						<view class="change-content">
							换一批
						</view>
						<view class="cuIcon-refresh change-icon">
							
						</view>
						
					</view>
				</view>
				<view style="padding-bottom: 101rpx;">
					<view class="cu-card article" :class="isCard?'no-card':''" style="margin-top: 25rpx;" v-for="(news,index) in myPageHelper.list" :key="index" @click="goToNewsDetail(news)">
						<view class="cu-item shadow" style="padding-bottom: 0; margin: 0;">
							<!-- <view class="title" style="padding: 0;"><view class="text-cut">{{news.title}}</view></view> -->
							<view class="content" style="padding: 0;">
								<image :src="news.cover"
								 mode="aspectFill"></image>
								<view class="desc">
									<view class="text-content">{{news.summary}}</view>
									<!-- <view>
										<view class="cu-tag light sm round"
										  v-for="(tag,index2) in news.tags" :key="index2" :class="{ 'bg-red':index2===0,'bg-green':index2===1,'bg-blue':index2===2}"
										  >{{tag}}</view>
									</view> -->
									<view class="createTime" style="color: #CCCCCC;">{{news.createTime}}</view>
								</view>
							</view>
						</view>
					</view>
				</view>
			<!-- </template> -->
		</view>	
	</view>
</template>

<script>
	import {HTMLParser} from "../../common/js/common.js"
	import common from '../../common/js/common.js'
	var serverUrl = common.serverUrl
	export default {
		data() {
			return {
				news:{},
				content:'',
				nodes:[],
				tabId:0,
				myPageHelper:{},
				startNum:2
				
			}
		},
		onLoad(data) {
			 var newsObj =JSON.parse(decodeURIComponent(data.newsStr)); 
			 this.news= newsObj
			 this.content=newsObj.htmlContent
			var title = newsObj.title
			uni.setNavigationBarTitle({
			    title: title
			});
			this.tabId=newsObj.tabId
			this.getRecommend()
		},
		onShareAppMessage: function(res) {
			var title = this.news.title
			return {
				title:title,
				path:'/pages/NewsDetail/NewsDetail'
			}
		},
		methods: {
			//保存文件
			saveDocument(url){
				var data = url
					uni.setClipboardData({
						data:data,
						success:function(){
							uni.getClipboardData({
								success:function(){
									uni.showToast({
										icon:"none",
										title:'下载链接已复制 请使用浏览器访问',
										duration:2000
									})
								}
							})
						}
					})
				  
			},
			//打开文件
			openDocument(url){
				uni.showLoading({
					title:'要等一等哟~',
				})
				var documentUrl = url
				uni.downloadFile({
				  url: documentUrl,
				  success: function (res) {
				    var filePath = res.tempFilePath;
				    uni.openDocument({
				      filePath: filePath,
				      success: function (res) {
						  uni.hideLoading();
				      }
				    });
				  }
				});
			},
			
			//请求推荐
			getRecommend(){
				uni.request({
					url:serverUrl+'/news/'+this.tabId+'?currentNum='+this.startNum+'&size=3',
					method:'GET',
					success: (res) => {
						if(res.data.code===0){
							this.myPageHelper = res.data.data
							
						}
						
					}
				})
			},
			//更换推荐
			changeRecommend(){
				// var nextPage = this.myPageHelper.pageNum+1
				this.startNum=this.startNum+1
				var nextPage = this.startNum
				var hasNextPage = this.myPageHelper.hasNextPage
				if(hasNextPage){
					uni.request({
						url:serverUrl+'/news/'+this.tabId+'?currentNum='+nextPage+'&size=3',
						method:'GET',
						success: (res) => {
							if(res.data.code===0){
								this.myPageHelper = res.data.data
							}
							
						}
					})
				}else{
					this.startNum=2
					this.getRecommend()
				}
			},
			goToNewsDetail(data){
					uni.navigateTo({
						url:'./NewsDetail?newsStr='+encodeURIComponent(JSON.stringify(data))
					})
				
				
			},
		}
	}
</script>

<style>
@import url("./NewsDetail.css");
</style>
