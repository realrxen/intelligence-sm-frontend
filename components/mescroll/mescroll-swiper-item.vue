<template>
	<!-- 
	swiper中的transfrom会使fixed失效,此时用height="100%"固定高度; 
	swiper中无法触发mescroll-mixins.js的onPageScroll和onReachBottom方法,只能用mescroll-uni,不能用mescroll-body
	-->
	 <mescroll-uni ref="mescrollRef" @init="mescrollInit" height="100%" top="60" :down="downOption" @down="downCallback" :up="upOption" @up="upCallback" @emptyclick="emptyClick">
		<!-- 数据列表 -->
		<good-list :list="goods" :pageHelper="myPageHelper" @openNewsDetail="openNewsDetail"></good-list>
	</mescroll-uni>
</template>

<script>
	import common from '../../common/js/common.js'
	var serverUrl = common.serverUrl
	import MescrollMixin from "@/components/mescroll-uni/mescroll-mixins.js";
	import MescrollMoreItemMixin from "@/components/mescroll-uni/mixins/mescroll-more-item.js";
	import GoodList from "@/components/mescroll/good-list.vue";
	import {apiSearch} from "@/api/mock.js"
	
	export default {
		mixins: [MescrollMixin,MescrollMoreItemMixin], // 注意此处还需使用MescrollMoreItemMixin (必须写在MescrollMixin后面)
		components: {
			GoodList
		},
		data() {
			return {
				downOption:{
					auto:true // 自动加载 (mixin已处理第一个tab触发downCallback)
				},
				upOption:{
					auto:false, // 不自动加载
					// page: {
					// 	num: 0, // 当前页码,默认0,回调之前会加1,即callback(page)会从1开始
					// 	size: 10 // 每页数据的数量
					// },
					noMoreSize: 4, //如果列表已无数据,可设置列表的总数量要大于半页才显示无更多数据;避免列表数据过少(比如只有一条数据),显示无更多数据会不好看; 默认5
					empty:{
						tip: '~ 空空空空如也 ~', // 提示
						btnText: '再试一次'
					}
				},
				goods: [] ,//列表数据
				myPageHelper:{}
				
			}
		},
		props:{
			tabs: Array // tab菜单,此处用于取关键词
		},
		methods: {
			/*
			打开详情页方法
			*/
			openNewsDetail(data){
				this.$emit('openNewsDetail',data)
			},
			/*下拉刷新的回调 */
			downCallback() {
				// 这里加载你想下拉刷新的数据, 比如刷新轮播数据
				// loadSwiper();
				// 下拉刷新的回调,默认重置上拉加载列表为第一页 (自动执行 page.num=1, 再触发upCallback方法 )
				this.mescroll.resetUpScroll()
			},
			/*上拉加载的回调: 其中page.num:当前页 从1开始, page.size:每页数据条数,默认10 */
			upCallback(page) {
				//联网加载数据
				uni.request({
					url:serverUrl+'/news/'+this.i+'?currentNum='+page.num+'&size=10',
					method:'GET',
					success: (res) => {
						// debugger
						if(res.data.code===0){
							this.myPageHelper = res.data.data
							this.mescroll.endSuccess(this.myPageHelper.pageSize,this.myPageHelper.hasNextPage);
							//设置列表数据
							if(page.num == 1) this.goods = []; //如果是第一页需手动制空列表
							this.goods=this.goods.concat(this.myPageHelper.list); //追加新数据
							// if(!this.myPageHelper.hasNextPage){
							// 	uni.showToast({
							// 		icon:"none",
							// 		title:"已加载最新~",
							// 		duration:2000
							// 	})
							// }
						}
						
					}
				})
				// debugger
				// let keyword = this.tabs[this.i]
				// apiSearch(page.num, page.size, keyword).then(curPageData=>{
				// 	//联网成功的回调,隐藏下拉刷新和上拉加载的状态;
				// 	console.log(curPageData)
				// 	debugger
				// 	this.mescroll.endSuccess(curPageData.length);
				// 	//设置列表数据
				// 	if(page.num == 1) this.goods = []; //如果是第一页需手动制空列表
				// 	this.goods=this.goods.concat(curPageData); //追加新数据
				// }).catch(()=>{
				// 	//联网失败, 结束加载
				// 	this.mescroll.endErr();
				// })
			},
			//点击空布局按钮的回调
			emptyClick(){
				// uni.showToast({
				// 	title:'点击了按钮,具体逻辑自行实现'
				// })
			}
		}
	}
</script>
