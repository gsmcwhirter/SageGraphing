t = var('t')


def to_bari(ptf_x, ptf_y, ptf_z):
	def newfunc1(s):
		x = ptf_x(t=s)
		y = ptf_y(t=s)
		z = ptf_z(t=s)
	
		return (y - x + 1) / 2
	
	def newfunc2(s):
		x = ptf_x(t=s)
		y = ptf_y(t=s)
		z = ptf_z(t=s)
		
		return -sqrt(3) * (y + x - 1) / 2
		
	return (newfunc1, newfunc2)

p3xt = (exp(3 * t / 4) / 3 * Matrix(RDF, 3, 1, [3, -1, 2/9]) + exp(3 * t / 2) / 9 * Matrix(RDF, 3, 1, [0, 3, -1]) + exp(3 * t) / 81 * Matrix(RDF, 3, 1, [0,0,3])) / (20 * exp(3 * t / 4) / 27 + 2 * exp(3 * t / 2) / 9 + exp(3*t) / 27)
p3x = [p3xt[0][0], p3xt[1][0], p3xt[2][0]]

p4xt = (exp(3 * t / 4) / 6 * Matrix(RDF, 3, 1, [6, -1, 3/5]) + exp(9 * t / 4) / 6 * Matrix(RDF, 3, 1, [0, 1, 3]) - 3 * exp(2 * t) / 5 * Matrix(RDF, 3, 1, [0,0,1])) / (14 * exp(3 * t / 4) / 15 + 2 * exp(9 * t / 4) / 3 - 3 * exp(2*t) / 5)
p4x = [p4xt[0][0], p4xt[1][0], p4xt[2][0]]

p5xt = (exp(2 * t) / 6 * Matrix(RDF, 3, 1, [2, 1, -2]) - 3 * exp(6 * t / 5) / 10 * Matrix(RDF, 3, 1, [-2, 1, -2/3]) + exp(16 * t / 5) / 15 * Matrix(RDF, 3, 1, [1,2,2])) / (exp(2 * t) / 6 + exp(6 * t / 5) / 2 + exp(16 * t / 5) / 3)
p5x = [p5xt[0][0], p5xt[1][0], p5xt[2][0]]

#parametric_plot3d(p3x, (t, 0, 100), thickness=2.)
#parametric_plot3d(p4x, (t, 0, 100), thickness=2.)
#parametric_plot3d(p5x, (t, 0, 100), thickness=2.)

p31 = parametric_plot(to_bari(*p3x), (t, 0, 200), thickness=2.)
p32 = plot(lambda x: 0., xmin=0., xmax=1., thickness=0.5, color='black') + text("$x_1$", (-0.075, 0.), color='black')
p33 = plot(lambda x: sqrt(3) * x, xmin = 0., xmax=0.5, thickness=0.5, color='black') + text("$x_2$", (1.075, 0.), color='black')
p34 = plot(lambda x: sqrt(3) - sqrt(3) * x, xmin=0.5, xmax=1., thickness=0.5, color='black') + text("$x_3$", (0.5, sqrt(3) / 2 + 0.075), color='black')
(p31 + p32 + p33 + p34).show(figsize=6, axes=False, xmin=-0.25, xmax=1.25, ymin=-0.25, ymax=sqrt(3) / 2 + 0.25, filename="./hw4-p3-bari.png")

p35 = plot(p3x[0], t, xmin=0, xmax=100, color='red')
p36 = plot(p3x[1], t, xmin=0, xmax=100, color='blue')
p37 = plot(p3x[2], t, xmin=0, xmax=100, color='green')
(p35 + p36 + p37).show(figsize=6, axes=True, axes_labels=("$t$","$x_i$"), xmin=-0.25, xmax=10.25, ymin=-0.25, ymax=1.25, filename="./hw4-p3-sep.png")

p41 = parametric_plot(to_bari(*p4x), (t, 0, 200), thickness=2.)
p42 = plot(lambda x: 0., xmin=0., xmax=1., thickness=0.5, color='black') + text("$x_1$", (-0.075, 0.), color='black')
p43 = plot(lambda x: sqrt(3) * x, xmin = 0., xmax=0.5, thickness=0.5, color='black') + text("$x_2$", (1.075, 0.), color='black')
p44 = plot(lambda x: sqrt(3) - sqrt(3) * x, xmin=0.5, xmax=1., thickness=0.5, color='black') + text("$x_3$", (0.5, sqrt(3) / 2 + 0.075), color='black')
(p41 + p42 + p43 + p44).show(figsize=6, axes=False, xmin=-0.25, xmax=1.25, ymin=-0.25, ymax=sqrt(3) / 2 + 0.25, filename="./hw4-p4-bari.png")

p45 = plot(p4x[0], t, xmin=0, xmax=100, color='red')
p46 = plot(p4x[1], t, xmin=0, xmax=100, color='blue')
p47 = plot(p4x[2], t, xmin=0, xmax=100, color='green')
(p45 + p46 + p47).show(figsize=6, axes=True, axes_labels=("$t$","$x_i$"), xmin=-0.25, xmax=10.25, ymin=-0.25, ymax=1.25, filename="./hw4-p4-sep.png")

p51 = parametric_plot(to_bari(*p5x), (t, 0, 200), thickness=2.)
p52 = plot(lambda x: 0., xmin=0., xmax=1., thickness=0.5, color='black') + text("$x_1$", (-0.075, 0.), color='black')
p53 = plot(lambda x: sqrt(3) * x, xmin = 0., xmax=0.5, thickness=0.5, color='black') + text("$x_2$", (1.075, 0.), color='black')
p54 = plot(lambda x: sqrt(3) - sqrt(3) * x, xmin=0.5, xmax=1., thickness=0.5, color='black') + text("$x_3$", (0.5, sqrt(3) / 2 + 0.075), color='black')
(p51 + p52 + p53 + p54).show(figsize=6, axes=False, xmin=-0.25, xmax=1.25, ymin=-0.25, ymax=sqrt(3) / 2 + 0.25, filename="./hw4-p5-bari.png")

p55 = plot(p5x[0], t, xmin=0, xmax=100, color='red')
p56 = plot(p5x[1], t, xmin=0, xmax=100, color='blue')
p57 = plot(p5x[2], t, xmin=0, xmax=100, color='green')
(p55 + p56 + p57).show(figsize=6, axes=True, axes_labels=("$t$","$x_i$"), xmin=-0.25, xmax=10.25, ymin=-0.25, ymax=1.25, filename="./hw4-p5-sep.png")

