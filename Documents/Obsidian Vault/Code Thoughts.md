---
title: Code Thoughts
slug: code-thoughts
cover: ""
categories: []
tags: []
halo:
  site: https://blog.flpflan.moe
  name: 4a94a9da-7dc0-4108-b399-339c6fe31c57
  publish: false
---
# 区分指针变量与数组变量

虽然经常说数组变量其实就是指向数组首个元素的指针，但两者实际上是不同的东西。指针作为指向目的地址的变量，其本身也要占据一定内存空间，而数组作为一段连续的储存空间，声明时的变量其实就是首元素的地址本身，相当于起了个别名，这个别名本身不占用内存空间，访问时也不需要间址。

例如：

```c
struct A {
	int len;
	int *arr;
}
struct B {
	int len;
	int arr[];
}
```

这里 sizeof A = 16, alignment = 8 而 sizeof B = 4, alignment = 4

# OOP 和 ECS

当决定 OOP 的时候要进行纵向思维，即“谁是组件的拥有者“，比如 X 拥有 Y ，Y 拥有 Z。
而 ECS 中要扁平化思维，即”这个组件拥有什么“,比如 X 拥有 Y 和 Z。rust 是非 OOP 的，因此偏向后者。