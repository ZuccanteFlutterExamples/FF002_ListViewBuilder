# ListView example
This example shows how `ListView.builder` constructor helps improving performances by lazy loading all the widgets.

You can check the docs in the [Flutter cookbook](https://docs.flutter.dev/cookbook/lists/long-lists).

## The showcase
To show the performance gap, the home page contains a `BottomNavigationBar` which contains two tabs. 
The first one contains a list of heavy animation widgets of length 10000, while the second one contain the same list of length 100.
The difference is that the first one uses a `ListView.builder` widget and the second one uses a `SingleChildScrollView` which 
should be used for short static lists, like a settings page or a dashboard.

## Learn more
To learn more check out this video [ListView](https://www.youtube.com/watch?v=KJpkjHGiI5A).