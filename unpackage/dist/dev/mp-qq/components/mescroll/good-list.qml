<view class="pd-list"><block wx:for="{{list}}" wx:for-item="pd" wx:for-index="__i0__" wx:key="id"><view data-event-opts="{{[['tap',[['openNewsDetail',['$0'],[[['list','id',pd.id,'id']]]]]]]}}" class="pd-li" bindtap="__e"><image class="pd-img" src="{{pd.pdImg}}" mode="aspectFit"></image><view class="pd-detail"><view class="pd-name">{{pd.pdName}}</view><text class="pd-sold">{{"浏览次数 "+pd.pdSold}}</text></view></view></block></view>