<view style="{{(cardObj.isLast?'padding-bottom: 101rpx;':'')}}"><block wx:if="{{showBar}}"><view class="{{['cu-bar bg-white solid-bottom',cardObj.isFirst?'margin-top-sm':'']}}" style="margin-bottom:-30rpx;border-radius:20rpx 20rpx 0 0;"><view class="action"><text class="{{['text-'+cardObj.color,'cuIcon-'+cardObj.icon]}}"></text>{{''+cardObj.name+''}}</view><view data-event-opts="{{[['tap',[['moreNews',['$0'],['cardObj']]]]]}}" class="moreNews" bindtap="__e"><view class="news_content">更多</view><view class="cuIcon-right news-icon"></view></view></view></block><block wx:for="{{newsList}}" wx:for-item="news" wx:for-index="index" wx:key="index"><view data-event-opts="{{[['tap',[['goToNewsDetail',['$0'],[[['newsList','',index]]]]]]]}}" class="{{['cu-card article',isCard?'no-card':'']}}" bindtap="__e"><view class="cu-item shadow"><view class="title"><view class="text-cut">{{news.title}}</view></view><view class="content"><image src="{{news.cover}}" mode="aspectFill"></image><view class="desc"><view class="text-content">{{news.summary}}</view><view><block wx:for="{{news.tags}}" wx:for-item="tag" wx:for-index="index2" wx:key="index2"><view class="{{['cu-tag light sm round',(index2===0)?'bg-red':'',(index2===1)?'bg-green':'',(index2===2)?'bg-blue':'']}}">{{tag.name}}</view></block></view></view></view></view></view></block><cut-line vue-id="1" bind:__l="__l"></cut-line></view>