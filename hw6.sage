import scipy
from scipy import integrate
import numpy.random as random

# Defining the systems ########################################################
def prob1(m):
    def F(y,t):
        return [y[1], m * (1- y[0]^2) * y[1] - y[0]]
    def J(y,t):
        return [[0, 1],[-2 * m * y[0] * y[1] - 1, m * (1 - y[0]^2)]]
    
    return [F,J]

def prob2(c): 
    def F(y,t):
        return [y[1] - 0.3 * y[0], c * y[0] - y[0]^3]
    def J(y,t):
        return [[-0.3, 1],[c - 3 * y[0]^2, 0]]
    
    return [F,J]

def prob3(m):
    rsq = lambda y: y[0]^2 + y[1]^2
    r = lambda y: sqrt(rsq(y))
    
    def F(y,t):
        return [m * y[0] + y[1] + y[0] * (rsq(y) - (rsq(y))^2), -y[0] + m * y[1] + y[1] * (rsq(y) - (rsq(y))^2)]
    def J(y,t):
        return [[m + rsq(y) - (rsq(y))^2 + 4 * y[0]^2 * r(y) - 8 * y[0] * rsq(y) * r(y), 1 + 4 * r(y) * y[0] * y[1] - 8 * rsq(y) * r(y) * y[0] * y[1]],[-1 + 4 * r(y) * y[0] * y[1] - 8 * rsq(y) * r(y) * y[0] * y[1], m + rsq(y) - (rsq(y))^2 + 4 * y[1]^2 * r(y) - 8 * y[1] * rsq(y) * r(y)]]    

    return [F,J]

def prob4(a, b):
    def F(y,t):
        return [a * y[0] + b * y[0]^3, -y[1]]
    def J(y,t):
        return [[a + 3 * b * y[0]^2, 0], [0, -1]]

    return [F,J]

def prob5():
    def F(y,t):
        return [y[1], y[0] + y[0]*y[1] - y[0]^3]
    def J(y,t):
        return [[0, 1],[1 + y[1] - 3 * y[0]^2, y[0]]]
    return [F,J]

# Function that does the graphing work ########################################
def random_trajectories(pdata, x, number=10, stddev=1, mean=(0,0), manual_pts=None, thickness=0.5, rgbcolor=(0,0,1)):
    real_num = len(manual_pts) if manual_pts is not None else number
    print real_num
    
    for i in xrange(real_num):
        if manual_pts is None:
            init_cond = random.multivariate_normal(list(mean), [[stddev,0],[0,stddev]])
        else:
            init_cond = manual_pts[i]
        print init_cond
        y = integrate.odeint(pdata[0], init_cond, x, Dfun=pdata[1])
        pts = [(y[j][0], y[j][1]) for j in xrange(len(x))]
        pl = list_plot(pts, plotjoined=True, thickness=thickness, rgbcolor=rgbcolor)
        if i == 0:
            _plot = pl
        else:
            _plot = _plot + pl

    return _plot

# Set up the functions ########################################################
x = scipy.arange(0,100,.1)

p1d1 = prob1(-0.5)
p1d2 = prob1(0.5)
p2d1 = prob2(-2)
p2d2 = prob2(2)
p3d1 = prob3(-0.5)
p3d2 = prob3(-0.125)
p3d3 = prob3(0.25)
p4d1 = prob4(-1, 1)
p4d2 = prob4(1, 1)
p4d3 = prob4(-1, -1)
p4d4 = prob4(1, -1)
p5d1 = prob5()

# Generate the graphs #########################################################
plot1_1 = random_trajectories(p1d1, x, 50, 3)
plot1_2 = random_trajectories(p1d2, x, 50, 3)
plot2_1 = random_trajectories(p2d1, x, 50, 3)
plot2_2 = random_trajectories(p2d2, x, 50, 3)
plot3_1 = random_trajectories(p3d1, x, 50, 3)
plot3_2 = random_trajectories(p3d2, x, 50, 3)
plot3_3 = random_trajectories(p3d3, x, 50, 3)
plot4_1 = random_trajectories(p4d1, x, 50, 5)
plot4_2 = random_trajectories(p4d2, x, 50, 4)
plot4_3 = random_trajectories(p4d3, x, 50, 3)
plot4_4 = random_trajectories(p4d4, x, 50, 3)
# Re-done #plot5_1 = random_trajectories(p5d1, x, 5, 5) + random_trajectories(p5d1, x, 15, 5)
plot5_2 = random_trajectories(p5d1, x, manual_pts=[(0, i) for i in xrange(0, 6)])\
        + random_trajectories(p5d1, x, 5, 0.25, (1,0))\
        + random_trajectories(p5d1, x, 5, 0.25, (-1,0))\
        + random_trajectories(p5d1, x, 5, 0.25, (0,0))

plot_4a = plot(lambda x: 0., xmin=-5, xmax=0, thickness=2.)\
        + plot(lambda x: 0., xmin=0, xmax=5, thickness=2., linestyle='--')\
        + plot(lambda a: sqrt(-a), xmin=-5, xmax=0, linestyle='--')\
        + plot(lambda a: -sqrt(-a), xmin=-5, xmax=0, linestyle='--')

plot_4b = plot(lambda x: 0., xmin=-5, xmax=0, thickness=2.)\
        + plot(lambda x: 0., xmin=0, xmax=5, thickness=2., linestyle='--')\
        + plot(lambda a: sqrt(a), xmin=0, xmax=5)\
        + plot(lambda a: -sqrt(a), xmin=0, xmax=5)

# Output the graphs to files and show them ####################################
plot1_1.show(figsize=6, axes_labels=("$x$","$\\dot{x}$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p1-1.png")
plot1_2.show(figsize=6, axes_labels=("$x$","$\\dot{x}$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p1-2.png")
plot2_1.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p2-1.png")
plot2_2.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p2-2.png")
plot3_1.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p3-1.png")
plot3_2.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p3-2.png")
plot3_3.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p3-3.png")
plot4_1.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p4-1.png")
plot4_2.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p4-2.png")
plot4_3.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p4-3.png")
plot4_4.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p4-4.png")
# Re-done #plot5_1.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-20, ymax=10, filename="./hw6-p5-1.png")
plot5_2.show(figsize=6, axes_labels=("$x$","$y$"), xmin=-5, xmax=5, ymin=-20, ymax=10, filename="./hw6-p5-2.png")

plot_4a.show(figsize=6, axes_labels=("$\\alpha$","$x_c$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p4-bifa.png")
plot_4b.show(figsize=6, axes_labels=("$\\alpha$","$x_c$"), xmin=-5, xmax=5, ymin=-5, ymax=5, aspect_ratio=1, filename="./hw6-p4-bifb.png")
