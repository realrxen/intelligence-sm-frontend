<template>
	<view class="box" @click="search">
		<view class="cu-bar search bg-red">
			<view class="search-form round">
				<text class="cuIcon-search"></text>
				<input @focus="InputFocus" @blur="InputBlur" :focus="isFocus" :disabled="isDisabled" :adjust-position="false" type="text" placeholder="搜索图片、文章、视频" confirm-type="search"></input>
			</view>
			<view class="action">
				<button class="cu-btn bg-white shadow-blur round">搜索</button>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props:{
			isDisabled:{
				type:Boolean,
				default:false
			}
		},
		data() {
			return {
				InputBottom: 0,
				isFocus:false
			};
		},
		methods: {
			search(){
				if(this.isDisabled){
					uni.navigateTo({
					url:'../search/search'
				})
				}
				
			},
			InputFocus(e) {
				this.InputBottom = e.detail.height
				
				
			},
			InputBlur(e) {
				this.InputBottom = 0
			}
		}
	}
</script>

<style>
	.box{
		position: fixed;
		top: 0;
		z-index: 9999;
		width: 100%;
		background-color: #FF0000;
	}

	
</style>
