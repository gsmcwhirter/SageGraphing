import matplotlib.ticker

c,k,r,t = var('c,k,r,t')

y = k*c*exp(r*t) / (1 + c*exp(r*t))
y2 = y(k=1,r=1)

ic1 = y2(c=1)
ic2 = y2(c=-2)

pic1 = ic1.plot(t, color='red', xmin=-10, xmax=10, detect_poles="show") + text("$y(0) = \\frac{K}{2}$", (2, 0.5), color='red')
pic2 = ic2.plot(t, color='blue', xmin=-10, xmax=10, detect_poles="show") + text("$y(0) = 2K$", (3, 1.25), color='blue')

asymp0 = plot(lambda x: 0., color='green', xmin=-10, xmax=10, linestyle='--', thickness=2.) + text("$y=0$", (2,-0.125), color='green')
asympK = plot(lambda x: 1., color='green', xmin=-10, xmax=10, linestyle='--', thickness=2.) + text("$y=K$", (-3, 1.125), color='green')

(pic1 + pic2 + asymp0 + asympK).show(ymin=-2, ymax=2, axes_labels=('$t$','$y$'), ticks=(None, matplotlib.ticker.FixedLocator([0,0.5,1,2])), tick_formatter=(matplotlib.ticker.NullFormatter(), matplotlib.ticker.FixedFormatter(['0','K/2','K','2K'])), figsize=6, filename='./hw2-p1.png')
