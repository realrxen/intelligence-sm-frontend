<template>
	<view>
		<view style="padding-bottom: 101rpx;">
			<view class="header" v-bind:class="{'status':isH5Plus}">
				<view class="userinfo">
					<view class="face"><image :src="userinfo.face"></image></view>
					<view class="info">
						<view class="username">{{userinfo.username}}</view>
						<view class="integral">团支部:{{userinfo.integral}}</view>
					</view>
				</view>
				<view class="setting"><image src="../../static/HM-PersonalCenter/setting.png"></image></view>
			</view>
			<view class="orders">
				<view class="box">
					<view class="label" v-for="(row,index) in orderTypeLise" :key="row.name" hover-class="hover"  @tap="toOrderType(index)">
						<view class="icon"><view class="badge" v-if="row.badge>0">{{row.badge}}</view><image :src="'../../static/HM-PersonalCenter/'+row.icon"></image></view>
						{{row.name}}
					</view>
				</view>
			</view> 
			<view class="list" v-for="(list,list_i) in severList" :key="list_i">
				<view class="li" v-for="(li,li_i) in list" @tap="toPage(list_i,li_i)" v-bind:class="{'noborder':li_i==list.length-1}"  hover-class="hover" :key="li.name" >
					<view class="icon"><image :src="'../../static/HM-PersonalCenter/sever/'+li.icon"></image></view>
					<view class="text">{{li.name}}</view>
					<image class="to" src="../../static/HM-PersonalCenter/to.png"></image>
				</view>
			</view>
		</view>
		
		<BottomBar :tIndex="4"></BottomBar>
	</view>
</template>
<script>
	import BottomBar from "../../components/color-ui/bottombar.vue"
	export default {
		components:{
			BottomBar
		},
		data() {
			return {
				//#ifdef APP-PLUS
				isH5Plus:true,
				//#endif
				//#ifndef APP-PLUS
				isH5Plus:false,
				//#endif
				userinfo:{},
				orderTypeLise:[
					//name-标题 icon-图标 badge-角标
					{name:'消息通知',icon:'l4.png',badge:5},
					{name:'浏览历史',icon:'l2.png',badge:0},
					// {name:'',icon:'l3.png',badge:0},
					{name:'我的收藏',icon:'l1.png',badge:0},
					{name:'个人中心',icon:'l5.png',badge:0}
				],
				severList:[
					[
						{name:'预约咨询',icon:'point.png'},
						{name:'联系方式',icon:'quan.png'},
						{name:'班级风采',icon:'momey.png'},
						{name:'志愿查询',icon:'renw.png'},
					],
					[
						{name:'文件整理',icon:'mingxi.png'},
						{name:'回音壁',icon:'choujiang.png'},
						// {name:'收货地址',icon:'addr.png'},
						{name:'在线客服',icon:'kefu.png'},
						{name:'更新日志',icon:'bank.png'},
						{name:'关于我们',icon:'security.png'},
					]
				],
			};
		},
		onLoad() {
			//加载
			this.init();
		},
		methods: {
			init() {
				//用户信息
				this.userinfo={
					face:'https://dss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=394880243,797020693&fm=179&app=42&f=JPEG?w=121&h=140&s=21B7EF36620052E56B0BECAE0300706B',
					username:"电商2017级",
					integral:"电商17-1班"
				}		
			},
			//用户点击订单类型
			toOrderType(index){
				uni.showToast({title: this.orderTypeLise[index].name});
			},
			//用户点击列表项
			toPage(list_i,li_i){
				uni.showToast({title: this.severList[list_i][li_i].name});
			}
		}
	}
</script>

<style lang="scss">
page{background-color:#fff}
.header{
	&.status{padding-top:var(--status-bar-height);}
	background-color:#ff0000;width:100%;height:30vw;padding:0 4%;display:flex;align-items:center;
	.userinfo{
		width:90%;display:flex;
		.face{flex-shrink:0;width:15vw;height:15vw;
			image{width:100%;height:100%;border-radius:100%;background-color: #FF0000;}
		}
		.info{
			display:flex;flex-flow:wrap;padding-left:30upx;
			.username{width:100%;color:#fff;font-size:40upx}
			.integral{display:flex;align-items:center;padding:0 20upx;height:40upx;color:#fff;background-color:rgba(0,0,0,0.1);border-radius:20upx;font-size:24upx}
		}
	}
	.setting{
		flex-shrink:0;width:6vw;height:6vw;
		image{width:100%;height:100%}
	}
}
.hover{background-color:#eee}
.orders{
	background-color:#ff0000;width:100%;height:11vw;padding:0 4%;margin-bottom:calc(11vw + 40upx);display:flex;align-items:flex-start;border-radius:0 0 100% 100%;margin-top: -1upx;
	.box{
		width:98%;padding:0 1%;height:22vw;background-color:#fefefe;border-radius:24upx;box-shadow:0 0 20upx rgba(0,0,0,0.15);margin-bottom:40upx;display:flex;align-items:center;justify-content:center;
		.label{
			display:flex;align-items:center;justify-content:center;flex-flow:wrap;width:100%;height:16vw;color:#666666;font-size:26upx;
			.icon{
				position:relative;width:7vw;height:7vw;margin:0 1vw;
				.badge{position:absolute;width:4vw;height:4vw;background-color:#ec6d2c;top:-1vw;right:-1vw;border-radius:100%;font-size:20upx;color:#fff;display:flex;align-items:center;justify-content:center;z-index: 10;}
				image{width:7vw;height:7vw;z-index: 9;}
			}
		}
	}
}
.list{
	width:100%;border-bottom:solid 26upx #f1f1f1;
	.li{
		width:100%;height:100upx;padding:0 4%;border-bottom:solid 1upx #e7e7e7;display:flex;align-items:center;
	&.noborder{border-bottom:0}
		.icon{
			flex-shrink:0;width:50upx;height:50upx;
			image{width:50upx;height:50upx}
		}
		.text{padding-left:20upx;width:100%;color:#666}
		.to{flex-shrink:0;width:40upx;height:40upx}
	}
}
</style>
