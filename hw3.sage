b,m,r,y = var('b,m,r,y')

dy1 = -y + b*tanh(y)
dy2 = m - cosh(y)
dy3 = y - r*y*(1-y)

plot1z1 = plot(lambda x: 0., xmin=-10, xmax=1, thickness=2.)
plot1z2 = plot(lambda x: 0., xmin=1, xmax=10, thickness=2., linestyle='--')
plot1nz1 = implicit_plot(dy1==0, (b, -10, 10), (y, -10, -0.1), frame=False)
plot1nz2 = implicit_plot(dy1==0, (b, -10, 10), (y, 0.1, 10), frame=False)

(plot1z1 + plot1z2 + plot1nz1 + plot1nz2).show(axes=True, axes_labels=("$\\beta$","$y_c$"), figsize=6, filename="./hw3-p1.png")

plot2pos = implicit_plot(dy2==0, (m,1,4), (y, 0, 10), frame=False)
plot2neg = implicit_plot(dy2==0, (m,1,4), (y,-10, 0), frame=False, linestyle='--')

(plot2pos + plot2neg).show(xmin=-1, xmax=3, ymin=-3, ymax=3, axes=True, axes_labels=("$\mu$","$y_c$"), figsize=6, filename="./hw3-p2.png")

plot3s1 = plot(lambda x: 0., xmin=1, xmax=10, thickness=2.)
plot3u1 = plot(lambda x: 0., xmin=-10, xmax=1, thickness=2., linestyle='--')
plot3s21 = implicit_plot(dy3==0, (r, -10, 1), (y, 0.1, 10), frame=False)
plot3s22 = implicit_plot(dy3==0, (r, -10, 1), (y, -10, -0.1), frame=False)
plot3u2 = implicit_plot(dy3==0, (r, 1, 10), (y, -10, 10), frame=False, linestyle='--')

(plot3s1 + plot3u1 + plot3s21 + plot3s22 + plot3u2).show(axes=True, axes_labels=("$r$","$y_c$"), figsize=6, filename="./hw3-p3.png")
