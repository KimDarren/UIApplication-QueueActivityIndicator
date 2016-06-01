UIApplication+QueueActivityIndicator
======================
<!--![CocoaPods](https://cocoapod-badges.herokuapp.com/v/DRNSnackBar/badge.png)-->

Extension of `UIApplication` to manage _networkActivityIndicatorVisible_.

<!--Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UIApplication+QueueActivityIndicator'
```
-->
Usage
-----

* Push

	```obj-c
	[[UIApplication sharedApplication] pushActivityIndicator];
	```

* Pop
	
	```obj-c
	[[UIApplication sharedApplication] popActivityIndicator];
	```

How it works
------------

* Push
	- Increase the count when you push the activity indicator.
	- Set _networkActivityIndicatorVisible_ to YES, if the count is greater than 0.
* Pop
	- Decrease the count when you pop the activity indicator.
	- Set _networkActivityIndicatorVisible_ to NO, if the count is ~~less than or~~ equal to 0.

License
-------

**UIApplication+QueueActivityIndicator** is under MIT license. See [LICENSE](LICENSE) file for more info.
