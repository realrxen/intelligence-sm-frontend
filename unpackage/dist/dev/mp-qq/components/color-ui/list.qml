<view class="myList"><view class="{{['cu-list grid','col-'+gridCol,gridBorder?'':'no-border']}}"><block wx:for="{{cuIconList}}" wx:for-item="item" wx:for-index="index" wx:key="index"><block wx:if="{{index<gridCol*2}}"><view class="cu-item"><view data-event-opts="{{[['tap',[['clickItem',['$0'],[[['cuIconList','',index]]]]]]]}}" class="{{['cuIcon-'+item.cuIcon,'text-'+item.color]}}" bindtap="__e"><block wx:if="{{item.badge!=0}}"><view class="cu-tag badge"><block wx:if="{{item.badge!=1}}"><block>{{item.badge>99?'99+':item.badge}}</block></block></view></block></view><text>{{item.name}}</text></view></block></block></view></view>