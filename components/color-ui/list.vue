<template>
	<view class="myList">
			<view class="cu-list grid" :class="['col-' + gridCol,gridBorder?'':'no-border']">
				<view class="cu-item" v-for="(item,index) in cuIconList" :key="index" v-if="index<gridCol*2">
					<view :class="['cuIcon-' + item.cuIcon,'text-' + item.color]" @click="clickItem(item)">
						<view class="cu-tag badge" v-if="item.badge!=0">
							<block v-if="item.badge!=1">{{item.badge>99?'99+':item.badge}}</block>
						</view>
					</view>
					<text>{{item.name}}</text>
				</view>
			</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				cuIconList: [
				{
					cuIcon: 'upstagefill',
					color: 'yellow',
					badge: 0,
					name: '赛事'
				}, 
				{
					cuIcon: 'friendfill',
					color: 'orange',
					badge: 0,
					name: '志愿活动'
				},
				{
					cuIcon: 'discoverfill',
					color: 'grassdry',
					badge: 0,
					name: '实践'
				},
				{
					cuIcon: 'wefill',
					color: 'warmpink',
					badge: 0,
					name: '心理咨询'
				},
				{
					cuIcon: 'questionfill',
					color: 'lightblue',
					badge: 0,
					name: '疑问解答'
				},
				{
					cuIcon: 'formfill',
					color: 'blue',
					badge: 0,
					name: '要讯'
				}, 
				{
					cuIcon: 'cardboardfill',
					color: 'red',
					badge: 0,
					name: '新思想'
				},
				{
					cuIcon: 'commandfill',
					color: 'purple',
					badge: 0,
					name: '学习资料'
				},
				{
					cuIcon: 'file',
					color: 'cyan',
					badge: 0,
					name: '文件'
				},
				{
					cuIcon: 'noticefill',
					color: 'olive',
					badge: 0,
					name: '年级通知'
				},
				],
				modalName: null,
				gridCol: 5,
				gridBorder: false,
				menuBorder: false,
				menuArrow: false,
				menuCard: false,
				skin: false,
				listTouchStart: 0,
				listTouchDirection: null,
			};
		},
		methods: {
			clickItem(item){
				uni.showToast({
					icon:"none",
					title:"开发中，请持续关注······",
					duration:2000
				})
			},
			showModal(e) {
				this.modalName = e.currentTarget.dataset.target
			},
			hideModal(e) {
				this.modalName = null
			},
			Gridchange(e) {
				this.gridCol = e.detail.value
			},
			Gridswitch(e) {
				this.gridBorder = e.detail.value
			},
			MenuBorder(e) {
				this.menuBorder = e.detail.value
			},
			MenuArrow(e) {
				this.menuArrow = e.detail.value
			},
			MenuCard(e) {
				this.menuCard = e.detail.value
			},
			SwitchSex(e) {
				this.skin = e.detail.value
			},

			// ListTouch触摸开始
			ListTouchStart(e) {
				this.listTouchStart = e.touches[0].pageX
			},

			// ListTouch计算方向
			ListTouchMove(e) {
				this.listTouchDirection = e.touches[0].pageX - this.listTouchStart > 0 ? 'right' : 'left'
			},

			// ListTouch计算滚动
			ListTouchEnd(e) {
				if (this.listTouchDirection == 'left') {
					this.modalName = e.currentTarget.dataset.target
				} else {
					this.modalName = null
				}
				this.listTouchDirection = null
			}
		}
	}
</script>

<style>
	.page {
		height: 100Vh;
		width: 100vw;
	}

	.page.show {
		overflow: hidden;
	}

	.switch-sex::after {
		content: "\e716";
	}

	.switch-sex::before {
		content: "\e7a9";
	}

	.switch-music::after {
		content: "\e66a";
	}

	.switch-music::before {
		content: "\e6db";
	}
	
	.myList{
		margin-top: 100rpx;
		/* padding-top: 100rpx; */
		/* background-color: #f1f1f1; */
		z-index: 9997;
	}
</style>
