# Chapter6

## 数组的索引

```
s = 'abcde'

negtiveRange = range(-1, -len(s) - 1, -1)
positiveRange = range(0, len(s))

print s
for i in negtiveRange:
    print 's[%d]:%s' % (i, s[i]),

print '\n'
for i in positiveRange:
    print 's[%d]:%s' % (i, s[i]),
    
输出:
abcde
s[-1]:e s[-2]:d s[-3]:c s[-4]:b s[-5]:a 

s[0]:a s[1]:b s[2]:c s[3]:d s[4]:e
```

关键理解最后一个字符的索引，可以是-1，也可以是4. 每一个字符的索引都可以是负数。这一点方便反向遍历。

对于切片，

```
negtiveRange = [None] + negtiveRange

print negtiveRange
for i in negtiveRange:
    print s[:i]
    
输出:
[None, -1, -2, -3, -4, -5]
abcde
abcd
abc
ab
a
```

这里要特别注意None的用法，因为数组的最后一个元素的索引是-1，那么-1之后是什么，可以用None来代表，也可以使用len(s)+1. 但是使用None,显得更加优雅。 下面是:

```
print s[0:len(s)+1]
print s[0:None]
print s[-1:-len(s)-1:-1]
print s[-1:None:-1]

输出:
abcde
abcde
edcba
edcba
```
## 字符串
在python中，没有字符这个概念，所以都是字符串。 内建函数 str 将一个对象转换成字符串。注意这个函数是将一个对象转换成最好的字符串表示方式。

```
print  str(range(4))

输出：
[0, 1, 2, 3]
```

字符串可以直接按照Ascii进行比较。

```
x = 'abc'
y = 'aBc'

print x < y

输出:
False
```

```
# 判断字符串是否包含另外的字符串
print 'ab' in 'cabde', 'ab' not in '123'

输出:
True True
```

字符串连接，虽然+可以实现字符串连接，但是没有下面的方式性能好.

```
strJ = '%s%s' % ('ab', 'cd')
print strJ

strJ2 = ''.join(('abddd', 'cd'))
print strJ2

输出:
abcd
abdddcd
```

另外的长的字符串分行写:

```
print 'kkk''jjj'
```

## 字符串模板
一些常用的字符串格式，可以使用字符串模板来搞定。

## 原始字符的保留

```
print r'\n'

输出:
\n
```
在字符串前面加'\n'，因为有很多时候需要保留原始字符串，例如文件路径中的\n等等。这种情况使用 在字符串前面增加r就可以了。

## zip函数

```
print zip('abc', '123')

输出:
[('a', '1'), ('b', '2'), ('c', '3')]

```

## ''' 三个引号的字符串
三个引号的字符串和r起到的作用是一样的。可以防止特殊字符。例如html或者sql.

## 关于unicode编码
如果文件中使用了 ```# coding:utf-8``` 那么，则文件中的就是unicode,如果没有这个标志，那么需要 u'你的字符串' 并进行 .encode('utf-8')这种方式来处理。

unicode 规则:

* 程序中出现字符串时一定要加个前缀u.

失误 #1: 你必须在一个极有限的时间内写出一个大型的应用,而且需要其他语言的支持, 但是产品经理并没有明确定义这一点。你并没有考虑 Unicode 的兼容,直到项目快要结束... ,






格式化时候，要先变成unicode:

```
u"%s %s" % (u"abc", "abc")   u"abc abc"
```

## 元组
元组是有隐性元组和显性元组，正常来讲我们都应该使用显性元组。

```
# 显性和隐性元组
x, y = 1, 2

(a, b) = (3, 4)
print x, y, a, b
```
对于x,y来说，其实就是隐性元组。

只有一个元素的元组呢 ('xyz') 这不是一个元组而是一个字符串，要表示一个元素的元组是 ('xyz',) 这才是表示一个元素的元组。列表和元组之间的转换 list()和tuple().

## 浅拷贝和深拷贝
对于像数字，字符串等都是所谓的“深拷贝”是没有浅拷贝的说法。元组的内容都是数字或者字符串也是同样的。但是对于列表来说，就要注意深拷贝和浅拷贝的根本区别。