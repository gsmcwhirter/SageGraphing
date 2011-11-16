y,m = var('y,m')

fy = plot(y, y, xmin=-2, xmax=4, color='red') + text("$f(y) = y$", (2,2.5), color='red')
flny = plot(ln(1+y), y, xmin=-1, xmax=4, color='blue') + text("$f(y) = \\ln(1+y)$", (3, 1), color='blue')
fylny = plot((1+y) * ln(1 + y), y, xmin=-1, xmax=4, color='blue') + text("$f(y) = (1+y)\\ln(1+y)$", (1, 3.25), color='blue')
f2y = plot(2 * y, y, xmin=-2, xmax=4, color='red') + text("$f(y) = 2y$", (2,2.5), color='red')
fy2 = plot(0.5 * y, y, xmin=-2, xmax=4, color='red') + text("$f(y) = \\frac{y}{2}$", (3,2), color='red')
fyp1 = plot(1 + y, y, xmin=-2, xmax=4, color='red') + text("$f(y) = 1 + y$", (1.5,3.5), color='red')
fym1 = plot(-1 + y, y, xmin=-2, xmax=4, color='red') + text("$f(y) = -1 + y$", (1.5,1.5), color='red')

(fy + flny).show(axes_labels=("$y$","$f(y)$"), figsize=6, xmin=-2, xmax=4, ymin=-2, ymax=4, filename="./hw2-p3-ylny.png")
(fy + fylny).show(axes_labels=("$y$","$f(y)$"), figsize=6, xmin=-2, xmax=4, ymin=-2, ymax=4, filename="./hw2-p3-yylny.png")
(f2y + flny).show(axes_labels=("$y$","$f(y)$"), figsize=6, xmin=-2, xmax=4, ymin=-2, ymax=4, filename="./hw2-p3-2ylny.png")
(fy2 + flny).show(axes_labels=("$y$","$f(y)$"), figsize=6, xmin=-2, xmax=4, ymin=-2, ymax=4, filename="./hw2-p3-y2lny.png")
(fyp1 + flny).show(axes_labels=("$y$","$f(y)$"), figsize=6, xmin=-2, xmax=4, ymin=-2, ymax=4, filename="./hw2-p3-yp1lny.png")
(fym1 + flny).show(axes_labels=("$y$","$f(y)$"), figsize=6, xmin=-2, xmax=4, ymin=-2, ymax=4, filename="./hw2-p3-ym1lny.png")

asymp = plot(lambda x: -1., xmin=-10, xmax=10, color='green', linestyle=':')

f = m + y - ln(1 + y)
punstable = implicit_plot(f == 0, (m, -6, 2), (y, 0, 10), frame=False, linestyle='--')
pstable = implicit_plot(f == 0, (m, -6, 2), (y, -1, 0), frame=False, plot_points=1e3)
(punstable + pstable + asymp).show(figsize=6, xmin=-6, xmax=2, ymin=-2, ymax=10, axes_labels=("$\mu$","$y_c$"), axes=True, filename="./hw2-p3-a.png")

g = m * y - ln(1 + y)
pstable1 = plot(lambda x: 0., xmin=-6, xmax=1, ymin=-1, ymax=10, color='red', thickness=2.)
pstable2 = implicit_plot(g==0, (m, 1, 6), (y, -1, 0), frame=False, plot_points=1e3, color='red')
punstable1 = plot(lambda x: 0., xmin=1, xmax=6, ymin=1, ymax=10, color='red', linestyle='--', thickness=2.)
punstable2 = implicit_plot(g==0, (m,-6,1), (y, 0, 10), frame=False, plot_points=1e3, color='red', linestyle='--')
(pstable1 + pstable2 + punstable1 + punstable2 + asymp).show(figsize=6, xmin=-2, xmax=6, ymin=-2, ymax=10, axes_labels=("$\mu$","$y_c$"), axes=True, filename="./hw2-p3-b.png")
