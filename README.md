# 在DGActivityIndicatorView第三方库基础上进行修改封装
<a href="https://github.com/gontovnik/DGActivityIndicatorView
">DGActivityIndicatorView</href>

#动画类型:
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<style>
#header
{
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
	width:100%;
	border-collapse:collapse;
}
#header td, #header th 
{
	font-size:1em;
	border:1px solid #98bf21;
	padding:3px 7px 2px 7px;
}
#header th 
{
	font-size:1.1em;
	text-align:left;
	padding-top:5px;
	padding-bottom:4px;
	background-color:#A7C942;
	color:#ffffff;
}
#header tr.alt td 
{
	color:#000000;
	background-color:#EAF2D3;
}
</style>
<table id="header">
<tr >
 <th>动画类型1</th>
 <th>动画类型2</th>
 <th>动画类型3</th>
 <th>动画类型4</th>
</tr>

<tr >
   <td>EBTDGActivityIndicatorAnimationTypeNineDots</td>
   <td>EBTDGActivityIndicatorAnimationTypeTriplePulse</td>
   <td>EBTDGActivityIndicatorAnimationTypeFiveDots</td>
   <td>EBTDGActivityIndicatorAnimationTypeRotatingSquares</td>
  
</tr>

<tr  class="alt">
       <td>EBTDGActivityIndicatorAnimationTypeDoubleBounce</td>
       <td>EBTDGActivityIndicatorAnimationTypeTwoDots</td>
       <td>EBTDGActivityIndicatorAnimationTypeThreeDots</td>
       <td>EBTDGActivityIndicatorAnimationTypeBallPulse</td>
</tr>

<tr >
<td>EBTDGActivityIndicatorAnimationTypeBallClipRotate</td>
<td>EBTDGActivityIndicatorAnimationTypeBallClipRotatePulse</td>
<td>EBTDGActivityIndicatorAnimationTypeBallClipRotateMultiple</td>
<td>EBTDGActivityIndicatorAnimationTypeBallRotate</td>
</tr>

<tr class="alt">
<td>EBTDGActivityIndicatorAnimationTypeBallZigZag</td>
<td>EBTDGActivityIndicatorAnimationTypeBallZigZagDeflect</td>
<td>EBTDGActivityIndicatorAnimationTypeBallTrianglePath</td>
<td>EBTDGActivityIndicatorAnimationTypeBallScale</td>
</tr>

<tr >
<td>EBTDGActivityIndicatorAnimationTypeLineScale</td>
<td>EBTDGActivityIndicatorAnimationTypeLineScaleParty</td>
<td>EBTDGActivityIndicatorAnimationTypeBallScaleMultiple</td>
<td>EBTDGActivityIndicatorAnimationTypeBallPulseSync</td>
</tr>

<tr class="alt">
<td>EBTDGActivityIndicatorAnimationTypeBallBeat</td>
<td>EBTDGActivityIndicatorAnimationTypeLineScalePulseOut</td>
<td>EBTDGActivityIndicatorAnimationTypeLineScalePulseOutRapid</td>
<td>EBTDGActivityIndicatorAnimationTypeBallScaleRipple</td>
</tr>

<tr >
<td>EBTDGActivityIndicatorAnimationTypeBallScaleRippleMultiple</td>
<td>EBTDGActivityIndicatorAnimationTypeTriangleSkewSpin</td>
<td>EBTDGActivityIndicatorAnimationTypeBallGridBeat</td>
<td>EBTDGActivityIndicatorAnimationTypeBallGridPulse</td>
</tr>

<tr class="alt">
<td>EBTDGActivityIndicatorAnimationTypeRotatingSanEBTDGlass</td>
<td>EBTDGActivityIndicatorAnimationTypeRotatingTrigons</td>
<td>EBTDGActivityIndicatorAnimationTypeTripleRings</td>
<td>EBTDGActivityIndicatorAnimationTypeCookieTerminator</td>
</tr>
<tr >
<td>EBTDGActivityIndicatorAnimationTypeBallSpinFadeLoader</td>
<td></td>
<td></td>
<td></td>
</tr>

</table>

#使用方法:
##显示指示器
```
[EBTDGActivityInidcatorView showActivityIndicatorView:EBTDGActivityIndicatorAnimationTypeTwoDots
withIndicatorColor:[UIColor redColor]
 withDescription:@"请求数据加载中..."];

```
##移除指示器
```
[EBTDGActivityInidcatorView dismissActivityIndicatorView];
```
#效果演示图1:
![Image](https://github.com/KBvsMJ/EBTActivityIndicatorViewDemo/blob/master/demogif/1.gif)



#效果演示图2:
![Image](https://github.com/KBvsMJ/EBTActivityIndicatorViewDemo/blob/master/demogif/2.gif)


#效果演示图3:
![Image](https://github.com/KBvsMJ/EBTActivityIndicatorViewDemo/blob/master/demogif/3.gif)

#效果演示图4:
![Image](https://github.com/KBvsMJ/EBTActivityIndicatorViewDemo/blob/master/demogif/4.gif)


#效果演示图5:
![Image](https://github.com/KBvsMJ/EBTActivityIndicatorViewDemo/blob/master/demogif/5.gif)
